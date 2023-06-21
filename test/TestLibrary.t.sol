// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";

// import "src/Libraries.sol";

library Library {
    function foo() public pure returns (uint256) {
        return 42;
    }
}

library Library3 {
    function callLibrary3(uint256 a) public pure returns (uint256) {
        return a;
    }
}


library Library2 {
    function callLibrary2() public pure returns (uint256){
        Library3.callLibrary3(1);

        return 1;
    }
}

contract Contract {
    // We wanna have a call to Library so it needs to be deployed.
    function foo() public pure returns (uint256) {
        return Library.foo();
    }

    function callLibrary2() public pure returns (uint256) {
        return Library2.callLibrary2();
    }
}

contract TestLibrary is Test {
    Contract public c;

    function setUp() public {
        c = new Contract();
    }

    function testFoo() public view {
        // console.log(address(Library3)); // If you log this, forge does not detect tests anymore.
        // console.log(address(Library2)); // Or this
        // console.log(address(Library)); // Or this
        uint256 baz = c.callLibrary2(); // This causes the revert
        console.log(baz);
    }
}