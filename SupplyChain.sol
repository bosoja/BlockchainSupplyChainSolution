// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract SupplyChain {
    struct Product {
        string productId;
        string name;
        string description;
        address currentHolder;
        bool authenticated;
        string[] history;
    }

    mapping(string => Product) public products;
    event ProductCreated(string productId, string name);
    event ProductUpdated(string productId, string location);
    event OwnershipTransferred(string productId, address newHolder);

    function createProduct(string memory productId, string memory name, string memory description) public {
        require(products[productId].currentHolder == address(0), "Product already exists.");
        products[productId] = Product(productId, name, description, msg.sender, true, new string[](0));
        emit ProductCreated(productId, name);
    }

    function updateProductHistory(string memory productId, string memory newCheckpoint) public {
        require(products[productId].authenticated, "Product is not authenticated.");
        require(products[productId].currentHolder == msg.sender, "Only the current holder can update the product history.");
        products[productId].history.push(newCheckpoint);
        emit ProductUpdated(productId, newCheckpoint);
    }

    function transferProduct(string memory productId, address newHolder) public {
        require(msg.sender == products[productId].currentHolder, "Only the current holder can transfer the product.");
        products[productId].currentHolder = newHolder;
        emit OwnershipTransferred(productId, newHolder);
    }
}
