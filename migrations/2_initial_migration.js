var PassCrypt = artifacts.require("./PassCrypt");

module.exports = function(deployer) {
  deployer.deploy(PassCrypt);
};