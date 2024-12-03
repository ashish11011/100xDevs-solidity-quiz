
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StatusContract {

    enum Status { Active, Pending, Completed }
    address owner;
    Status public currentStatus;
    uint balance;

    constructor (){
        owner = msg.sender;
        currentStatus = Status.Pending;
    }

    event StatusChanged(Status currentStatus);

    modifier onlyOwner(){
        require(owner == msg.sender, "not the owner");
        _;
    }

    function activate() external onlyOwner {
        currentStatus = Status.Active;
        emit StatusChanged(currentStatus);
    }

    function complete() external onlyOwner {
        require(currentStatus == Status.Active,"Contract should be active before completing");
        currentStatus = Status.Completed;
        emit StatusChanged(currentStatus);
    }

    function fundContract() external payable {
        balance += msg.value;
    }

    function _getStatus() internal view returns (Status) {
        return currentStatus;
    }

    function isComplete() external view returns (bool) {
        return currentStatus == Status.Completed;
    }
    function contractBalance() public view returns( uint){
        return balance;
    }

    function drainBalance() public payable  onlyOwner (){
        require(currentStatus == Status.Completed, "The contract is not completed yet");
        payable(owner).transfer(balance);
        balance = 0;
    }
}
