// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {
/*Class Work
Create an enum that comprises of the following
        None
        Pending
        Shipped
        Accepted
        Rejected
        Canceled */

    enum shipping{
        None, //0
        Pending, //1
        Shipped, //2
        Accepted, //3
        Rejected, //4
        Canceled //5
    }

    shipping public status;

    function get() public view returns(shipping) {

        return status;
    }

    function set(shipping _x) public {

        status = _x;
    }
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract tech4dev {
/*Class Work
Create an enum for the following:
pending, received, rejected.
Create a function to update and another function to get the enum. */

    enum delivery{
        accepted, //0
        rejected, //1
        canceled //2
    }

    delivery public status;

     function update(delivery _x) public {
        status = _x;
    }

    function get() public view returns(delivery) {
        return status;
    }

    function accepted() public {
        status = delivery.accepted;
    }

    function rejected() public {
        status = delivery.rejected;
    }

    function canceled() public {
        status = delivery.canceled;
    } 
}
