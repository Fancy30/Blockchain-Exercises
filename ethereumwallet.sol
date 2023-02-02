// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tech4dev {

    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    } 

    receive() external payable{}

    //create get function
    function getBalance() public view returns (uint) {
        return address(this).balance;

    }

    //create a withdraw function
    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Thief you are not the owner");
        payable(msg.sender).transfer(_amount);
    }

    //Anyone can withdraw
    function Anybodycanwithdraw(uint _amount, address payable _to) public {
        _to.transfer(_amount);
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tech4dev {
/*
Class Work
Create a contract that can receive ether.
The contract will have the following functions:
Get function
Withdraw Function
|*/
    address payable public owner;

    constructor(){
        owner = payable(msg.sender);
    } 
    receive() external payable{}

    //getBalance function
    function getBalance() public view returns (uint) {
        return address(this).balance;

    }

    //Withdraw function
    function withdraw(uint _amount) public {
        require(msg.sender == owner, "Error you are not the owner");
        payable(msg.sender).transfer(_amount);
    }
}
