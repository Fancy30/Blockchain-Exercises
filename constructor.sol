// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {
    
    address public owner;
    string public name;
    string public symbol;
    uint public decimal;

    constructor() public {
        owner = msg.sender;
        name = "Vick Token";
        symbol = "VKT";
        decimal = 18;
    } 
}
