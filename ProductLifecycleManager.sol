// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

contract ProductLifecycleManager {
    enum ProductState { Created, InTransit, Delivered }
    
    struct Product {
        string id;
        string name;
        ProductState state;
        address currentHolder;
    }
    
    mapping(string => Product) public products;
    
    event ProductStateUpdated(string productId, ProductState state);

    function createProduct(string memory _id, string memory _name) public {
        products[_id] = Product(_id, _name, ProductState.Created, msg.sender);
    }

    function updateProductState(string memory _id, ProductState _state) public {
        Product storage product = products[_id];
        require(msg.sender == product.currentHolder, "Only the current holder can update the product state.");
        product.state = _state;
        emit ProductStateUpdated(_id, _state);
    }

    // Additional functions related to product lifecycle management can be added here.
}
