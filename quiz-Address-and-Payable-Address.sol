// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Wallet {

    address owner;
    uint256 balance;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "not the owner");
        _;
    }

    function deposit() public payable {
        balance += msg.value;
    }

    function withdrawAll() public payable  onlyOwner {
        payable(owner).transfer(balance);
        balance = 0;
    }

    function getBalance() public view returns (uint256) {
        return balance;
    }
}
