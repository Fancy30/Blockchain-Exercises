pragma solidity ^0.8.0;  
   
// Creating a contract 
contract tech4Dev {  
  
    // Defining the array
    uint[] numbers = [10, 20, 30, 40, 50]; 
    
    // Defining the function to push 
    // values to the array
    function array_push(
    ) public returns(uint[] memory){  
    
        numbers.push(60);  
        numbers.push(70);  
        numbers.push(80);
    
        return numbers;  
    }  
}
