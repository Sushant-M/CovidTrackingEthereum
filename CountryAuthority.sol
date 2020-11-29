pragma solidity ^0.7.4;


/*
* Emulates what a country's authority would implement.
* Only the validated country addresses will be verified by the WHO
* to authorize regional authorities.
*
* Author: Sushant Mathur
*/

contract CountryAuthority {
    
    //The simulated address of the WHO. Address 1
    address whoAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    //This contracts authorization status.
    bool authorizationStatus;
    
    //Owner's address.
    address owner;
    
    //The regional authorities address
    address regional;

    //Initialize the contract and set the authorization status as false and owner's address
    constructor() {
        authorizationStatus = false;
        owner = msg.sender;
    }
    
    //Modifier to check if the WHO is the one calling a function
    modifier whoAuthority() {
        require(msg.sender == whoAddress);
        _;
    }

    

    //Get our authorization status, this is public so anyone can check if the country has been authorized.
    function isAuthorized() public view returns(bool) {
        return authorizationStatus;
    }

    //Set the authorization status, only the WHO can call this function hence the modifier.
    function setAuthorizationState() public whoAuthority returns(bool) {
        authorizationStatus = true;
        return authorizationStatus;
    }
}