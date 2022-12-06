//SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract FundMe{

    uint256 minimumUSD = 50;

    function fund() public payable{
        require(msg.value >= minimumUSD, "Not Enough ETH!");
    }

    function withdraw() public{

    }

}