pragma solidity ^0.4.17;

contract Lottery {

    address public owner;
    address[] participants;

    uint8 maxParticipants;
    uint8 minParticipants;
    uint8 joinedParticipants;

    //TODO REVERSE  KV
    mapping (address => uint8) entries;

    //TODO mapping address to number for tickets

    modifier  OwnerOnly {
        if(msg.sender != owner){
            //TODO is revert the right thing to call?
            revert();
        } else {
            _;
        }
    }
    // Constructor
    function Lottery() public {
        owner = msg.sender;
        maxParticipants = 100;
    }

    function join(uint8 guess) public {
        require (guess <= 100 && guess >= 1);
        require(joinedParticipants + 1 < maxParticipants);
        //cant buy the same number twice
        require(entries[msg.sender] != guess);

        entries[msg.sender] = guess;
        joinedParticipants++;
    }

    function getGuess(address guessAddress) public  view returns (uint8){
        return entries[guessAddress] ;
    }

    //TODO delete
    function hi() public pure returns (string){
        return "Hi Lottery!";

    }

}
