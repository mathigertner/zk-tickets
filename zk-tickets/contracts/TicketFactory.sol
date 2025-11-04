// SPDX-License-Identifier: MIT
pragma solidity ^0.8.23;

import "./TicketNFT.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "@openzeppelin/contracts/proxy/Clones.sol";

contract TicketFactory is Ownable {
    using Clones for address;

    // Implementación base (ERC-721 inicializable) a clonar
    address public implementation;

    // eventId => contrato ERC-721 del evento
    mapping(uint256 => address) public eventContractOf;
    // listado (opcional) para iteración/indexado
    address[] public allEvents;

    // --- Errores y eventos ---
    error InvalidImplementation();
    error EventAlreadyExists();
    error ZeroAddressOwner();

    event ImplementationUpdated(address indexed newImplementation);
    event EventCreated(
        uint256 indexed eventId,
        address indexed nft,
        string name,
        string symbol
    );

    constructor(address impl) Ownable(msg.sender) {
        if (impl == address(0)) revert InvalidImplementation();
        implementation = impl;
        emit ImplementationUpdated(impl);
    }

    // Rotar la implementación base (nueva versión auditada)
    function setImplementation(address impl) external onlyOwner {
        if (impl == address(0)) revert InvalidImplementation();
        implementation = impl;
        emit ImplementationUpdated(impl);
    }

    // Dirección determinística del clone para un eventId dado
    function predictEventAddress(
        uint256 eventId
    ) public view returns (address) {
        bytes32 salt = keccak256(abi.encodePacked(eventId));
        return implementation.predictDeterministicAddress(salt, address(this));
    }

    // Crea el contrato ERC-721 del evento (clone determinístico) e inicializa su estado
    function createEvent(
        uint256 eventId,
        string calldata name_,
        string calldata symbol_,
        string[] calldata ticketTypeNames_,
        string calldata baseURI_,
        string calldata contractURI_,
        address organizerOwner
    ) external onlyOwner returns (address nft) {
        if (eventContractOf[eventId] != address(0)) revert EventAlreadyExists();
        if (organizerOwner == address(0)) revert ZeroAddressOwner();

        bytes32 salt = keccak256(abi.encodePacked(eventId));
        nft = implementation.cloneDeterministic(salt);

        TicketNFT(nft).initialize(
            eventId,
            name_,
            symbol_,
            ticketTypeNames_,
            baseURI_,
            contractURI_,
            organizerOwner
        );

        eventContractOf[eventId] = nft;
        allEvents.push(nft);

        emit EventCreated(eventId, nft, name_, symbol_);
    }

    // Helpers de listado
    function getEventsCount() external view returns (uint256) {
        return allEvents.length;
    }

    function getEventAt(uint256 index) external view returns (address) {
        return allEvents[index];
    }
}
