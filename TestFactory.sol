// SPDX-License-Identifier: MIT
pragma solidity 0.8.24;

import {TestStorage} from "./TestStorage.sol";

contract TestFactory {
    TestStorage[] public listOfTestStorageContracts;

    function createTestStorageContract() public {
        TestStorage TestStorageContractVariable = new TestStorage();
        // TestStorage TestStorage = new TestStorage();
        listOfTestStorageContracts.push(TestStorageContractVariable);
    }

    function sfStore(
        uint256 _TestStorageIndex,
        uint256 _TestStorageNumber
    ) public {
        // Address
        // ABI
        // TestStorage(address(TestStorageArray[_TestStorageIndex])).store(_TestStorageNumber);
        listOfTestStorageContracts[_TestStorageIndex].store(
            _TestStorageNumber
        );
    }

    function sfGet(uint256 _TestStorageIndex) public view returns (uint256) {
        // return TestStorage(address(TestStorageArray[_TestStorageIndex])).retrieve();
        return listOfTestStorageContracts[_TestStorageIndex].retrieve();
    }
}