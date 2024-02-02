import Web3 from 'web3';
import SupplyChainContract from './build/contracts/SupplyChain.json';

class BlockchainHelper {
    constructor() {
        this.web3 = new Web3(Web3.givenProvider || "ws://localhost:8545");
        this.contract = null;
        this.init();
    }

    async init() {
        try {
            await this.web3.eth.requestAccounts();
            const networkId = await this.web3.eth.net.getId();
            const deployedNetwork = SupplyChainContract.networks[networkId];
            this.contract = new this.web3.eth.Contract(
                SupplyChainContract.abi,
                deployedNetwork && deployedNetwork.address,
            );
        } catch (error) {
            console.error("Could not connect to contract or chain: ", error);
        }
    }

    async registerProduct(productId, name, description, price) {
        const accounts = await this.web3.eth.getAccounts();
        await this.contract.methods.registerProduct(productId, name, description, price).send({ from: accounts[0] });
    }

    async getProductDetails(productId) {
        const productDetails = await this.contract.methods.getProduct(productId).call();
        return productDetails;
    }

    // Additional helper methods for interacting with the contract can be added here.
}

export default BlockchainHelper;
