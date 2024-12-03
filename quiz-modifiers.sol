// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract OwnerOnly {

    address owner;

    constructor(){
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "not the owner");
       _;
    }

    function protectedFunction() public view onlyOwner returns (string memory) {
        return "I am the owner";
    }
}