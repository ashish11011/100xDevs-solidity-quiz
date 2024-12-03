// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract UserBalance {

    mapping(address => uint256 ) balances;

    function deposit(uint256 amount) public {
        if(balances[msg.sender] >= 0){
            balances[msg.sender] += amount;
        }
        else{
            balances[msg.sender] = amount;
        }
    }

    function getBalance() public view returns (uint256) {
        uint256 userBalance = balances[msg.sender];
        return userBalance;
    }
}
