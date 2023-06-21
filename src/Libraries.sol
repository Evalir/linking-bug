// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

library NameDoesNotMatterHere {
    function NameWhateverHere(uint256 a) public pure returns (uint256) {
        return a;
    }
}


library Library2 {
    function NameDoesNotMatterHere2() public pure returns (uint256){
        NameDoesNotMatterHere.NameWhateverHere(1);

        return 1;
    }
}