// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Auction {
    address public owner;
    uint public highestBid;
    address public highestBidder;

    constructor() {
        owner = msg.sender;
        highestBid = 0;
    }

    function bid(uint _amount) public {
        require(_amount > highestBid, "Bid must be higher than the current highest bid");
        highestBid = _amount;
        highestBidder = msg.sender;
    }

    function getHighestBid() public view returns (uint) {
        assert(highestBid >= 0); 
        return highestBid;
    }

    function withdraw() public {
        if (msg.sender != highestBidder) {
            revert("Only the highest bidder can withdraw");
        }
        payable(msg.sender).transfer(highestBid);
    }
}
