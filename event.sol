// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//create an event named launch which comprises of id, creator, goal, startAt, endAt
contract anu{
event launch (uint id, address indexed creator, string indexed goal, uint indexed startAt, uint endAt);
}

pragma solidity ^0.8.0;
contract Can{
event Cancel(uint id);


/*
1. Create an event for Unpledge which has id, caller, amount.
2. Create an event for Claim which has an id.
3. Create an event for Refund which has an id that is not indexed, caller and amount.
*/
    event Pledge(uint indexed id, address indexed caller, uint amount);
    event Unpledge(uint indexed id, address indexed caller, uint amount);
    event Claim(uint id);
    event Refund(uint id, address indexed caller, uint amount);
}
