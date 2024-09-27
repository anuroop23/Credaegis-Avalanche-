// SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;
///pragma evm-version >= cancun;

contract HashStore {

    // Mapping to store the hash with an ID (or any identifier)
    mapping(uint256 => string) private hashes;

    // Event to notify when a hash is stored
    event HashStored(uint256 indexed id, string hash, string message);
    
    // Event to notify when a hash is retrieved
    event HashRetrieved(uint256 indexed id, string hash, string message);
    
    // Event to notify when a hash is verified
    event HashVerified(uint256 indexed id, bool isVerified, string message);

    // Function to store the given hash
    function storeHash(uint256 id, string memory hash) public {
        // Store the hash in the mapping
        hashes[id] = hash;

        // Emit an event for the stored hash
        emit HashStored(id, hash, "Hash stored successfully.");
    }

    // Function to retrieve a stored hash by its ID
    function getHash(uint256 id) public returns (string memory) {
        string memory storedHash = hashes[id];

        // Emit an event indicating the completion of the getHash process
        emit HashRetrieved(id, storedHash, "Hash retrieved successfully.");
        
        return storedHash;
    }

    // Function to verify the stored hash against a given hash
    function verifyHash(uint256 id, string memory hashToVerify) public returns (bool) {
        // Retrieve the stored hash
        string memory storedHash = hashes[id];

        // Compare the stored hash with the given hash
        bool isVerified = (keccak256(abi.encodePacked(storedHash)) == keccak256(abi.encodePacked(hashToVerify)));

        // Emit an event indicating the completion of the verifyHash process
        emit HashVerified(id, isVerified, isVerified ? "Hash verified successfully." : "Hash verification failed.");
        
        return isVerified;
    }
}
