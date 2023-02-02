// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract Division {
    using Strings for uint256;

    function division(uint256 decimalPlaces, uint256 numerator, uint256 denominator) public pure returns(uint256 quotient, uint256 remainder, string memory result) {
        uint256 factor = 10**decimalPlaces;
        quotient  = numerator / denominator;
        remainder = (numerator * factor / denominator) % factor;
        result = string(abi.encodePacked(quotient.toString(), '.', remainder.toString()));
         uint256 p = 100;
         uint256 r = 20;
         uint56 t = 2;
         uint256 i = (p*r*t)/100;
         return i;
    }  
}
