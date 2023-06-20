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

https://explorer.test.taiko.xyz/address/0x1B6eE7086E155426916dd4dd3991281Cd48574B2

5. Sent 1.00 LINK to ATestnetConsumerTaiko.sol

https://explorer.test.taiko.xyz/tx/0x85ec9de9111557c9760489a4153dc436f64b797dc80411e62df273dc40cc6c78

6. Request ETH/USD:

⚠️ Make sure the Chainlink node has 1.0 ETH  to update uint256 value and contract has 1.0 LINK to pay the Chainlink node ⚠️

https://explorer.test.taiko.xyz/tx/0xb1d0d9608b354acfbf6ec470203b042be52d786bb0dc275c3b9fa9efb88a6276

Chainlink async response to update contract uint256 value:

https://explorer.test.taiko.xyz/tx/0x00400a50f1eb8ab1fd949a2546e343ec0f9e497c4eabc459e84591ba783e8a03

7. Transaction for requesting ETH/USD did not revert, but will return 0 if Chainlink node is not setup to fulfill async request
```
currentPrice
``` 
returns 
```
uint256: 173376
``` 
