// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BlockchainTransactionLogger {
    event TransactionLogged(address indexed by, string action, string details, uint256 timestamp);

    function logTransaction(string memory action, string memory details) public {
        emit TransactionLogged(msg.sender, action, details, block.timestamp);
    }

    // This function could be extended to include transaction verification,
    // logging additional data, or integrating with external logging services.
}
