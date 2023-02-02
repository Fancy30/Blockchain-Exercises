// SPDX-License-Identifier: MIT
/*pragma solidity ^0.8.0;
contract tech4dev {
    uint[] public nums = [1, 2, 3];
    function addNumber() public {
     nums.push(100);
    } 
    /*Create a dynamic array of 7,8 and 9 and 
    then push the below values inside.20,10 and 1.*/

    /*uint[] public numbers = [7, 8, 9];
    function addNumbers() public {
        numbers.push(20);
        numbers.push(10);
        numbers.push(1);
    }
    function update() public {
        nums[2] = 100;
    }
    
}*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tech4dev {

   uint[] public number = [7, 8, 9, 10]; //[7, 8, 9, 10, 20,10,1]

   function addNumber() public {
       //Array.push()
       number.push(20);
       number.push(10);
       number.push(1);
      
   }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

/*Class Work
You have an array 20,21,22,23,24,25 and 90.
Create a function that will add 91 to the end of the array and
another function that will update 25 to 60.*/

    uint[] public numbers = [20, 21, 22, 2, 24, 25, 90];
    function addNumbers() public {
        numbers.push(91);
    }

    function update() public {
        numbers[0] = 25;
    }
    //To delete
    function deleteArray() public {
        delete numbers[3];
    }

/*Class Work
You have an array 20,3,24,25 and 10.
Create a function that will delete 10 from the above array.*/

    uint[] public myArray = [20, 3, 24, 25, 10];
    
    function deleteMyArray() public {
        delete myArray[4];
    }
}
