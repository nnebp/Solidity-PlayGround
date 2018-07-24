const Lottery = artifacts.require("./Lottery.sol");

contract ('Lottery', (accounts) => {

  let lottery;
  const owner = accounts[0];

  beforeEach(async() => {
    lottery = await Lottery.new();
  });

  it("should assert true", async function() {
    let balance = await web3.eth.getBalance(accounts[1]);
    console.log('original balance: ' + balance.toString(10)); // because you get a BigNumber

    //good example of how to send a contract money
    // TODO delete this await lottery.send(web3.toWei(2, "ether"));
    //await lottery.send(1234);

    //join and win the lottery
    await lottery.join(4, 2, {from: accounts[1], value: 2});
    await lottery.join(9, web3.toWei(2, "ether"), {from: accounts[3], value: web3.toWei(2, "ether")}); //loser account
    //confirm the address of the guess
    let addr = await lottery.getGuess(4);
    console.log('original address: ' + addr); // because you get a BigNumber
    await lottery.chooseWinner(4);

    let finalBalance = await web3.eth.getBalance(accounts[1]);
    console.log('balance after winning: ' + finalBalance.toString(10)); // because you get a BigNumber
    addr = await lottery.getGuess(4);
    console.log('final address (should be 0): ' + addr); // because you get a BigNumber

    //Important that the address balances arent all screwed up or this test will be all screwed up
    assert( finalBalance > balance);
  });
  //TODO guess and lose

  it("should assert true", async function() {
    await lottery.join(5, 2, {from: accounts[1], value:2});
    let guessed = await lottery.getGuess(5);

    assert.strictEqual(guessed, accounts[1], "guess account does not match");
  });

  //TODO test guess with number >100 < 0

  //TODO test guess with same number twice

});
