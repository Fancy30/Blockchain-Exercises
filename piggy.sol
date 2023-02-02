// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4Dev {
    event deposit(uint amount);
    event withdraw(uint amount);

    address public owner = msg.sender; //declare msg.sender as the owner of the contract

    receive() external payable {
        emit deposit(msg.value); // emit deposit with the value that is deposited
    }

    function Withdraw() external {
        require(msg.sender == owner, "You are not the owner");
        emit withdraw(address(this).balance);
        selfdestruct(payable(msg.sender));
    }
}
