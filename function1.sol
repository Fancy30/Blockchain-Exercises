// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev{

/*
    uint public number; //state variables
    string public name; //state variables
    String a = "Ndianaobong"; //state variable
    uint y = 3; //local variable
    function add() public view returns(uint){
        uint storeData = 2; //local variable
        return storeData;
    }
    function subtract() public view returns(uint){
        uint userInput = 5; //local variable
        return userInput + 2;
    }
*/  

    uint public number;

    function add() public view returns(uint){
        return number;
    }

    function subtract() public view returns(uint){
        return number + 2;
    }
   
}
