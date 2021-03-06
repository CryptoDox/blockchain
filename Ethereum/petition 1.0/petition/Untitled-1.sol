pragma solidity ^0.4.18;


contract SimplePetition {
	
		// Zone Stockage
		mapping ( address => bool ) public petitionSignedBy;
		address[] public petitioners;
		string public subject;
		address public owner;
		
		// Zone Evenement
		event PetitionSigned (address petitioner);
		
		// Zone Fonction
		function SimplePetition (string _subject) {
				subject = _subject;
				owner = msg.sender;
		}
		
		function signPetition () {
			if (petitionSignedBy[msg.sender]) {
				return;
			}
			petitionSignedBy[msg.sender] = true;
			petitioners.push(msg.sender);
			PetitionSigned(msg.sender);
		}
		
		function petitionersCount () constant returns (uint) {
			return petitioners.length;
		}
		
		// Possible supression du contrat
		function kill () {
			if (msg.sender == owner) {
				selfdestruct(owner);
			}
		}
		
	}