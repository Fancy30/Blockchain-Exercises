// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

    function loop() public pure returns(uint) {

        for(uint i = 0; i < 10; i++) {

            if(i == 3) {
                //return 3;
                continue;
            }

            if(i == 8) {

                break;
            }
            
        }

    }  
}
