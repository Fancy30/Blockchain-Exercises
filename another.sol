//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
interface IERC20{
    function totalSupply() external view returns(uint); //total number of token//
    function balanceOf(address account) external view returns(uint); // the balance of the given amount
    function transfer(address recipient, uint amount) external returns(bool); //the address and amount transfering
    function allowance(address owner, address spender) external view returns(uint); //allowing someoneelse to spend from the wallet
    function approve(address spender, uint amount) external returns(bool); //giving approval to spend
    function transferFrom(address sender, address recipient, uint amount) external returns(bool);
 
event Transfer(address indexed from, address indexed to, uint amount); //this event helps to filter the log to get the wanted data
event Approval(address indexed owner, address indexed spender, uint amount);
 
}
