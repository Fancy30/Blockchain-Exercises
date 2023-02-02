// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

     /* Create a function that will increase state variable by two and increase it by 5, then
      create another function that will decrease the state variable by3.
       Then create a function that can pause and another that can unpause the contract.
    bool public pau;
    uint public counter;
    modifier Donot_pause(){
        require(!paused);
        _;   
    }
     function setPause() public {
        paused = true;   
    }
     function setUnPause() public {
          paused = false;   
    }
    function increment() public Donot_pause() {
        counter += 2;
        counter += 5;
    }
    function decrement() public Donot_pause() {
        counter -= 3;
    }
    */

    /* Classwork Create a function that increases state variable by 2 and 
    another function that decrease the state variable by 1.
    Create a function that can pause the contract.
    Remember to use modifier.
    */

    bool public paused;
    uint public count;

    modifier whenNotPaused(){
        require(!paused);
        _; 
        //put some codes here
        count +=20;  
    }

     function setPause(bool _x) public {
        paused = _x;   
    }

    function increase() public whenNotPaused() {
        count += 2;
    }

    function decrease() public whenNotPaused() {
        count -= 1;
    }

}
