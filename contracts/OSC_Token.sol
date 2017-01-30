import "./StandardToken.sol";

pragma solidity ^0.4.3;

contract OSC_Token is StandardToken {
    address public constant regulator = 0x9cb73b65aef8dfc4137314fdcb48ab8ffb61ae07;
    uint public startBlock; 
    uint public endBlock;
    address public founder;
    uint256 public weiPerToken;
    uint256 public weiCap;
    uint256 public weiRaised;
    uint256 public totalSupply;
    bool public frozen = true;

    event BuySuccess(address _buyer, uint256 _numTokens);
    event StartingBuy(address _buyer, uint256 _numTokens, uint256 _value);
    event BuyAttemptOnFrozenToken(address _buyer, uint256 _numTokens, uint256 _value);
    event InsufficientFundsOnBuy(address _buyer, uint256 _numTokens, uint256 _value);

    modifier onlyRegulator {
        if (msg.sender != regulator){
            throw;
        }
        else {
            _;
        }
    }

    function approveToken () onlyRegulator {
        frozen = false;
    }

    function OSC_Token (uint256 _totalSupply,
                        uint256 _weiCap,
                        uint256 _weiPerToken,
                        address _founder,
                        uint _startBlock,
                        uint _endBlock) {
        totalSupply = _totalSupply;
        weiCap = _weiCap;
        weiPerToken = _weiPerToken;
        founder = _founder;
        startBlock = _startBlock;
        endBlock = _endBlock;
    }


    function buy (uint256 _numTokens) payable {
        StartingBuy(msg.sender, _numTokens, msg.value);
        if (frozen) {
            BuyAttemptOnFrozenToken(msg.sender, _numTokens, msg.value);
            throw;
        } else {

            if(msg.value < _numTokens*weiPerToken){
                InsufficientFundsOnBuy(msg.sender, _numTokens, msg.value);
                throw;
            }else {
                BuySuccess(address(msg.sender), _numTokens);
                balances[msg.sender] = balances[msg.sender] + _numTokens;
                if (!founder.send(msg.value)) throw;                
            }

        }
    }


    /* Refuse direct deposits */
    function () payable {
        throw;
    }
}
