# Covid Tracking Using Ethereum

Project for class CMPE 209 at SJSU.
Name: Sushant Amit Mathur

## Running instructions

1. Go to https://remix.ethereum.org/.

2. Copy all the source files into the editor.

3. Compile each file.

4. Run country authority, call the setAuthorizationState() method from the WHO address.

5. Run the regional authority and set the address of the country it belongs to from the WHO address.

6. Run the user contract and get the WHO address to set the regional and country authorities for the user.

7. Set the user as vaccinated by the regional or country and the person will be safely marked as vaccinated.

## Notes

The WHO addres is the first of the emulated addresses. Use that to assign country specific addresses.

We are using Ethereum's inherent security here and are assuming that all the private keys are indeed private. If you try to add authorities from illegal accounts the blockchain will reject the transactions because they are not authorized.