var HiAngely = artifacts.require("./HiAngely.sol");

contract('HiAngely', function(accounts) {
  it("should assert true", function() {
    var hiAngely;
    return HiAngely.deployed().then(async function(instance){
      hiAngely = instance;
      // Get the total guesses
      var start = await hiAngely.hi();
      console.log('the string =' + start.toString(10));
      return ;
    });
  });
});