// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev{

    uint intel = 10;

    function increase() public{
        
        //count = count + 1; method 1
        //count++; method 2
        //count +=1; method 3

        intel +=5;
    } 
    function decrement() public{
        
        //count = count - 1; metod 1
        //count--; method 2
        //count -=1; method 3

        intel -=2;
    } 

}
