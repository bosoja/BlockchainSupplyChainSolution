// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

interface ISupplyChainInterface {
    function registerProduct(string calldata productId, string calldata name, string calldata description) external;
    function updateProductCheckpoint(string calldata productId, string calldata checkpoint) external;
    function getProductDetails(string calldata productId) external view returns (string memory name, string memory description, string[] memory checkpoints);
    function transferProductOwnership(string calldata productId, address newOwner) external;
    event ProductRegistered(string productId, string name, string description, address owner);
    event ProductCheckpointUpdated(string productId, string checkpoint);
    event ProductOwnershipTransferred(string productId, address newOwner);
}
