//SPDX-License-Identifier: MIT
pragma solidity ^0.8.13;

interface IFactory {
    function allPairs(uint256 idx) external view returns (address);
    function allPairsLength() external view returns (uint256);
}

struct FactoryPair {
    uint256 pairIndex;
    address pairAddress;
}

contract UniV2FactoryPair2 {
    function getFactoryPair(
        uint256 indexFrom,
        uint256 indexOffset,
        address uniV2factoryAddress
    ) external view returns (FactoryPair[] memory) {
        uint256 allPairsLength = IFactory(uniV2factoryAddress).allPairsLength();

        if (indexFrom >= allPairsLength) {
            bytes memory empty;
            assembly {
                return(add(empty, 0x20), 0)
            }
        }

        indexOffset = indexFrom + indexOffset > allPairsLength ? allPairsLength - indexFrom : indexOffset;

        FactoryPair[] memory factoryPair = new FactoryPair[](indexOffset);

        for (uint256 i = 0; i < indexOffset; ++i) {
            uint256 currentIndex = indexFrom + i;
            factoryPair[i] = FactoryPair({
                pairIndex: currentIndex,
                pairAddress: IFactory(uniV2factoryAddress).allPairs(currentIndex)
            });
        }
        return factoryPair;
    }
}
