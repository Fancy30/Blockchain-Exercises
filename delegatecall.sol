// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract B {
    uint public num;
    address public sender;
    uint public value;

    function winner(uint _num) public payable {
        num = _num;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint public num;
    address public sender;
    uint public value;

    function uzoh(address _contract, uint _num) public payable {
        //delegatecall();  
        (bool success,)= _contract.delegatecall(abi.encodeWithSignature("winner(uint256)", _num));
        require(success, "Delegate call did not go through");    
    }
}
