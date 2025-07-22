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

contract UniswapV2PairList {
    // constructor(uint256 from, uint256 step, address factory) {
    //     uint256 allPairsLength = IFactory(factory).allPairsLength();

    //     if (from >= allPairsLength) {
    //         bytes memory empty;
    //         assembly {
    //             return(add(empty, 0x20), 0)
    //         }
    //     }

    //     step = from + step > allPairsLength ? allPairsLength - from : step;

    //     FactoryPair[] memory factoryPairs = new FactoryPair[](step);

    //     for (uint256 i = 0; i < step; ++i) {
    //         uint256 currentIndex = from + i;
    //         factoryPairs[i] = FactoryPair({
    //             pairIndex: currentIndex,
    //             pairAddress: IFactory(factory).allPairs(currentIndex)
    //         });
    //     }
    
    //     bytes memory _abiEncodedData = abi.encode(factoryPairs);

    //     assembly {
    //         let dataStart := add(_abiEncodedData, 0x20)
    //         return(dataStart, sub(msize(), dataStart))
    //     }
    // }

    function getFactoryPair(uint256 from, uint256 step, address factory) external view returns (FactoryPair[] memory) {
        uint256 allPairsLength = IFactory(factory).allPairsLength();
        
        if (from >= allPairsLength) {
            bytes memory empty;
            assembly {
                return(add(empty, 0x20), 0)
            }
        }

        step = from + step > allPairsLength ? allPairsLength - from : step;

        FactoryPair[] memory factoryPairs = new FactoryPair[](step);

        for (uint256 i = 0; i < step; ++i) {
            uint256 currentIndex = from + i;
            factoryPairs[i] = FactoryPair({
                pairIndex: currentIndex,
                pairAddress: IFactory(factory).allPairs(currentIndex)
            });
        }
        return factoryPairs;
    
        // bytes memory _abiEncodedData = abi.encode(factoryPairs);

        // assembly {
        //     let dataStart := add(_abiEncodedData, 0x20)
        //     return(dataStart, sub(msize(), dataStart))
        // }
    }
}
