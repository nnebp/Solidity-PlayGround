pragma solidity ^0.4.17;

/**
 * Exercise: V1
 * Section: 7
 * Part of an online course - for more info checkout link below
 * http://acloudfan.com/learn-blockchain
 */

contract MultiNumberBettingV1 {

  //TODO explicit visibility on state vairables
  uint  loserCount;
  uint  winnerCount;
  address winner;

  uint8[3]  numArray;

  string lastWinnerName = "***";

  uint lastWinnerAt = 0; //probably automatically 0?

  // Ex-1 Part-1
  function MultiNumberBettingV1(uint8 num0, uint8 num1, uint8 num2) {
    // constructor
    numArray[0] = num0;
    numArray[1] = num1;
    numArray[2] = num2;
  }

  // Ex-1 Part-3
  function guess(uint8 num, string name) returns (bool){
    assert(num < 10);

    for(uint8 i = 0 ; i < numArray.length ; i++){
      if(numArray[i] == num) {
        // Increase the winner count
        winnerCount++;
        lastWinnerName = name;
        lastWinnerAt = now;
        winner = msg.sender;
        return true;
      }
    }
    loserCount++;
    return false;
  }

  // Ex-2
  function totalGuesses() returns (uint){
    return (loserCount+winnerCount);
  }

  function getLastWinner() returns (string){
      //TODO change to return the last/first? 3 chars
    bytes memory result = new bytes(3);
    bytes memory winnerBytes = bytes(lastWinnerName);

    for (uint i = 0; i < 3; i++) {
      result[i] = winnerBytes[i];
    }

    return string(result);

  }

  //TODO delete
  function getLastWinnerAt() returns (uint){
    return lastWinnerAt;
  }

  function daysSinceLastWinning() returns (uint){
      if (lastWinnerAt > 0) {
        return (now - lastWinnerAt) / 60 / 60 / 24;
        //dont really care if i got this right
      }
  }

  function hoursSinceLastWinning() returns (uint){
    if (lastWinnerAt > 0) {
      return (now - lastWinnerAt) / 60 / 60;
    }
  }

  function minutesSinceLastWinning() returns (uint){
    //if (lastWinnerAt > 0) {
      //return ((now - lastWinnerAt) / 60);
    return  now - lastWinnerAt;
    //}
  }

  // Ex-3
  /**
   * make a change to the 2_deploy_contracts.js
   *   provide the 3 numbers to the constructor
   * > testrpc
   * > truffle migrate
   * > trufle  networks
   **/
}
