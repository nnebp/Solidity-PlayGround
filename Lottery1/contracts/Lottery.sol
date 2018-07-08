pragma solidity ^0.4.17;

contract Lottery {

    address public owner;
    //TODO size magic number
    address[100] public participants;

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


    event ChooseWinner(uint _chosenNumber,address winner);

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
        participants[joinedParticipants] = msg.sender;
        //participants.push(msg.sender);
        entries[guess] = msg.sender;
    }

    //TODO make this owner only then switch to oracalize
    function chooseWinner(uint8 winningNum) public OwnerOnly{
        address winner = entries[winningNum];
        //TODO this is deprecated i guess?
        winner.transfer(this.balance);

        //TODO delete everything in the mapping
        for (uint8 i = 0; i < 100; i++) {
            delete participants[i];
        }

        //pay money to winner
        //ChooseWinner(winningNum,participants[winningNum]);
        //clear out mapping
    }

    function getGuess(uint8 guess) public  view returns (address){
        return entries[guess] ;
    }

    // Will receive any eth sent to the contract
    function () external payable {

    }
}
