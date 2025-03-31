// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;


contract Internship {
    
    // attributes of the block 
    struct Block {
        uint index; // Block index in the chain
        uint timestamp; // Time of block creation
        string transactions; // Transaction data stored in block
        bytes32 previousHash; // Hash of the previous block
        bytes32 hash; // Hash of the current block
        uint nonce; // Nonce used for Proof-of-Work
    }

    Block[] public chain; // Array to store the blockchain
    uint public difficulty = 2; // Difficulty level for mining (PoW)

    // Constructor to initialize the blockchain with the genesis block
    constructor() {
        chain.push(createGenesisBlock());
    }

    // Creates the first block (genesis block) in the blockchain
    function createGenesisBlock() private view returns (Block memory) {
        return Block(0, block.timestamp, "Genesis Block", bytes32(0), bytes32(0), 0);
    }

    // Retrieves the latest block in the chain
    function getLatestBlock() public view returns (Block memory) {
        return chain[chain.length - 1];
    }

    // Adds a new block to the blockchain with given transactions
    function addBlock(string memory transactions) public {
        Block memory latestBlock = getLatestBlock();
        Block memory newBlock = Block(
            chain.length, // New block index
            block.timestamp, // Current timestamp
            transactions, // Transactions in the new block
            latestBlock.hash, // Linking to the previous block
            bytes32(0), // Placeholder for new block hash
            0 // Initial nonce value
        );
        newBlock.hash = mineBlock(newBlock); // Perform mining (PoW)
        chain.push(newBlock); // Append the new block to the chain
    }

    // Mining function to perform Proof-of-Work by finding a valid hash
    function mineBlock(Block memory blockToMine) private view returns (bytes32) {
        bytes32 hash;
        uint nonce = 0;
        while (uint256(hash) >> (256 - difficulty) != 0) { // Condition for mining difficulty
            hash = keccak256(abi.encodePacked(
                blockToMine.index,
                blockToMine.timestamp,
                blockToMine.transactions,
                blockToMine.previousHash,
                nonce
            ));
            nonce++;
        }
        return hash;
    }

    // Validates the blockchain integrity by checking hash links
    function isChainValid() public view returns (bool) {
        for (uint i = 1; i < chain.length; i++) {
            // Ensure the previous hash matches the recorded previous block hash
            if (chain[i].previousHash != chain[i - 1].hash) {
                return false;
            }
            // Recalculate the block hash and verify its integrity
            if (chain[i].hash != mineBlock(chain[i])) {
                return false;
            }
        }
        return true; // Return true if the blockchain is valid
    }
}
