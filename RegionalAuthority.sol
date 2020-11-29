pragma solidity ^0.7.4;


/*
* Emulates what a country's regional authority would implement.
* The WHO could confirm that what is the country's valid authority address
* Then when the country tries to activate this, it will check if the address is authorized
* or not.
*
* Author: Sushant Mathur
*/

contract RegionalAuthority {
    
     //The simulated address of the WHO. Address 1
    address whoAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    //This contracts authorization status.
    bool authorizationStatus;
    
    //Owner's address.
    address owner;
    
    //Mapping of country authorities to their status as confirmed by the WHO.
    mapping(address => bool) public authorities;

    //Initialize the contract and set the authorization status as false and owner's address
    constructor() {
        authorizationStatus = false;
        owner = msg.sender;
    }
    
    //Modifier to check if the WHO is the one calling a function
    modifier whoAuthorityModifier() {
        require(msg.sender == whoAddress);
        _;
    }
    
    //Modifier to check if the country authority trying to verify us is itself valid.
    modifier countryAuthority() {
        require(authorities[msg.sender] == true);
        _;
    }
    
    /*
    * Ensure that only WHO can add an address in here after it Authorizes it.
    */
    function addAuthority(address _authorityAddress) whoAuthorityModifier public{
        authorities[_authorityAddress] = true;
    }

    /*
    * Ensure that a country that is authorized is authorizing us to cerify vaccinations.
    */
    function setSelfAuthorizationStatus() countryAuthority public {
        authorizationStatus = true;
    }
    
    /*
    * Check the authorization status for this region
    */
    function isAuthorized() public view returns(bool) {
        return authorizationStatus;
    }
}