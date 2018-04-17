pragma solidity ^0.4.17;

import "../contracts/PassCrypt.sol";
import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";

contract initTest{
	PassCrypt passCrypt = PassCrypt(DeployedAddresses.PassCrypt());
  	// Testing the adopt() function
	function testInit() public {
		uint i = 1;
		Assert.equal(i, 1, "The world as we know it has ended!");
	}
	function testAddLogin() public {
		PassCrypt passCrypt = new PassCrypt();
		uint i = 1;
		uint actual = passCrypt.addLogin("facebook", "brandon", "password");
		Assert.equal(i, actual, "Number of Logins expected to be 1");	
	}
	function testGetLogin() public {
		PassCrypt passCrypt = new PassCrypt();
		passCrypt.addLogin("facebook", "brandon", "password");
		bytes32 username;
		bytes32 password;
		(username,password) = passCrypt.getLogin("facebook");
		Assert.equal(username, "brandon", "username should be brandon");
	}
}