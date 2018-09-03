var Up = artifacts.require("./Up.sol");

contract('Up', function(accounts) {
  it("should assert true", function() {
    var up;
    return Up.deployed().then(function(instance){
      up = instance;
      // Get the total guesses
      return up.hi.call();
    }).then(function(result){
      console.log("Result string = ",result);
    });
  });
});