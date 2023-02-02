//Simple Interest
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Interest{

    //Simple interest I = (P*R*T)/100
   //Calculate the simple interest if the rate is 20%
  //per annum for 2 years on a principal of $100. 
 function getResult() public view returns(uint){
        uint p = 100;
        uint r = 20;
        uint t = 2;

        uint I = (p * r * t)/100;

        return I;
    }
}
//INTEREST.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Interest{

    //Simple interest I = (P*R*T)/100
   //Calculate the simple interest if the rate is 20%
  //per annum for 2 years on a principal of $100. 
   

    function getResult() public view returns(uint){
        uint p = 100;
        uint r = 20;
        uint t = 2;

        uint I = (p * r * t)/100;

        return I;
    }
}


//RAISE TO POWER.sol
pragma solidity ^0.8.0;

contract Interest{

    function getResult() public view returns(uint){
        uint a = 5;
        uint b = 2;
        uint c = (a ** b);

         return c;
    }
}

DECIMAL.sol
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/utils/Strings.sol";

contract Division {
    using Strings for uint256;

    function division(uint256 decimalPlaces, uint256 numerator, uint256 denominator) public view returns(uint256 quotient, uint256 remainder, string memory result) {
        uint256 factor = 10**decimalPlaces;
        quotient  = numerator / denominator;
        bool rounding = 2 * ((numerator * factor) % denominator) >= denominator;
        remainder = (numerator * factor / denominator) % factor;
        if (rounding) {
            remainder += 1;
        }
        result = string(abi.encodePacked(quotient.toString(), '.', numToFixedLengthStr(decimalPlaces, remainder)));
    }

    function numToFixedLengthStr(uint256 decimalPlaces, uint256 num) pure internal returns(string memory result) {
        bytes memory byteString;
        for (uint256 i = 0; i < decimalPlaces; i++) {
            uint256 remainder = num % 10;
            byteString = abi.encodePacked(remainder.toString(), byteString);
            num = num/10;
        }
        result = string(byteString);
    }
   
}

DECIMAL NUMBER.sol
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
