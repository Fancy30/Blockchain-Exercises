/*Class Work
Class Work
Create a contract named tech4dev and create the functions below
1. function name
This function will return the name of everyone present in today's class
2. function sex
This function will return the sex of everyone in this class except the facilitator.
3. function country
This function will return the name of the blockchain learning track present in your country.
Note: The above is to be called using an interface.
has context menu*/

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tech4dev {
    
    function name() external pure returns(string memory) {
       return "Victoria Olatunji, Arafat Ibrahim, Cynthia Abba, Chiamaka Eguzoro, Elizabeth Ogah, Faith Okere,Lyndah Katusiime, Mercia Ravelontsoa, Mhigo Moralie, Felicia Egbanabo, Halimat Shaibu, Ifure Iwoenang, Nkeiruka ulunwa, Oluwakemi Atoyebi, Rachael Adekanle, Sylvia Uzoh, Temitayo Daramola";
       }
    
    function sex() external pure returns(string memory) {
        return "Female";
    }
    
    function country() external pure returns(string memory) {
        return "Victoria Olatunji, Arafat Ibrahim, Cynthia Abba, Chiamaka Eguzoro, Elizabeth Ogah, Faith Okere,Felicia Egbanabo, Halimat Shaibu, Ifure Iwoenang, Nkeiruka ulunwa, Oluwakemi Atoyebi, Rachael Adekanle, Sylvia Uzoh, Temitayo Daramola";
    }
}
//second Exercise

pragma solidity ^0.8.0;

contract dataContract{

function getAge() external pure returns(uint){

return 25;

}
function getHeight() external pure returns(uint){

return 5;

}

function getName() external pure returns(string memory){

return 'Mike';

}


function getCar() external pure returns(string memory){​

return 'Camry';

}
}

// Third Exercise

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
contract tech4dev {

    uint public count;

    function increase() external {
        count +=1;
        count +=2;
        count +=1;
    }

    function decrease() external {
        count-=2;
    }
}
