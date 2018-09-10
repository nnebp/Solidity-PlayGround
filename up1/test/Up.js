var Up = artifacts.require("./Up.sol");
var timeHelper = require('./fastForwardTime');
//https://github.com/pooleja/UlyssesPact

contract('Up', function(accounts) {
  //TODO scrap this test and hi() function
/*
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
  */
  //test deposit
  //probably should not mix await and then
  it("should assert true", function() {
    var up;
    return Up.deployed().then(async function(instance){
      up = instance;
      console.log("contract address: " + up.address);

      await up.deposit(70, 2, {from: accounts[0], value: 70});

      //check balance matches deposit
      web3.eth.getBalance(up.address, function(err,res) {
        console.log("balance is: " + res.toString(10)); // because you get a BigNumber
        assert(res.toString(10) == 70);
      });

      let startBalance = await web3.eth.getBalance(accounts[0]);
      console.log("balance before withdrawal: " + startBalance);


      // Fast forward 100 blocks
      timeHelper.fastForward(101);

      await up.withdraw();

      let endBalance = await web3.eth.getBalance(accounts[0]);
      console.log("balance after withdrawal: " + endBalance);

      //TODO assert final balance
      //check balance matches 0??
      web3.eth.getBalance(up.address, function(err,res) {
        console.log("balance is: " + res.toString(10)); // because you get a BigNumber
        assert(res.toString(10) == 0);
      });
    });
  });
});