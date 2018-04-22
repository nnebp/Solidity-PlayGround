var MultiNumberBettingV1 = artifacts.require("./MultiNumberBettingV1.sol");

contract('MultiNumberBettingV1', function(accounts){

  it("should return true and increment winnerCount", function() {
    var multiNumberBet;
    return MultiNumberBettingV1.deployed().then(function(instance){
      multiNumberBet = instance;
      return multiNumberBet.guess();
    }).then(function (result) {
      console.log(result.valueOf());
      assert.equal(result.valueOf(), true, "Contract initialized with value NOT equal to 10!!!"); //<--- what is this string for?
      println(result.valueOf())
    });
  });
});
