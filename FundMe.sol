// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;

    uint256 public minUsd = 5e18;

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public  addressToAmountFunded;

    function fund() public payable {
        require(msg.value.getConversionRate() >= minUsd, "Eth sent is too low" );   
        funders.push(msg.sender); 
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // function getVersion() public view returns (uint256) {
    //     return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    // }

}