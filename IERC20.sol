pragma solidity ^0.8.0;
 
import "./another.sol";
 
contract ERC20 is IERC20{
 
uint public override totalSupply; // this is a state variable
mapping(address => uint) public override balanceOf;
mapping(address => mapping(address => uint)) public override allowance; //this is nested mapping(mapping inside mapping) it takes the address of both owner and spender and also the amount
string public name ="tech4dev Token"; //name of token
string public symbol ="T4D Token"; //symbol of token
uint public decimals = 18;
 
function transfer(address recipient, uint amount) external override returns(bool){
balanceOf[msg.sender] -= amount; // deducting the amount from the sender address
//method 1 is deducting the amount from sender's balance
balanceOf[recipient]+= amount;
//method two//
//balanceOf[recipient] = balanceof[recipient] + amount;//
//balanceOf[recipient] += amount; here is adding amount to recipient's balance
 
emit Transfer(msg.sender, recipient, amount); // emit broadcasts the event in the code
return true;
}
 //to give approval to the spender and in a way restrict the amout the spender can take to avoid the spender taking all my money//
function approve(address spender, uint amount) external override returns(bool){
allowance[msg.sender][spender] = amount;
emit Approval(msg.sender, spender, amount);
return true;
}
 
 //the spender will call this function//
function transferFrom(address sender, address recipient, uint amount) external override returns(bool){
allowance[sender][msg.sender] -= amount; 
balanceOf[sender] -= amount;
balanceOf[recipient] += amount;
emit Transfer(sender, recipient, amount);
return true;
}
 
 //create more amount to the owner's balance
function mint(uint amount) external {
        balanceOf[msg.sender] += amount;
        totalSupply += amount;//this increases the total supply//
        emit Transfer(address(0), msg.sender, amount);
    }
// this burn function is the opposite of the mint function//
    function burn(uint amount) external {
        balanceOf[msg.sender] -= amount; //decreases the total supply//
        totalSupply -= amount;
        emit Transfer(msg.sender, address(0), amount);                         
}

}
