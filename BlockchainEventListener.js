import Web3 from 'web3';
import ProductLifecycleManagerABI from './abis/ProductLifecycleManager.json';

class BlockchainEventListener {
    constructor() {
        this.web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
        this.productLifecycleManager = new this.web3.eth.Contract(
            ProductLifecycleManagerABI,
            'CONTRACT_ADDRESS' // Replace with your contract's address
        );
    }

    startListening() {
        this.productLifecycleManager.events.ProductStateUpdated({}, function(error, event) {
            if (error) console.error(error);
            console.log("Product State Updated Event:", event.returnValues);
            // Update the UI accordingly
        });
    }
}

export default new BlockchainEventListener();
