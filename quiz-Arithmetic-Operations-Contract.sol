// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Arithmetic {
    function add(uint a, uint b) public pure returns (uint) {
        //complete this
        return a+b;
    }

    function subtract(uint a, uint b) public pure returns (uint) {
        //complete this with a validation that a >= b
        require(a >= b , "Value subtracting is large");
        return a - b ;
    }

    function multiply(uint a, uint b) public pure returns (uint) {
        //complete this
        return a * b;
    }

    function divide(uint a, uint b) public pure returns (uint) {
        //complete this with validation b != 0
        require(b!=0,"Cannot devide by zero");
        return a / b;
    }
}
