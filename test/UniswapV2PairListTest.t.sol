pragma solidity ^0.8.13;

import {console} from "forge-std/console.sol";
import {Test} from "forge-std/Test.sol";
import {UniswapV2PairList, FactoryPair} from "../src/UniswapV2PairList.sol";

contract UniswapV2PairListTest is Test {
    UniswapV2PairList public pairListContract;
    address univ2Factory = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    uint256 indexFrom = 10;
    uint256 indexStep = 10;

    // function setUp() public {
    //     uint256 chainId = block.chainid;
    //     require(chainId == 1, "Mainnet required");
    // }

    function testGetFactoryPair() public {
        // bytes memory creationCode = abi.encodePacked(
        //     type(UniswapV2PairList).creationCode,
        //     abi.encode(indexFrom, indexStep, univ2Factory)
        // );

        // (bool success, bytes memory data) = address(0).call(creationCode);
        // require(success, "Query failed");

        // FactoryPair[] memory pairs = abi.decode(data, (FactoryPair[]));

        // for (uint256 i = 0; i < pairs.length; ++i) {
        //     console.log(
        //         "Pair index:",
        //         pairs[i].pairIndex,
        //         "address:",
        //         pairs[i].pairAddress
        //     );
        // }
        console.log("univ2Factory address:", univ2Factory);
        pairListContract = new UniswapV2PairList();
        FactoryPair[] memory factotyPair = pairListContract.getFactoryPair(
            indexFrom,
            indexStep,
            univ2Factory
        );
        for (uint256 i = 0; i < factotyPair.length; ++i) {
            console.log("Pair address:", factotyPair[i].pairAddress);
        }
    }
}
