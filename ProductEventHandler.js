import BlockchainHelper from './BlockchainHelper';

class ProductEventHandler {
    constructor() {
        this.blockchainHelper = new BlockchainHelper();
        this.initEventListeners();
    }

    initEventListeners() {
        this.blockchainHelper.contract.events.ProductRegistered({})
            .on('data', (event) => {
                console.log('Product Registered:', event.returnValues);
                // Handle the event in the UI
            })
            .on('error', console.error);

        // Additional event listeners for other contract events can be added here
    }
}

export default new ProductEventHandler();
