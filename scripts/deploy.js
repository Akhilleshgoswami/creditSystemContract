const {ethers} = require("ethers")
async function main() {
  const [deployer] = await ethers.getSigners()
  const creditToken = await ethers.getContractFactory("CreditToken");
  const creditTokens = await creditToken.deploy("creditToken", "CRToken");
  // await creditTokens.deployed();
//  const creditSys = await hre.ethers.getContractFactory("CreditSystem");
//  const creditSystem = await creditSys.deploy(creditTokens.address);
//  await creditSystem.deployed();
// console.log( "my contract" ,creditSystem.address)
}
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});