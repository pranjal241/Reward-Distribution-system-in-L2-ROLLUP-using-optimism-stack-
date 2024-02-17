pragma solidity ^0.8.0;

import "./RewardDistributor.sol";

contract L1Bridge {
    RewardDistributor public rewardDistributor;

    event RewardsDistributed(address[] indexed recipients, uint256[] indexed amounts);

    constructor(address payable _rewardDistributorAddress) {
        rewardDistributor = RewardDistributor(_rewardDistributorAddress);
    }

    function distributeRewards(address[] memory _recipients, uint256[] memory _amounts) external payable {
        require(msg.value > 0, "No ETH sent");
        require(_recipients.length == _amounts.length, "Invalid recipient or amount");

        // Store the ETH sent by the user
        uint256 totalAmount = 0;
        for (uint256 i = 0; i < _amounts.length; i++) {
            totalAmount += _amounts[i];
        }
        require(totalAmount <= msg.value, "Total reward amount exceeds ETH sent");

        // Emit an event with the recipient addresses and reward amounts
        emit RewardsDistributed(_recipients, _amounts);
    }
}