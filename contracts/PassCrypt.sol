pragma solidity ^0.4.17;

contract PassCrypt{
	
	address owner;
	mapping (address => PWManager ) PWs;

	struct Login {
		bytes32 website;
		bytes32 username;
		bytes32 password;
	}

	struct PWManager {
		Login [] logins;
		uint numLogins;
	}


	function addLogin(bytes32 _website, bytes32 _username, bytes32 _password) public returns(uint128) {
		PWManager storage user = PWs[msg.sender];
		Login memory login = Login(_website,_username, _password);
		user.logins.push(login);
		uint i = user.numLogins++;
		return(1);
	}
	function getLogin(bytes32 _website) public returns (bytes32 _username, bytes32 _password) {
		PWManager storage user = PWs[msg.sender];
		for( uint i = 0; i<user.logins.length; i++){
			if(user.logins[i].website == _website){
				return(user.logins[i].username, user.logins[i].password);
			}
		}
		bytes32 u = "null";
		bytes32 p = "null";
		return(u,p);
	}


	function PassCrypt() public {
		owner = msg.sender;
	}

	function getOwner() public view returns(address){
		return(owner);
	}

}
