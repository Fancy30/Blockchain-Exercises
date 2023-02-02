/*Given an array 10,12,11,3 and 1
Do the following:
a. Delete the last element which is 1
b. Delete 12
c. Delete 10.*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tech4dev {

    uint[] public myArray = [10, 12, 11, 3, 1];

    function myArrayLength() public view returns(uint) {
        return myArray.length;
    }
    
    function deleteItem(uint index)public{
       //pop()method
       myArray[index] = myArray[myArray.length-1];
       myArray.pop();
    }
}
