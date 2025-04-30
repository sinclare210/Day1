// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import {Script, console} from "forge-std/Script.sol";

import {ClickCounter} from "../src/ClickCounter.sol";

contract ClickCounterScript is Script{
    ClickCounter public clickCounter;

    function setUp() public{

    }

    function run () public{
        
        vm.startBroadcast();

        clickCounter = new ClickCounter();

        vm.stopBroadcast();
    }
}