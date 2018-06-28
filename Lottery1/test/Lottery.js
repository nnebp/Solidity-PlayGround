const Lottery = artifacts.require("./Lottery.sol");
/*
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
*/

contract ('Lottery', (accounts) => {

  let lottery;
  const owner = accounts[0];

  beforeEach(async() => {
    lottery = await Lottery.new();
  });


  it("should assert true", async function() {
    //TODO get balance with await
    let balance = await web3.eth.getBalance(accounts[1]);
      console.log(balance.toString(10) + 'working??'); // because you get a BigNumber

    //good example of how to send a contract money
    await lottery.send(web3.toWei(10, "ether"));
    await lottery.send(1234);

    //join and win the lottery
    await lottery.join(4, {from: accounts[1]});
    await lottery.chooseWinner(4);

    web3.eth.getBalance(accounts[1], function(err,res) {
      console.log(res.toString(10) + 'hey'); // because you get a BigNumber
    });
    //assert.strictEqual(guessed, accounts[1], "winner did not get the funds");
  });

  it("should assert true", async function() {
    await lottery.join(5, {from: accounts[1]});
    let guessed = await lottery.getGuess(5);

    assert.strictEqual(guessed, accounts[1], "guess account does not match");
  });

  //TODO test guess with number >100 < 0

  //TODO test guess with same number twice

});
