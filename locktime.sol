//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "https://github.com/OpenZeppelin/openzeppelin-contracts/blob/master/contracts/utils/math/SafeMath.sol";
 
contract LockIt{
// calling SafeMath will add extra functions to the uint data type
using SafeMath for uint;
 
/*WHAT WE DID HERE
This contract is designed to act as a time vault.
// User can deposit into this contract but cannot withdraw for atleast a week.
// User can also extend the wait time beyond the 1 week waiting period.

/*
1. Deploy TimeLock
2. Deploy Attack with address of TimeLock
3. Call Attack.attack sending 1 ether. You will immediately be able to
   withdraw your ether.

What happened?
Attack caused the TimeLock.lockTime to overflow and was able to withdraw
before the 1 week waiting period.
*/
/* TimeLock is a contract that publishes a transaction to be executed in the future. 
After a mimimum waiting period, the transaction can be executed.
TimeLocks are commonly used in DAOs. */
/* Amount of ether you deposited is saved in balances. NOTE, balances cannot be in nested mapping
 We created a mapping for balances and the locktime, we specified the address & uint(amount), 
 for locktime, the address and the amount left as at the time the contract/balance was locked
 Here we mapped the address of each transactor with the amount available. 
 Here we are attaching an amount represented by uint and the address of the owner
 Locktime mapping is the period of time the particular amount will be in the address for.
 Mapping called Balances is cos we have several ppl who may b interest so we can be able to map
  the address of each person to the amount contributed.
Mapping Locktime is for eg diff people are interested at diff time, the timelock will map 
each persons address to the time each person will be able to withdraw amount deposited.

  Adress and the uint is to  */
    mapping(address => uint) public balances;

// when you can withdraw is saved in lockTime
    mapping(address => uint) public  lockTime;
    
     function deposit() external payable {
        //we updated the update balance
        balances[msg.sender] +=msg.value;
        //updates locktime 1 week from now
        lockTime[msg.sender] = block.timestamp + 1 weeks;
    }
 /* the function that is commented out is vulnerable to overflow by updating the function 
 below with a very large number to prevent this use safe math to prevent overflow
 function increaseLockTime(uint _secondsToIncrease) public {
    lockTime[msg.sender] += _secondsToIncrease;
    }
     The person that can increase the locktime period depends on what you set it to, mayb the */
    function increaseLockTime(uint _time) public {
    /* the add function below is from safemath and will take care of uint overflow
     if a call to add causes an error an error will be thrown and the call to the
      function will fail */
     /* lockTime[msg.sender] += _time; rewrite this code(this is the one the attacker is
      attacking) and replace with line 67*/
        // lockTime[msg.sender] = lockTime[msg.sender] + _time, method 2
        /*//here we concatinated with function add(in safemath) which will take in our 
        input (_time)in the function increase locktime. We took away the + sign and brought in
         function add from safemath.sol  */
        lockTime[msg.sender] = lockTime[msg.sender].add(_time); 
    }
    /* For function TOP UP it will be like this:
    function deposit() external payable {
        
        balances[msg.sender] +=msg.value;
        } */
    function withdraw() public { //you dont need make withdraw payable cos 

        // check that the sender/person calling the contract has ether deposited in this contract in the mapping and the balance is >0
        require(balances[msg.sender] > 0, "insufficient funds");

        // check that the now time is > the time saved in the lock time mapping
        require(block.timestamp > lockTime[msg.sender], "lock time has not expired/elapsed");

        // update the balance
        uint amount = balances[msg.sender]; 
        /* Above...bal/amount of the msg.sender, then i now saved the bal in a variable (i called it amount), so anytime i need it i can just call amount. also to nulify the amount the person as and also to prevent reentrancy i want to set the balance to zero. Also we saved it in a variable to ensure that it is not the case that the money was not sent to the person and we set his balance to 0. i need to save it up in a variable so i can prevent  */
        balances[msg.sender] = 0;

        // send the ether back to the sender. Note, the amount here is the variable above.
        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send ether");
    }
}
//the attack is primarily attacking the function increaselocktime
contract Attack {
    LockIt public timeLock;

    constructor(LockIt _timeLock) {
        timeLock = LockIt(_timeLock);
    }

    fallback() external payable {}

    function attack() public payable {
        timeLock.deposit{value: msg.value}();
        /*
        if t = current lock time then we need to find x such that
        x + t = 2**256 = 0
        so x = -t
        2**256 = type(uint).max + 1
        so x = type(uint).max + 1 - t
        */
        /*Here we called the function increase and then increased our integer by 1 (uint256)
         to enable it overflow and cause a disruption in our locktime */
        timeLock.increaseLockTime(type(uint).max + 1 - timeLock.lockTime(address(this)));
        timeLock.withdraw();
    }
}
