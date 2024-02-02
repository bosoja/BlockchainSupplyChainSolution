const Web3 = require('web3');
const dataAggregatorAbi = require('./abis/DataAggregator.json');

const web3 = new Web3('http://localhost:8545');
const dataAggregatorAddress = 'CONTRACT_ADDRESS'; // Replace with actual address
const dataAggregator = new web3.eth.Contract(dataAggregatorAbi, dataAggregatorAddress);

async function fetchAndAnalyzeData() {
    const dataPoints = await dataAggregator.methods.getDataPoints().call();
    // Implement your analytics logic here
    // For example, counting products by type, identifying bottlenecks, etc.
}

module.exports = { fetchAndAnalyzeData };
