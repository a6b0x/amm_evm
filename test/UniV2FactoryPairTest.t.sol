pragma solidity ^0.8.13;

import {console} from "forge-std/console.sol";
import {Test} from "forge-std/Test.sol";
import {UniV2FactoryPair} from "../src/UniV2FactoryPair.sol";

contract UniV2FactoryPairTest is Test {
    UniV2FactoryPair public factoryPair;
    address univ2FactoryAddr = 0x5C69bEe701ef814a2B6a3EDD4B1652CB9cc5aA6f;
    uint256 indexFrom = 0;
    uint256 indexStep = 5;

    function testFactoryPairConstructor() public {
        console.log("univ2Factory address:", univ2FactoryAddr);
        factoryPair = new UniV2FactoryPair(
            indexFrom,
            indexStep,
            univ2FactoryAddr
        );
        console.log("factoryPair address:", address(factoryPair));
    }
}
