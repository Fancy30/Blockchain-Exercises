// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

    function Mike(uint _x) public pure returns(string memory) {

        /*if(_x < 10) {
            return "It is less than 10";
        } else {
            return "It is above 10";
        }*/

//Ternary Operator

    return _x < 10 ? "It is less than 10" : "It is above 10"; 
 }

/* Classwork Create a ternary operator for a number.
If it is less than 20 return i<20 and if it is above 20, return i>20.
*/

function Vick(uint _i) public pure returns(string memory) {

    return _i < 20 ? "i < 20" : "i > 20"; 
 }

}
