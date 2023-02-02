// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

    /*Create a function that will increase state variable by two and increase it by 5, then
      create another function that will decrease the state variable by3.
       Then create a function that can pause and another that can unpause the contract.
    */
   bool public paused;
    uint public count;

    function setPause(bool _x) public {
        paused = _x;
    }

    function increase() public {
        require(!paused);
        count += 1;
    }

    function decrease() public {
        require(!paused);
        count -= 1;
    }

    
}
