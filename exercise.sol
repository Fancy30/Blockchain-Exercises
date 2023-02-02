// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev{

// CLASS WORK 1 Create a function that will return the address of the person interacting with the contract.
//address sender = msg.sender;​

    function Victoria() public view returns(address) {

        address sender = msg.sender;

        return(sender);

    } 

 // CLASSWORK 2 Create a function that will return timestamp in solidity.

    function Tonia() public view returns(uint) {

        uint timestamp = block.timestamp;

        return(timestamp);

    }  

/*CLASSWORK 3 Create a variable called Michael which is a state variable that is equal to 100.
Then create a function called add where we increase Michael by 5 and immediately increase Michael by 2.
Moreso, create a function that will decrease Michael by 3*/

    uint public Michael = 100;

    function add() public{
        
        Michael +=5;

        Michael +=2;
    } 
    function decrease() public{

        Michael -=3;
    } 
     
}
