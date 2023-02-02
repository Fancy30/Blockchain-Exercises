// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {

    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {
/*
Class Work
Create a contract that can receive an ether.
Also create function deposit and function get balance.
*/
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function deposit() public payable {

    }

    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}       
