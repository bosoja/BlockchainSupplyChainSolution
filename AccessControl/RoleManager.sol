// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/access/AccessControl.sol";

contract RoleManager is AccessControl {
    constructor() {
        _setupRole(DEFAULT_ADMIN_ROLE, msg.sender);
    }

    function grantRole(bytes32 role, address account) public override onlyRole(getRoleAdmin(role)) {
        super.grantRole(role, account);
    }

    function revokeRole(bytes32 role, address account) public override onlyRole(getRoleAdmin(role)) {
        super.revokeRole(role, account);
    }

    function hasRole(bytes32 role, address account) public view override returns (bool) {
        return super.hasRole(role, account);
    }
    
    // Custom functions for managing roles specific to the supply chain can be added here
}
