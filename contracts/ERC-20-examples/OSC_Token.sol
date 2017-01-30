pragma solidity ^0.4.3;
/* ERC 20 Token */
contract Token {
    function totalSupply() constant returns (uint256 supply) {}
    function balanceOf(address _owner) constant returns (uint256 balance) {}
    function transfer(address _to, uint256 _value) returns (bool success) {}
    function transferFrom(address _from, address _to, uint256 _value) returns (bool success) {}
    function approve(address _spender, uint256 _value) returns (bool success) {}
    function allowance(address _owner, address _spender) constant returns (uint256 remaining) {}

    event Transfer(address indexed _from, address indexed _to, uint256 _value);
    event Approval(address indexed _owner, address indexed _spender, uint256 _value);

}


contract OSC_Token is Token {
    uint public startBlock; 
    uint public endBlock;
    address public founder;
    uint public etherCap;
    bool public halted = false;
    event Buy(address indexed sender, uint eth, uint fbt);
    function OSC_Token(address _founder, uint _startBlock, uint _endBlock) {
        founder = _founder;
        startBlock = _startBlock;
        endBlock = _endBlock;
                
    }


    /**
     * Do not allow direct deposits.
     *
     * All crowdsale depositors must have read the legal agreement.
     * This is confirmed by having them signing the terms of service on the website.
     * They give their crowdsale Ethereum source address on the website.
     * Website signs this address using crowdsale private key (different from founders key).
     * buy() takes this signature as input and rejects all deposits that do not have
     * signature you receive after reading terms of service.
     *
     */
    function() {
        throw;
    }

}