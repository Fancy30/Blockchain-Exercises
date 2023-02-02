// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev{


/*address sender = msg.sender;
uint timestamp = block.timestamp;
unit blocknum = block.number;*/


    function Victoria() public view returns(address, uint, uint) {

        address sender = msg.sender;

        uint timestamp = block.timestamp;

        uint blocknum = block.number;

        return(sender, timestamp, blocknum);

    }  
}
