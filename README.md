# chainlink-contract-testing

1. Deployed LinkToken.sol (ERC-677 standard https://github.com/ethereum/EIPs/issues/677):

https://explorer.test.taiko.xyz/token/0xeC9a237864f7e78fd835Db717DB4e3d3c4254b11/token-transfers

2. Deployed Operator.sol:

https://explorer.test.taiko.xyz/address/0x7053af6475b2a11Bff65E697E349d66e6580d371

3. Added Chainlink node address to oracle list with a jobId specification setup with TOML file (see chainlink-taiko):

```solidity
setAuthorizedSenders["0x0000000000000000000000000000000000000000"]
```

4. Deployed ATestnetConsumerTaiko.sol

https://explorer.test.taiko.xyz/address/0x9E1D1631B5d08B9Ab5f75e560434c59235ec7AA3
