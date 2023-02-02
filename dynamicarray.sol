// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev{
/*
    //declare dynamic array numbers and push into it
    //array-name.push
    //pushing numbers 1 - 5 into a dynamic array using the array.push() method
    uint[]numbers;
    numbers.push(1);
    numbers.push(2);
    numbers.push(3);
    numbers.push(4);
    numbers.push(5);
    //[1, 2, 3, 4, 5]
  */

  struct Microsoft{
      string name;
      uint age;
      uint height;
      string class;
      string genotype;
  }

  //create an array of struct 
  Microsoft[] Olatunji;

  function vickyOla(string memory _name, uint _age, uint _height, string memory _class, string memory _genotype) public{
      
      Olatunji.push(Microsoft(_name, _age, _height, _class, _genotype));

  }


}
