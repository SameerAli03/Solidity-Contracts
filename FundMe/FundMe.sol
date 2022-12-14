//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./PriceConverter.sol";

contract FundMe{

    using PriceConverter for uint256;

    uint256 minimumUSD = 50;

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    function fund() public payable{
        require(msg.value.getCoversionRate() >= minimumUSD, "Not Enough ETH!");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] = msg.value;
    }

    function withdraw() public{
        for(uint256 funderIndex = 0; funderIndex = funder.length; funderIndex++){
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }

        funders = new address[](0);

        // Transfer
        payable(msg.sender).transfer(address(this).balance);

        // Send
        bool sendSuccess = payable(msg.sender).transfer(address(this).balance);
        require(sendSuccess, "Send Failed!");

        // Call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed!");
    }

}