
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Voting {

    address owner;
    string[] public names;
    mapping (uint256 => uint256) voatingArray;

    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner(){
        require(owner == msg.sender, "not the owner");
        _;
    }

    function addCandidates(string[] memory _names) public onlyOwner {
        for(uint i; i<= _names.length; i++){
            names.push(_names[i]);
        }
    }

    function vote(uint256 candidateId) public {
        require(candidateId < names.length,"ID not valid");
        voatingArray[candidateId] += 1;
    }

    function getVotes(uint256 candidateId) public view returns (uint256) {
        require(candidateId < names.length,"ID not valid");
        return voatingArray[candidateId];
    }
}
