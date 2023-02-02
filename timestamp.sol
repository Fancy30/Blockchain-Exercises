// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract time{

    function second () public view returns (uint) {
    return block.timestamp + 60 seconds;
    }

     function day () public view returns (uint) {
    return block.timestamp + 5 days;
    }

     function hour () public view returns (uint) {
    return block.timestamp + 3 hours;
    }
}
