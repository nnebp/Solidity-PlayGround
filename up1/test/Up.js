var Up = artifacts.require("./Up.sol");
var timeHelper = require('./fastForwardTime');
//https://github.com/pooleja/UlyssesPact

contract('Up', function(accounts) {
  //TODO scrap this test and hi() function

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
  //test deposit
  //probably should not mix await and then
  it("should assert true", function() {
    var up;
    return Up.deployed().then(async function(instance){
      up = instance;
      console.log("contract address: " + up.address);

      await up.deposit(2, 2, {from: accounts[1], value: 2});

      //TODO assert this value is correct
      web3.eth.getBalance(up.address, function(err,res) {
        console.log("balance is: " + res.toString(10)); // because you get a BigNumber
        assert(res.toString(10) == 2);
      });

    });
  });
});