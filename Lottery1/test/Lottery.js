var Lottery = artifacts.require("./Lottery.sol");

contract('Lottery', function(accounts) {
  it("should assert true", function() {
    var hiAngely;
    return Lottery.deployed().then(function(instance){
      lottery = instance;
      // Get the total guesses
      return lottery.hi.call();
    }).then(function(result){
      console.log("Result string = ",result);
    });
  });
});
