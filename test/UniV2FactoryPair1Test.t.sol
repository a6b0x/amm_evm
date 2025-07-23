pragma solidity ^0.8.13;

import {console} from "forge-std/console.sol";
import {Test} from "forge-std/Test.sol";
import {UniV2FactoryPair1, FactoryPair} from "../src/UniV2FactoryPair1.sol";

contract UniV2FactoryPair1Test is Test {
    UniV2FactoryPair1 public uniV2FactoryPair;
    address univ2FactoryAddr = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    uint256 indexFrom = 0;
    uint256 indexStep = 5;

    function testFactoryPair1Constructor() public {
        uniV2FactoryPair = new UniV2FactoryPair1(indexFrom, indexStep, univ2FactoryAddr);
        console.log("uniV2FactoryPair address:", address(uniV2FactoryPair));
    }
}
