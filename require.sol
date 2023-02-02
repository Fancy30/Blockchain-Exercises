// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Tech4dev{

    

/*_name == 'Victoria'
hash of _name == Hash of victoria
1. Create a function Celeron that which takes name
as an input. You should require the name of the input
is thesame with Fawole.
2. Create a function Intel that takes name as an input. You
should require the name of the input is not thesame as Fawole
*/

    function Celeron(string memory _name) public returns(string memory){
        require(keccak256(abi.encodePacked(_name)) == keccak256(abi.encodePacked("Fawole")));

        return "hi!";
 
    }

    function Intel(string memory _name) public returns(string memory){

    require(keccak256(abi.encodePacked(_name)) != keccak256(abi.encodePacked("Fawole")));
    
    }


/*1. Create a function Spike that which takes name
as an input. You should require that the name of the input
is less than or equal to Dami.
2.Create a function Bonolo that takes name as an input. You
should require the name of the input is greater than or equal to  Fash.
*/

    function Spike(string memory _name) public returns(string memory){
        require(keccak256(abi.encodePacked(_name)) <= keccak256(abi.encodePacked("Dami")));
 
    }

    function Bonolo(string memory _name) public returns(string memory){
        require(keccak256(abi.encodePacked(_name)) >= keccak256(abi.encodePacked("Fash")));
 
    }
  
}
