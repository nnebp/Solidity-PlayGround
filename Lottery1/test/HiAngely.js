var HiAngely = artifacts.require("./HiAngely.sol");

contract('HiAngely', function(accounts) {
  it("should assert true", function() {
    var hiAngely;
    return HiAngely.deployed().then(function(instance){
      hiAngely = instance;
      // Get the total guesses
      return hiAngely.hi.call();
    }).then(function(result){
      console.log("Result string = ",result);
    });
  });
});