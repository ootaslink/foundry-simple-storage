// SPDX-License-Identifier: MIT

pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {SimpleStorage} from "../../src/SimpleStorage.sol";
import {DeploySimpleStorage} from "../../script/DeploySimpleStorage.s.sol";

contract TestSimpleStorage is Test {
    uint256 private constant STORED_DATA = 50;
    SimpleStorage public simpleStorage;

    function setUp() external {
        DeploySimpleStorage deploySimpleStorage = new DeploySimpleStorage();
        simpleStorage = deploySimpleStorage.run();
    }

    function testStoredData() public {
        simpleStorage.set(STORED_DATA);
        assertEq(simpleStorage.get(), STORED_DATA);
    }

    function testNameToStoredData() public {
        simpleStorage.addPerson(STORED_DATA, "test");
        assertEq(simpleStorage.nameToMyStoredData("test"), STORED_DATA);
    }
}
