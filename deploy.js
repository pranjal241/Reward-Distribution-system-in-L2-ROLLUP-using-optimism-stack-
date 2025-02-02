const { ethers } = require("hardhat");
const { RewardDistributor } = require("../contracts");

async function main() {
  const rewardDistributor = await ethers.getContractFactory("RewardDistributor");
  const instance = await rewardDistributor.deploy();
  await instance.deployed();

  console.log("RewardDistributor deployed to:", instance.address);
}

main()
  .then(() => process.exit(0))
  .catch((error) => {
    console.error(error);
    process.exit(1);
  });

