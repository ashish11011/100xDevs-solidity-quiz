// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Contract {
    string public message;

    constructor() {
        message = "expected result";
    }

    function someFunction() public view returns (string memory) {
        //it should return a simple message given above
        return message;
    }
}