// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {
    bool public checker;
    function micro(uint x) public returns(bool){
        if(x < 10){
            checker = true;
            return checker;
        }else{
            checker = false;
            return checker;
        }
    }

    /*
    Create a variable mike and set it 
    to true when the user input number less than or equal to 20.*/

    bool public mike;
    function tech(uint x) public returns(bool){
        if(x <= 20){
            mike = true;
            return mike;
        }else{
            mike = false;
            return mike;
        }
    }

/*
Create a variable called Corei7.
Then create a function which set the state variable to true 
when the inputed number is less than or equal to 10, to false when it is less than 20, 
to true when it is less than 30, false when 
it is less than or equal to 50.*/

    bool public corei7;
    function Moz(uint x) public returns(bool){
        if(x <= 10){
            corei7 = true;
            return corei7;
        }else if(x < 20){
            corei7 = false;
            return corei7;
        }else if(x < 30){
            corei7 = true;
            return corei7;
        }else{
            corei7 = false;
            return corei7;
        }
    }
}
