// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract dare{

    struct Winner{

        uint age;
        string name;
    }

    uint[] public mike = [1, 2, 3];

    //struct-name[] array-name;

    Winner[] vick;

}

// another sample

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract sandwichFactory{

    struct Sandwich{
        string name;
        uint age;
    }

    Sandwich[] public sandwiches;

    function michael(uint _index) public{
        Sandwich storage Bonolo = sandwiches[_index];
    }
   
}
