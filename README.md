# rubix-osc-hackathon

## Using the contracts on the command line

* Start geth: `bin/geth-start`
* Compile them (if you make changes): `bin/compile`
* Deploy an OSC contract and some sample OSC Tokens: `bin/deploy`
* Test out their functions: `bin/console`


## ERC20 Tokens


Etherscan indicates there are about 1265 active ERC20-compliant Token contracts. A shortlist of 'interesting Tokens' is provided.

Rather than listing the details of all of these, you can have a look at better explanations [here](https://www.smithandcrown.com/icos/). This is a list of all major ICO's. Here is a shortlist of ICO's for which
I have at least glanced at the source.

* HackerGold
* DVIP
* BlockCDN
* RoundToken
* SingularDTVToken
* FirstBlood

These Tokens vary in complexity. Some are very simple extensions of the ERC 20 token, while others implement
more exotic functionality. The tokens also vary in their presentation of legal matters. Here](http://3amdeveloper.com/terms-and-conditions-of-the-ethereum-genesis-sale/) is a copy of the Ethereum pre-sale terms and conditions that has been removed from their site. Not all ICO's present their terms and conditions in the same manner.

A relevant Token to consider is the FirstBlood Token. This contract implements a mechanism described by the following
comment within the source code.

```
All crowdsale depositors must have read the legal agreement.
This is confirmed by having them signing the terms of service on the website.
They give their crowdsale Ethereum source address on the website.
Website signs this address using crowdsale private key (different from founders key).
buy() takes this signature as input and rejects all deposits that do not have
signature you receive after reading terms of service.
```

This is related to the sorts of restrictions we would like to impose. The contracts will be written in a similar
spirit. This begs the question, however, who constructed these terms and conditions? How are they assessed for legitimacy?

Legal comments on the following documents would be helpful.

* [First Blood Presale Agreemnt](https://firstblood.io/legal/presale_agreement.pdf)
* [Golem Whitepaper](http://golemproject.net/doc/DraftGolemProjectWhitepaper.pdf)
* [Hacker Gold Sale Terms](https://hack.ether.camp/sale/terms)
* [BlockCDN Terms](http://www.blockcdn.org/risk.jsp)

The simplicity of many of these tokens provides confidence that our ERC20 extension may suffice with no exotic features.
