pragma solidity ^0.4.4;

/**
 * Exercise: V4
 * Section: 7
 * Part of an online course - for more info checkout link below
 * http://acloudfan.com/learn-blockchain
 */
contract MultiNumberBettingAbstractV1 {
  //exercise is wrong about the number
  uint constant public MAX_BET = 5 ether;
  uint constant public MIN_BET = 1 ether;

  address owner;

  modifier ownerOnly() {
    if (msg.sender == owner) {
      _;
    } else {
      revert(); //throw??
    }
  }

  function MultiNumberBettingV4(uint8 num0, uint8 num1, uint8 num2) {}

  function guess(uint8 num, string name) payable returns (bool){}

  function totalGuesses() returns (uint){}

  function daysSinceLastWinning()  returns (uint){}

  function hoursSinceLastWinning() returns (uint){}

  function  minutesSinceLastWinning() returns (uint){}

  function getLastWinnerInfo() returns (address winnerAddress,
    string  name,
    uint    guess,
    uint    guessedAt,
    uint    eth) {}

  function checkWinning(address winnerAddress) public returns (address retWinnerAddress, string name, uint guessVal, uint guessedAt) {}
}

contract MultiNumberBettingV4 is MultiNumberBettingAbstractV1 {

  uint public  loserCount;
  uint public  winnerCount;

  uint public lastWinnerAt;

  //Ex - 2 Part - 1 Remove this variable
  // string lastWinnerName ;

  // Ex - 2 Part-2 Keep this
  address winner;

  // Ex-1 Part - 1  Declare a struct
  struct Winner {
    address winnerAddress;
    string  name;
    uint    guess;
    uint    guessedAt;
    uint    ethRec;
  }
  // Ex-1 Part - 2 Add a mapping
  mapping(address=>Winner) winnersMapping;

  uint8[3]  numArray;

  function MultiNumberBettingV4(uint8 num0, uint8 num1, uint8 num2) {
    // constructor
    numArray[0] = num0;
    numArray[1] = num1;
    numArray[2] = num2;

    owner = msg.sender;
  }

  
  function guess(uint8 num, string name) public payable returns (bool){

    // If num > 10 revert
    if(num > 10) {
      //THis version of solidity cant return with revert?
      revert();
    }

    //should be 2x the best but just check if it works
    if (this.balance < msg.value ) {
      revert();
    }

    //if (msg.value > MAX_BET || msg.value < MIN_BET ) {
      //revert ();
    //}

    for (uint8 i = 0 ; i < numArray.length ; i++){
      if (numArray[i] == num) {
        // Increase the winner count
        winnerCount++;

        // Ex - 1 Part - 3
        winnersMapping[msg.sender].winnerAddress = msg.sender;
        winnersMapping[msg.sender].ethRec = msg.value;
        winnersMapping[msg.sender].name = name;
        winnersMapping[msg.sender].guess = num;
        winnersMapping[msg.sender].guessedAt = now;

        // Ex - 2 Part - 2 removed the lastWinnerName
        // So delete this line
        // lastWinnerName = name;

        lastWinnerAt = winnersMapping[msg.sender].guessedAt;
        winner = msg.sender;

        //TODO is this line causeing a problem?
        //TODO problem was sending back more money than was in the contract
        msg.sender.transfer(msg.value);

        return true;
      }
    }
    loserCount++;
    return false;
  }

  function ownerWithdraw(uint amount) ownerOnly {
    owner.transfer(amount);
  }
  function totalGuesses() returns (uint){
    return (loserCount+winnerCount);
  }


  // Ex - 2 Part - 3 Comment delete this function
  // function getLastWinner() returns (string){

  //   bytes memory nameBytes = bytes(lastWinnerName);
  //   // If no winner send "***"
  //   if(nameBytes.length == 0) return "***";

  //   string memory retString = new string(3);

  //   bytes memory toReturn =  bytes(retString);

  //   // 2nd check to cover a winner name less than 3 bytes
  //   for(uint i=0; (i < 3) && (i < nameBytes.length) ; i++){
  //     toReturn[i] = nameBytes[i];
  //   }

  //   return string(toReturn);
  // }

  
  function daysSinceLastWinning()  returns (uint){
    return (now - lastWinnerAt*1 days);
  }

  function hoursSinceLastWinning() returns (uint){
    return (now - lastWinnerAt*1 hours);
  }

  function  minutesSinceLastWinning() returns (uint){
    return (now - lastWinnerAt*1 minutes);
  }

  // Ex - 2 Part - 3 
  // Remember winner holds the address of the winner so we are getting
  // the information from the winnersMapping for the address
  // all values will be 0x0 if winner=0x0 i.e., if there is no winner
  function getLastWinnerInfo() returns (address winnerAddress,
                                         string  name, 
                                         uint guess,
                                         uint    guessedAt,
                                         uint    eth) {
    winnerAddress = winnersMapping[winner].winnerAddress;
    name = winnersMapping[winner].name;
    guess = winnersMapping[winner].guess;
    guessedAt = winnersMapping[winner].guessedAt;
    eth = winnersMapping[winner].ethRec;
  }

  // Ex - 3 
  function checkWinning(address winnerAddress) public returns (address retWinnerAddress, string name, uint guessVal, uint guessedAt) {
    Winner memory winnerLocal = winnersMapping[winnerAddress];
    if (winnerLocal.guessedAt != 0) {
        retWinnerAddress = winnerLocal.winnerAddress;
        name = winnerLocal.name;
        guessVal = winnerLocal.guess;
        guessedAt = winnerLocal.guessedAt;
    }
  }
  
}
