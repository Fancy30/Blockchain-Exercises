// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract victoria {

//key value pair

    mapping(uint => string);

//naming mapping

    mapping(uint => string) public Victoria;

// Class work 1
// Create a mapping called tech4dev. 
// The key will be a uint and the value an address. Let's make this mapping public.

    mapping(uint => address) public tech4dev;


//Class Work 2
//Create a mapping called fawole, where the key is an address and the value a uint.

    mapping(address => uint) public fawole;

//Create a mapping named mike and with key to be an unsigned integer 
//then the value to be an address. Make the mapping private

    mapping(uint => address) private mike;

//keccak 256
//To call keccak 256
//abi.encodePacked to convert string "Victoria" to byte

    keccak256(abi.encodePacked("Victoria"));

//Declare an event
//event name-of-event()

    event victoria(uint a, uint b, uint result);

    function add(uint _a, uint _b)public returns(uint){

        uint result = _a + _b;

//To emit

        emit victoria(_a, _b, result);

        return result;

    }

}
//Declare require statement require();
        //hash for variable _name
        //keccak256(abi.encodePacked(_name))
        //cut and paste in require();
        //require(keccak256(abi.encodePacked(_name)));
        //Hash for Variable input "Victoria"
        //keccak256(abi.encodePacked("Victoria"));
        //cut and paste variable input in require();
