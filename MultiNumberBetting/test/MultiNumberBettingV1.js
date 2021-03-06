var MultiNumberBettingV1 = artifacts.require("./MultiNumberBettingV1.sol");

contract('MultiNumberBettingV1', function(accounts) {
  it("should assert true", function() {
    var multi_number_betting_v1;
    return MultiNumberBettingV1.deployed().then(function(instance){
      multi_number_betting_v1 = instance;
      // Get the total guesses
      return multi_number_betting_v1.totalGuesses.call();
    }).then(function(result){
      console.log("Total Guesses=",result.toNumber());
      // Make a guess
      multi_number_betting_v1.guess(1, "tes");
      //return multi_number_betting_v1.totalGuesses.call();
      return multi_number_betting_v1.getLastWinnerAt.call();
      //TODO this is a mess start from last exercise answers
    }).then(function(result){
      console.log("Last winner at=",result.toNumber());
      // Make a guess
      multi_number_betting_v1.guess(1, "tes");
      //return multi_number_betting_v1.totalGuesses.call();
      return multi_number_betting_v1.getLastWinner.call();
    }).then(function(result){
      console.log("Name = ",result);
      assert.isTrue(result == "testing");
      return multi_number_betting_v1.minutesSinceLastWinning().call();
    }).then(function(result){
      console.log("seconds since last winner= ",result.toNumber());
    });
  });
});
