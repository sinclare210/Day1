// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ClickCounter {
   uint256 public counter;

   function increaseCounter () public {
        counter = counter + 1;
   } 

   function decreaseCounter () public {
        counter--;
   }

   function reset () public {
        counter = 0;
   }
}
