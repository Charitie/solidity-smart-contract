// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.24;

import {PriceConverter} from "./PriceConverter.sol";

contract FundMe{
    using PriceConverter for uint256;

    uint256 public minUsd = 5e18;

    address[] public funders;
    mapping (address funder => uint256 amountFunded) public  addressToAmountFunded;

    address public owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
        require(msg.value.getConversionRate() >= minUsd, "Eth sent is too low" );   
        funders.push(msg.sender); 
        addressToAmountFunded[msg.sender] = addressToAmountFunded[msg.sender] + msg.value;
    }

    // function getVersion() public view returns (uint256) {
    //     return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
    // }


    function withdraw() public onlyOwner {
        // require(msg.sender == owner, "Must be owner!");

        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        // //transfer
        // payable(msg.sender).transfer(address(this).balance);

        // //send
        // bool sendSuccess = payable (msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed");

        //call
        (bool callSuccess,  ) = payable (msg.sender).call{value: address(this).balance  }("");
        require(callSuccess, "Call failed");
    }

    modifier  onlyOwner(){
        require(msg.sender == owner, "Must be owner!");
        _;// execute any other code after validation
    }
}