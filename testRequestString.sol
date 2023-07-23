// SPDX-License-Identifier: MIT
pragma solidity 0.8.18;

import "@chainlink/contracts/src/v0.8/ChainlinkClient.sol";

contract testRequestString is ChainlinkClient {

    using Chainlink for Chainlink.Request;

    address constant oracleTaiko = 0x7053af6475b2a11Bff65E697E349d66e6580d371;
    string constant jobIdTaiko = "???";
    uint256 public constant ORACLE_PAYMENT = (1 * LINK_DIVISIBILITY) / 10; // 0.1 * 10**18 (0.1 LINK)
    string public currentPrice;

    event RequestEthereumPriceFulfilled(
        bytes32 indexed requestId,
        string indexed price
    );

    constructor() {
        setChainlinkToken(0xeC9a237864f7e78fd835Db717DB4e3d3c4254b11);
    }

    function requestEthereumPrice() public {
        Chainlink.Request memory req = buildChainlinkRequest(
            stringToBytes32(jobIdTaiko),
            address(this),
            this.fulfillEthereumPrice.selector
        );
        req.add(
            "get",
            "https://marcuswentz.github.io/chainlink_test_json_url_types/"
        );
        req.add("path", "bool");
        //req.addInt("times", 100);
        sendChainlinkRequestTo(oracleTaiko, req, ORACLE_PAYMENT);
    }

    function fulfillEthereumPrice(
        bytes32 _requestId,
        string calldata _id
    ) public recordChainlinkFulfillment(_requestId) {
        emit RequestEthereumPriceFulfilled(_requestId, _id);
        currentPrice = _id;
    }

    function stringToBytes32(
        string memory source
    ) private pure returns (bytes32 result) {
        bytes memory tempEmptyStringTest = bytes(source);
        if (tempEmptyStringTest.length == 0) {
            return 0x0;
        }

        assembly {
            // solhint-disable-line no-inline-assembly
            result := mload(add(source, 32))
        }
    }
}
