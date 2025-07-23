//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IFactory {
    function allPairs(uint256 idx) external returns (address);
    function allPairsLength() external returns (uint256);
}

contract UniV2FactoryPair {
    constructor(uint256 from, uint256 step, address factory) {
        uint256 allPairsLength = IFactory(factory).allPairsLength();

        step = from + step > allPairsLength ? allPairsLength - from : step;
        address[] memory allPairs = new address[](step);

        for (uint256 i = 0; i < step; ++i) {
            allPairs[i] = IFactory(factory).allPairs(from + i);
        }

        bytes memory _abiEncodedData = abi.encode(allPairs);

        assembly {
            let dataStart := add(_abiEncodedData, 0x20)
            return(dataStart, sub(msize(), dataStart))
        }
    }
}
