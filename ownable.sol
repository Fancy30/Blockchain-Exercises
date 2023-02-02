// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

    address public owner;
    
    constructor() {
        owner = msg.sender;
    }

    function setOwner(address _newOwner) public {
        owner = _newOwner;
    }
   
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

   // Class Work Create a function that can help us to update the address of contract owner.


    address public owner;
    
    constructor() {
        owner = msg.sender;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Not the owner");
        _;
    }

    function updateOwner(address _newOwner) public onlyOwner {
        owner = _newOwner;
    }

     function onlyOwnerCanCall() public onlyOwner {
        
    }

     function anybodyCanCall() public {
        
    }  
}
