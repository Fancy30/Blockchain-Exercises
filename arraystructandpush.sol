// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract vick{

    //declare array struct

    struct hospital{
        string name;
        uint age;
        string maritalStatus;
    }

    //create new data in struct and save in a new variable called Ola

    hospital ola = hospital("Deola", 13, "single");

    //array of struct - struct-name[]name of array

    hospital[] public victoria;

    //to add new data created in struct to arrayVictoria using array.push (Method 1)

    victoria.push(ola);

    //to add new data created in struct to arrayVictoria using array.push (Method 2)

    victoria.push(hospital("Deola", 13, "single"));

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

}
