pragma solidity ^0.4.17;

contract Lottery {

    uint8 constant size = 100;
    address public owner;

    //TODO size magic number
    //would this be more efficicent as a stack?
    address[size] public participants;

    uint8 maxParticipants;
    uint8 minParticipants;
    uint8 joinedParticipants;

    mapping (uint8 => address) entries;

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
        maxParticipants = size;
    }

    function join(uint8 guess, uint256 amount) public payable{
        require(msg.value == amount);
        require (guess <= size && guess >= 1);
        require(joinedParticipants + 1 < maxParticipants);
        //cant buy the same number twice
        //require(entries[guess] != msg.sender);

        joinedParticipants++;
        participants[joinedParticipants] = msg.sender;
        entries[guess] = msg.sender;
    }

    function chooseWinner(uint8 winningNum) public OwnerOnly{
        address winner = entries[winningNum];
        //TODO this is deprecated i guess?
        winner.transfer(this.balance);

        //delete everything in the array/mapping
        for (uint8 i = 0; i < size; i++) {
            delete participants[i];
            delete entries[i];
        }

        //TODO rememove comments below??
        //pay money to winner
        //ChooseWinner(winningNum,participants[winningNum]);
        //clear out mapping
    }

    function getGuess(uint8 guess) public  view returns (address){
        return entries[guess] ;
    }

}
