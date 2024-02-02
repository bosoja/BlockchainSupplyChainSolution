// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;

import "@chainlink/contracts/src/v0.8/interfaces/AggregatorV3Interface.sol";

contract ExternalDataSourceConnector {
    AggregatorV3Interface internal dataSource;

    constructor(address _dataSourceAddress) {
        dataSource = AggregatorV3Interface(_dataSourceAddress);
    }

    function getExternalData() public view returns (int) {
        (
            , 
            int data,
            ,
            ,
            
        ) = dataSource.latestRoundData();
        return data;
    }

    // You can expand this contract to interact with various external data sources
    // and integrate them into your supply chain logic.
}
