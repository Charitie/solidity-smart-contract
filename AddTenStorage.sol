// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {TestStorage} from "./TestStorage.sol";

contract AddTenStorage is TestStorage {
      function store(uint256 _newNumber) public override  {
        myFavoriteNumber = _newNumber + 10;
    }
}