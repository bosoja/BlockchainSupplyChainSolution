import Web3 from 'web3';
import Web3Modal from 'web3modal';

class UserSessionManager {
    constructor() {
        this.web3Modal = new Web3Modal({
            network: "rinkeby", // Change to your network
            cacheProvider: true, // Optional
            providerOptions: {} // Required for specific wallet providers
        });
        this.web3 = null;
        this.provider = null;
    }

    async connectWallet() {
        this.provider = await this.web3Modal.connect();
        this.web3 = new Web3(this.provider);

        this.provider.on("accountsChanged", (accounts) => {
            console.log("Accounts changed", accounts);
            // Handle accounts change
        });

        this.provider.on("chainChanged", (chainId) => {
            console.log("Chain changed", chainId);
            // Handle chain change
        });

        this.provider.on("disconnect", (error) => {
            console.log("Provider disconnected", error);
            // Handle provider disconnection
        });

        // Fetch and return the connected accounts
        const accounts = await this.web3.eth.getAccounts();
        return accounts;
    }

    // Add more session management functionalities as needed
}

export default new UserSessionManager();
