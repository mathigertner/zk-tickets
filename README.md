# ARG25 Project Submission Template

## Project Title
ZK Tickets: Privacy-Preserving Ticketing Protocol for Fraud-Proof Event Access

## Team
- **Team/Individual Name:** ZK Tickets Labs
- **GitHub Handles:** @mathigertner
- **Devfolio Handles:** mathigertner

## Project Description

**ZK Tickets** is a privacy-first ticketing protocol that merges **NFT-based ownership** with **zero-knowledge access verification**.  
It enables event organizers to issue, manage, and verify tickets **without revealing user identity or exposing ticket data** — eliminating fraud, resale abuse, and identity leakage.

Traditional ticketing systems require centralized verification and manual ID checks. NFT-based models improve ownership but still expose buyer identities on-chain.  
ZK Tickets solves this by separating ownership (NFT) from validation (ZK Proofs), allowing users to prove:
> “I hold a valid ticket for this event and haven’t used it before.”  
— without revealing who they are or which ticket they own.

This approach creates a **fraud-resistant, privacy-preserving** foundation for digital and real-world events.

## Tech Stack

- **ZK Proofs:** Semaphore v4 (Groth16 SNARKs, Poseidon Hash, Merkle Trees, Nullifiers)  
- **Circuits:** Circom / Noir DSL (membership + nullifier constraints)  
- **Smart Contracts:** Solidity (ERC-721 / 1155 NFT collections)  
- **Backend:** Node.js (Express) + TypeScript + PostgreSQL  
- **Frontend Demo:** React + WASM proof generator  
- **Tools:** Docker, Hardhat, Forge, GitHub Actions (CI/CD)

## Objectives

By the end of ARG25, ZK Tickets aims to deliver:

- ✅ **ZK Group Management:** Create event groups and manage membership (Merkle trees).  
- ✅ **Ticket Minting:** Mint NFT tickets and link them to ZK membership commitments.  
- ✅ **Proof Generation:** Client-side module for local (off-chain) proof creation.  
- ✅ **Verification Service:** Off-chain verification engine with nullifier tracking.  

**Stretch Goals:**
- On-chain proof verifier for hybrid transparency.  
- Recursive proof aggregation for multi-ticket validation.  
- Seamless membership re-assignment for ticket transfers.

## Weekly Progress

### Week 1 (ends Oct 31)
**Goals:**
- Define event and membership architecture.  
- Establish roadmap for hybrid NFT + ZK system.  

**Progress Summary:**  
Scope definition completed.  
Focused on aligning architecture, problem framing, and technical feasibility.  
No development work was started during this phase.

### Week 2 (ends Nov 7)
**Goals:**  
- Implement off-chain proof generation and verification pipeline.  
- Develop REST API for event creation, member registration, and proof verification.  
- Build frontend demo to generate proofs via WASM.  

**Progress Summary:**  
ZK circuit (membership + nullifier) implemented in Circom.  
Local proof generation successful with valid verification responses in backend tests.

### 🗓️ Week 3 (ends Nov 14)
**Goals:**  
- Integrate NFT minting and ZK membership flow.  
- Deploy backend service and showcase full proof lifecycle (mint → prove → verify).  
- Prepare final demo and documentation for submission.  

**Progress Summary:**  
End-to-end prototype working off-chain.  
Final presentation materials and live demo in preparation.

## Final Wrap-Up

**Deliverables:**  
- Full backend API for event management and proof verification.  
- ZK circuit and verifier logic implemented with Semaphore v4.  
- NFT ticket minting + membership synchronization module.  
- Local proof demo showing private ticket validation.

- **Main Repository Link:** https://github.com/zktickets-labs/protocol  
- **Demo / Deployment Link (if any):** TBD  
- **Slides / Presentation (if any):** TBD  

## 🧾 Learnings

- Integrating NFTs with ZK proofs enables true privacy + auditability without friction.  
- Semaphore’s group model provides scalable, dynamic access control.  
- Off-chain proof verification removes cost and latency barriers for real-world adoption.  

## Next Steps

- Add delegated ticket transfers with automatic group re-sync.  
- Implement optional on-chain verifier contract.  
- Launch SDK for third-party event and ticketing platforms.  
