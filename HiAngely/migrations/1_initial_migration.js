var Migrations = artifacts.require("./Migrations.sol");
var HiAngely = artifacts.require("./HiAngely.sol");

module.exports = function(deployer) {
  deployer.deploy(Migrations);
  deployer.deploy(HiAngely);
};


