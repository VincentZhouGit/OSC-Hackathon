pragma solidity ^0.4.3;

import "./OSC_Token.sol";

contract OSC {
    address public regulator;
    mapping (address => address) public tokensByFounder;
    event TokenCreated(address indexed token, address owner);

    function OSC (address _regulator) {
        regulator = _regulator;
    }
    
    function createToken (uint256 _totalSupply,
                          uint256 _weiCap,
                          uint256 _weiPerToken,
                          address _founder,
                          uint _startBlock,
                          uint _endBlock) returns (address) {
        var token = new OSC_Token(_totalSupply, 
                              _weiCap,
                              _weiPerToken,
                              _founder,
                              _startBlock,
                              _endBlock);
        
        tokensByFounder[_founder] = address(token); 
        TokenCreated(address(token), _founder);                   
        return address(token);                               
    }
}
