// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract DataAggregator {
    struct ProductData {
        uint256 timestamp;
        string productId;
        string dataPoint;
        string value;
    }

    ProductData[] public dataPoints;

    function recordData(string memory productId, string memory dataPoint, string memory value) public {
        dataPoints.push(ProductData(block.timestamp, productId, dataPoint, value));
    }

    function getDataPoints() public view returns (ProductData[] memory) {
        return dataPoints;
    }
}
