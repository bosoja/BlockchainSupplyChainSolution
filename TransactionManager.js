import BlockchainHelper from './BlockchainHelper';

class TransactionManager {
    constructor() {
        this.blockchainHelper = new BlockchainHelper();
    }

    async sendTransaction(method, params, fromAddress) {
        const transaction = this.blockchainHelper.contract.methods[method](...params);
        const gas = await transaction.estimateGas({ from: fromAddress });
        const gasPrice = await this.blockchainHelper.web3.eth.getGasPrice();
        return transaction.send({ from: fromAddress, gas, gasPrice });
    }

    // Additional methods for transaction management can be added here
}

export default new TransactionManager();
