pragma solidity ^0.7.4;


/*
* Emulates what each individual citizen shall own.
* The vaccine status will be set by the regional authority and we
* can verify if this authority is legit or not very easily thanks
* to the inherent features of blockchain.
*
* Author: Sushant Mathur
*/

contract userVaccineContract {
    
    //The simulated address of the WHO. Address 1
    address whoAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    
    //The vaccination status of the person
    bool vaccinationStatus;
    
    //The owner of the address, or the person in this case
    address owner;
    
    //The address of the country
    address country;
    
    //The address of the region
    address region;
    
    //Mapping for confirming which addresses are regional authorities
    mapping(address => bool) regionalAuthorities;

    //Set the authorization status to false and the owner's value to the person creating the contract
    constructor() {
        vaccinationStatus = false;
        owner = msg.sender;
    }
    
    //Modifier to check if the WHO is the one calling a function
    modifier whoAuthority() {
        require(msg.sender == whoAddress);
        _;
    }
    
    modifier authorizationCheck() {
        require(regionalAuthorities[msg.sender] == true);
        _;
    }
    
    
    //Set the regional and country address for this user
    function addRegionalAndCountryAddress(address _regional, address _country) public whoAuthority {
        country = _country;
        region = _regional;
        regionalAuthorities[_regional] = true;
        regionalAuthorities[_country] = true;
    }

    //Check if the user is authorized, we can extend this code to have airport etc authorities who can see this information
    function isVaccinated() public view returns(bool) {
        return vaccinationStatus;
    }
    
    //Set the vaccination status, only the country or regional authorities can do this
    function setVaccinationState() public authorizationCheck returns(bool) {
        vaccinationStatus = true;
        return vaccinationStatus;
    }
}