// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract tech4dev{

    mapping(address=> uint) public favouriteNumber;

    function setMyNumber(uint _myNumber) public{

        //update our 'favouriteNumber' mapping to store '_myNumber' under 'msg.sender'

        favouriteNumber[msg.sender] = _myNumber; 

        //The syntax for storing data in a mapping is just like with Arrays
    } 

    function whatIsMyNumber() public view Returns(uint){
        //Retrieve the value stored in the sender's address
        //Will be '0' if the sender hasn't called 'setMyNumber' yet
        
        Return favouriteNumber[msg.sender];

    } 
}
