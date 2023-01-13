// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

    struct toDo {
        string title;
        bool completed;
    } 

    toDo[] public schedule;

    function insert(string memory _title) public {
        schedule.push(toDo(_title, false));
    }

    function update(uint index, string memory _title) public {
        schedule[index].title = _title;

    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {

//Class work
//Create a todo list whereby you can insert name and bool completed.



    struct toDo {
        string name;
        bool completed;
    } 

    toDo[] public schedule;

    function insert(string memory _name, bool _completed) public {
        schedule.push(toDo(_name, _completed));
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {
/*Create a todo list that comprises of name and status.
set the status to bool.
Create a function that can insert and another function that can update.*/

    struct toDo {
        string name;
        bool status;
    } 

    toDo[] public dailySchedule;

    function insert(string memory _name) public {
        dailySchedule.push(toDo(_name, false));
    }

    function update(uint index, string memory _name) public {
        dailySchedule[index].name = _name;

    }
}
