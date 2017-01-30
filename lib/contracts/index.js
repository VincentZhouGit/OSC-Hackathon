module.exports = Contracts;
var Web3 = require('web3');
var compiled = require('./compiled').contracts;
var instances = require('./instances');


function Contracts(host) {
	var host = host || 'http:\/\/localhost:8545';
	web3 = new Web3(new Web3.providers.HttpProvider(host));
	web3.eth.defaultAccount = web3.eth.accounts[0];
	this.instances = {};
	for (var i = 0 ; i < instances.length; i++) {
        	var address = instances[i].address;
        	var name = instances[i].name;
        	var abi = JSON.parse(compiled[name].abi);
        	this.instances[address] = web3.eth.contract(abi).at(address);
	}
}
