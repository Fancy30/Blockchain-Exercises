// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract receiveEther {
    receive() external payable {}
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract sendEther {
    receive() external payable{}
    // send via transfer
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }
    // send via send
    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }
    //send via call
    function sendViaCall(address payable _to) public payable {
        (bool sent, /*bytes memory data*/) = _to.call{value: msg.value}("");       
        require(sent, "Failed to send Ether");
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
/*
Create two contracts, the first will receive 
ether and it will have get balance function.
While the second contract will have all the 3 transfer functions.
*/

contract receiveEther {
    receive() external payable {}
    function getBalance() public view returns(uint) {
        return address(this).balance;
    }
}

contract sendEther {
    receive() external payable{}
    // send via transfer
    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }
    // send via send
    function sendViaSend(address payable _to) public payable {
        bool sent = _to.send(msg.value);
        require(sent, "Failed to send Ether");
    }
    //send via call
    function sendViaCall(address payable _to) public payable {
        (bool sent, /*bytes memory data*/) = _to.call{value: msg.value}("");       
        require(sent, "Failed to send Ether");
    }
}
