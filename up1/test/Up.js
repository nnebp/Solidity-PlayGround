var Up = artifacts.require("./Up.sol");
var timeHelper = require('./fastForwardTime');
//https://github.com/pooleja/UlyssesPact

contract('Up', function(accounts) {
  it("should assert true", function() {
    var up;
    return Up.deployed().then(async function(instance){
      up = instance;
      // Get the total guesses
      // Fast forward 100 blocks
      var start = await up.hi.call();
      console.log(start.toString(10));

      // Fast forward 100 blocks
      timeHelper.fastForward(101);

      var end = await up.hi.call();
      console.log(end.toString(10));
    });
  });
});