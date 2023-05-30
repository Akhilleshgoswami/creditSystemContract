/* eslint-disable no-undef */
require("@nomiclabs/hardhat-waffle");
require("@nomiclabs/hardhat-etherscan");
require("@nomiclabs/hardhat-ethers");

const dotenv = require("dotenv");
dotenv.config();

task("accounts", "Prints the list of accounts", async (taskArgs, hre) => {
  const accounts = await hre.ethers.getSigners();

  for (const account of accounts) {
    console.log(account.address);
  }
});

/**
 * @type import('hardhat/config').HardhatUserConfig
 */
module.exports = {
  solidity: "0.8.18",
  networks: {
    hardhat: {
      accounts: {
        accountsBalance: "100000000000000000000000000000000000000000",
        mnemonic: process.env.MNEMONIC,
      },
    arbitrumGoerli: {
      url: `https://arbitrum-goerli.infura.io/v3/${process.env.INFURA_KEY}`,
      accounts: [process.env.PRIVATE_KEY],
    },
   
  },
  etherscan: {
    apiKey: process.env.ETHERSCAN_API_KEY,
  },
}
};