// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import {AggregatorV3Interface} from "@chainlink/contracts@1.3.0/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";


contract FundMe{

    uint256 public minUsd = 5;

    function fund() public payable {
        require(getConversionRate(msg.value) >= minUsd, "Eth sent is too low" );    
    }

    function getPrice() public view returns{
       AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306)
       ( /* uint80 roundId */,
            int256 answer,
            /*uint256 startedAt*/,
            /*uint256 updatedAt*/,
            /*uint80 answeredInRound*/) = priceFeed.latestRoundData()

            return uint256 answer * 1e10
    }

    function getConversionRate(uint256 ethAmount) public view returns (uint256) {  
        uint256 ethPrice = getPrice();
        uint256 ethAmountInUsd = (ethPrice * ethAmount)/ 1e18;
        return ethAmountInUsd
    }


    function getVersion() public view returns (uint256) {
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    }

}