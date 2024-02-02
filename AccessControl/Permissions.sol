// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract Permissions is AccessControl {
    bytes32 public constant MANUFACTURER_ROLE = keccak256("MANUFACTURER_ROLE");
    bytes32 public constant DISTRIBUTOR_ROLE = keccak256("DISTRIBUTOR_ROLE");
    bytes32 public constant RETAILER_ROLE = keccak256("RETAILER_ROLE");

    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function addManufacturer(address account) public {
        grantRole(MANUFACTURER_ROLE, account);
    }

    function addDistributor(address account) public {
        grantRole(DISTRIBUTOR_ROLE, account);
    }

    function addRetailer(address account) public {
        grantRole(RETAILER_ROLE, account);
    }

    function isManufacturer(address account) public view returns (bool) {
        return hasRole(MANUFACTURER_ROLE, account);
    }

    function isDistributor(address account) public view returns (bool) {
        return hasRole(DISTRIBUTOR_ROLE, account);
    }

    function isRetailer(address account) public view returns (bool) {
        return hasRole(RETAILER_ROLE, account);
    }
    
    // Add other roles and permissions as needed
}
