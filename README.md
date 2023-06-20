# chainlink-contract-testing

1. Deployed LinkToken.sol (ERC-677 standard https://github.com/ethereum/EIPs/issues/677):

https://explorer.test.taiko.xyz/token/0xeC9a237864f7e78fd835Db717DB4e3d3c4254b11/token-transfers

2. Deployed Operator.sol:

https://explorer.test.taiko.xyz/address/0x7053af6475b2a11Bff65E697E349d66e6580d371

3. Added Chainlink node address to oracle list with a jobId specification setup with TOML file (see chainlink-taiko):

⚠️ Chainlnk node address 0x6FC84537f182329edCB488480837BDf210AF440d is a local node (will need to migrate to a hosted node on AWS or Linode) ⚠️

```solidity
setAuthorizedSenders["0x6FC84537f182329edCB488480837BDf210AF440d"]
```

4. Deployed ATestnetConsumerTaiko.sol

⚠️ jobId depends on the node and job type and is subject to change if a local node is reset like its address ⚠️

https://explorer.test.taiko.xyz/address/0x7FeA70871E575CE3069aCCE0D25725ec0840dD8E

5. Sent 1.00 LINK to ATestnetConsumerTaiko.sol

https://explorer.test.taiko.xyz/tx/0x5b7fee3b187c859a685fa96669bdc44e78c48bc781966d4b6903fbe6eaed30e3

6. Request ETH/USD:

https://explorer.test.taiko.xyz/tx/0xbffcd40a687277b1632b5271be90a0b5b0e101fe7a3d038d356ad93c12fbd53e

7. Transaction for requesting ETH/USD did not revert, but returns 0 since Chainlink node is not setup yet to fulfill async request
```
currentPrice
``` 
returns 
```
uint256: 0
``` 
