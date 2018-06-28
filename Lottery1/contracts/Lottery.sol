pragma solidity ^0.4.17;

contract Lottery {

    address public owner;
    address[] participants;

    uint8 maxParticipants;
    uint8 minParticipants;
    uint8 joinedParticipants;

    mapping (uint8 => address) entries;

    //TODO array participants

    modifier  OwnerOnly {
        if(msg.sender != owner){
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
        //TODO uncomment
        //require(entries[guess] != msg.sender);

        joinedParticipants++;
        //TODO below line is causing problems
        //participants[joinedParticipants] = msg.sender;
        participants.push(msg.sender);
        entries[guess] = msg.sender;
    }

    //TODO make this owner only then switch to oracalize
    function chooseWinner(uint8 winningNum) public {
        address winner = entries[winningNum];
        //TODO this is deprecated i guess?
        winner.transfer(this.balance);
        //pay money to winner
        //TODO fire off event
        //ChooseWinner(chosenNumber,participants[chosenNumber]);
        //clear out mapping
    }

    function getGuess(uint8 guess) public  view returns (address){
        return entries[guess] ;
    }

    // Will receive any eth sent to the contract
    function () external payable {

    }
}
