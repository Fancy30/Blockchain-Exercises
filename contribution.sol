// SPDX-License-Identifier: MIT
pragma solidity ^0.8.10;

contract Contribution {

    uint public targetAmount = 10 ether;
    //a local state variable balance has been introduced here, unlike the usual flow of the contract
    uint public balance;
    address public Anu; //here i set the owner's address
  
    function pay() public payable {
        require(msg.value == 1 ether, "You can only deposit 1 Ether");
        /* address(this).balance means the address of the instance of the contract,
         it is diff from address of/from msg.sender. Here we put the response which is the 
         current address of the contract is put into a local variable balance. */
   uint balance = address(this).balance;
   /* Here variable balance is set to increase only after the user deposits Eth into the
    contract using the Contribution.pay function. Hence, as long as the Eth does not appear in 
    other operations, it will not affect our balance, thus preventing accounting errors 
    that can be caused by forced transfers */
        balance += msg.value; 
      /*NOTE, we did not use address(this.balance) to update the current balance of the 
      contract RATHER, a local state variable(balance) is used to update it when the
        user deposits funds. */
        require(balance <= targetAmount, "Game is over");

        if (balance == targetAmount) {
            Anu = msg.sender;
        }
    }
    function claimReward() public {
        require(msg.sender == Anu, "Not Anu");
/*we want to send money and the money is sent to the addresss from our msg.sender.
call is the function making the tranfer, value is the amount we are sending, 
address(this).balance is the current balance of the contrant,
 hence we are sending the current balance of the whole contract to the address from our 
 msg sender.  */
        (bool sent, ) = msg.sender.call{value: address(this).balance}("");
        //(bool sent, ) = msg.sender.call{value: address(this).balance}("");
        //this is to inquire if the money was sent or not
        require(sent, "Failed to send Ether");
    }
}
/* If six players have already deposited one Eth into the contract, we can use the selfdestruct
 function to force an additional Eth into the contract. This allows us to bypass the
  Contribution.pay function, resulting in an accounting error 
*/
contract Attack {
    Contribution contributeScam; /*this is to allow etherGame to be able to call the functions 
    of Contribution and as well bypass Contribution while doing same */
/* the constructor here is used to initialize contract state. Hence contributionScam can 
call the functions of Contribution.
constructor is taking in an input from the frontend which is the contributeScam  */
    constructor(Contribution _contributeScam) {

        contributeScam = Contribution(_contributeScam);
    }
    //here we av saved the address into 
    function attack() public payable {
        address payable Mine = payable(address(contributeScam));
        selfdestruct(Mine);
    }
   /* function destroy(address My) public {
		selfdestruct(payable(My));
}
Above is the usual way to write a selfdestruct function but since the function is public,
not retricting the above may also result in a potential security flaw.
 To counter this, one can consider adding an onlyOwner modifier or using a require statement 
 to confirm that only the owner can call the destroy function. */
        function destroy(address Anu) public {
		require(Anu == msg.sender, "only the owner can call this");       
    		selfdestruct(payable(Anu));
}

}
