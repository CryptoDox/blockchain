	pragma solidity ^0.4.18;
	
	// Une simple petition
	contract PetitionAlpha {
	
		// Zone Stockage
		mapping ( address => bool ) public petitionSignatureDe;
		address[] public signataires;
		string public sujet;
		address public participant;
		
		// Zone Evenement
		event PetitionSignature (address signataire);
		
		// Zone Fonction
		function PetitionAlpha(string _sujet) {
				sujet = _sujet;
				participant = msg.sender;
		}
		
		function signerPetition () {
			if (petitionSignatureDe[msg.sender]) {
				return;
			}
			petitionSignatureDe[msg.sender] = true;
			signataires.push(msg.sender);
			PetitionSignature(msg.sender);
		}
		
		function signatairesCount () constant returns (uint) {
			return signataires.length;
		}
		
		// Possible supression du contrat
		function kill () {
			if (msg.sender == participant) {
				selfdestruct(participant);
			}
		}
		
	}