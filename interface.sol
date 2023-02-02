// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface Imike {
    function getAge() external pure returns (uint);
    function getHeight() external pure returns(uint);
    function getName() external pure returns(string memory); 
    function getCar() external pure returns(string memory);       
}

contract mainContract {
/*Class Work
getHeight
getName
getCar*/
    address private constant dataContractAddress = 0xd9145CCE52D386f254917e481eB44e9943F39138;

    function getAge() external pure returns(uint) {
        return Imike(dataContractAddress).getAge();
    }

    function getHeight() external pure returns(uint) {
        return Imike(dataContractAddress).getHeight();
    }

    function getName() external pure returns(string memory) {
        return Imike(dataContractAddress).getName();
    }
    
    function getCar() external pure returns(string memory) {
        return Imike(dataContractAddress).getCar();
    }
}


// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface Imike {
    function name() external pure returns(string memory); 
    function sex() external pure returns(string memory); 
    function country() external pure returns(string memory);      
}

contract microsoft {
    address private constant dataContractAddress = 0x7EF2e0048f5bAeDe046f6BF797943daF4ED8CB47;

    function name() external pure returns(string memory) {
        return Imike(dataContractAddress).name();
    }

    function sex() external pure returns(string memory) {
        return Imike(dataContractAddress).sex();
    }

    function country() external pure returns(string memory) {
        return Imike(dataContractAddress).country();
    }

   
}

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
interface Imike {
    function count() external view returns (uint);
    function increase() external; 
    function decrease() external;     
}

contract mainContract {

    address private constant counter = 0x3328358128832A260C76A4141e19E2A943CD4B6D;

    function increase() external {
        Imike(counter).increase();
    }

     function decrease() external {
        Imike(counter).decrease();
    }

    function getCount() external view returns(uint) {
        return Imike(counter).count();
    }

}
