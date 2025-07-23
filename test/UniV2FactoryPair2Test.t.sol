pragma solidity ^0.8.13;

import {console} from "forge-std/console.sol";
import {Test} from "forge-std/Test.sol";
import {UniV2FactoryPair2, FactoryPair} from "../src/UniV2FactoryPair2.sol";

contract UniV2FactoryPair2Test is Test {
    UniV2FactoryPair2 public uniV2FactoryPair2;
    address univ2FactoryAddr = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    uint256 indexFrom = 0;
    uint256 indexOffset = 5;

    function testGetFactoryPair2() public {
        console.log("univ2Factory address:", univ2FactoryAddr);
        uniV2FactoryPair2 = new UniV2FactoryPair2();
        FactoryPair[] memory factotyPair = uniV2FactoryPair2.getFactoryPair(
            indexFrom,
            indexOffset,
            univ2FactoryAddr
        );
        for (uint256 i = 0; i < factotyPair.length; ++i) {
            console.log("Pair address:", factotyPair[i].pairAddress);
        }
    }
}
