// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Bitcoin{
    function places() public returns(string memory){
        return "so this love";
    }
}


contract Ethereum is Bitcoin{
    function user() public returns(string memory){
        return "This is from ethereum";
    }
}

/*Class Work
Create a contract tech4dev followed
by a function which takes in string.
Return how are you.
In the second contract named Damilare,
which will inherit the first contract.
Create a function which takes in string, and return
this is the second contract.*/

contract tech4dev{
    function data() public returns(string memory){
        return "How are you?";
    }
}

contract Damilare is tech4dev{
    function user() public returns(string memory){
        return "this is the second contract";
    }
}
