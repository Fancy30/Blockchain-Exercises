// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev{

    //array struct

    struct Person{
        string name;
        uint age;
    }
    
    Person("victoria",13);
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

/* Create a contract group4 and then create a struct with your name which contains name and height.
After which you will create function called Intel, make it public 
then create an array push to push name and height variable into the struct. */

contract group4{

    struct Victoria{
      string name;
      uint height;
  }

  //An array of struct 
  Victoria[] public Tech4dev;

  function Intel(string memory _name, uint _height) public{
      
      Tech4dev.push(Victoria(_name, _height));

  }

}
