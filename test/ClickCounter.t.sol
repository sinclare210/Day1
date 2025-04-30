// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Test} from "forge-std/Test.sol";
import {ClickCounter} from "../src/ClickCounter.sol";

contract ClickCounterTest is Test {
    uint256 counter;
    ClickCounter clickCounter;

    function setUp() public {
        clickCounter = new ClickCounter();
    }

    function testIfNumberIncrease() public {
        clickCounter.increaseCounter();
        assertEq(clickCounter.counter(), 1);
    }

    function testIfNumberDecrease() public {
        clickCounter.increaseCounter();
        clickCounter.decreaseCounter();
        assertEq(clickCounter.counter(), 0);
    }

    function testIfNumberReset() public {
        clickCounter.reset();
        assertEq(clickCounter.counter(), 0);
    }

    function testMultipleIncrements() public {
        clickCounter.increaseCounter();
        clickCounter.increaseCounter();
        clickCounter.increaseCounter();
        assertEq(clickCounter.counter(), 3);
    }

    function testMultipleDecrements() public {
        clickCounter.increaseCounter();
        clickCounter.increaseCounter();
        clickCounter.decreaseCounter();
        clickCounter.decreaseCounter();
        assertEq(clickCounter.counter(), 0);
    }

    function testDecrementBelowZero() public {
        vm.expectRevert(); // Expect panic error (underflow)
        clickCounter.decreaseCounter();
    }

    function testResetAfterMutations() public {
        clickCounter.increaseCounter();
        clickCounter.increaseCounter();
        clickCounter.reset();
        assertEq(clickCounter.counter(), 0);
    }

    function testFuzzIncrease(uint256 times) public {
        times = bound(times, 0, 1000); // limit to prevent excessive gas usage
        for (uint256 i = 0; i < times; i++) {
            clickCounter.increaseCounter();
        }
        assertEq(clickCounter.counter(), times);
    }
}
