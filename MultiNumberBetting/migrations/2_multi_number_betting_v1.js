var MultiNumberBettingV1 = artifacts.require("./MultiNumberBettingV1.sol");
var MultiNumberBettingV4 = artifacts.require("./MultiNumberBettingV4.sol");

//module.exports = function(deployer) {  <------ THIS was part of the error
  // Use deployer to state migration tasks.
module.exports = function(deployer) {
  //deployer.deploy(MultiNumberBettingV1, 1, 2, 3);
  deployer.deploy(MultiNumberBettingV4,1,3,9);
};
//};
