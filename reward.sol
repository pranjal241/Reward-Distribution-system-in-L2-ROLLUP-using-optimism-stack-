pragma solidity ^0.8.0;

contract RewardableContract {
    mapping(address => uint256) public rewards;
    uint256 public totalRewards;

    function accumulateRewards(address user, uint256 amount) public {
        rewards[user] += amount;
        totalRewards += amount;
    }

    function claimRewards() public {
        uint256 amount = rewards[msg.sender];
        rewards[msg.sender] = 0;
        transferRewards(msg.sender, amount);
    }

    function transferRewards(address user, uint256 amount) internal {

    }
}
