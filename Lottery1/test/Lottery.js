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

  //TODO delete hi function related tests
  it("should assert true", async function() {

    let hi  = await lottery.hi( );

    await lottery.join(5, {from: accounts[1]});
    let guessed = await lottery.getGuess( accounts[1] );

    console.log("Result string = ", hi);
    console.log("guess is = ", guessed.toNumber());
  });
});
