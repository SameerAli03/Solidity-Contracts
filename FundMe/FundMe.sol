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

    // function withdraw() public{

    // }

}
