
# Internship

This project is a basic blockchain implementation in Solidity. It simulates a simple blockchain with essential features like block creation, proof-of-work (mining), and chain validation. The contract allows users to add new blocks with transactions and ensures the integrity of the blockchain by verifying hashes.

## Features

 **Genesis Block**: The first block in the blockchain is automatically created.

 **Block Structure**: Each block contains an index, timestamp, transactions, previous block hash, current block hash, and a nonce.

 **Mining (Proof-of-Work)**: A simple proof-of-work mechanism ensures computational work is required to add a block.

 **Blockchain Integrity**: A method to verify that the chain is valid and has not been tampered with.

## Requirements

 **Remix IDE**: [https://remix.ethereum.org/](https://remix.ethereum.org/)

 **Solidity Compiler**: Version 0.8.0 or higher

## How to Run the Smart Contract

To run this smart contract, first, open [Remix IDE](https://remix.ethereum.org/) in your browser. Once inside, create a new Solidity file named `Internship.sol` in the **File Explorer** by clicking the **+** icon. Copy and paste the Solidity code provided below into the file. 

Next, navigate to the **Solidity Compiler** tab, select compiler version `0.8.0` or higher, and click **Compile Internship.sol**. After a successful compilation, go to the **Deploy & Run Transactions** tab and click **Deploy** to deploy the contract to the Remix VM.

Once deployed, you can interact with the blockchain using the contract's functions. To add a block, locate the `addBlock` function, enter a transaction string (e.g., `"Abhinesh pays 10 ETH to HR"`), and click **Transact**. To view the latest block, use the `getLatestBlock` function. To verify the integrity of the blockchain, click `isChainValid`. If the function returns `true`, the blockchain has not been tampered with.

## Author
**Abhinesh Kumar**
