# Error Handling in solidity

This Solidity contract implements a simple auction system, enabling users to place bids on an item. The contract features a bid function that allows users to submit bids, which must be higher than the current highest bid. The contract also includes a getHighestBid function that returns the current highest bid, ensuring that it is a non-negative value. Furthermore, the contract provides a withdraw function, accessible only by the highest bidder, which enables them to claim the highest bid amount. The contract ensures that only the highest bidder can withdraw the funds, preventing unauthorized access.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. This contract implements an auction system, allowing users to place bids on an item and maintaining a record of the highest bid and the corresponding bidder. Additionally, it ensures the integrity of the bidding process by preventing unauthorized withdrawals and maintaining the highest bid amount, which can only be claimed by the highest bidder.

## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., myToken.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract Auction{
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

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile eth_avx_md1.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "Auction" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling various functions to manage the auction process. Click on the deployed Auction contract in the left-hand sidebar. To place a bid, click on the bid function, pass the required parameter (uint _amount), and execute the function to submit a new bid, provided it is higher than the current highest bid. To view the current highest bid, click on the getHighestBid function and execute it to see the current highest bid amount. To withdraw the highest bid amount, click on the withdraw function, but note that only the highest bidder can execute this function to claim their winnings. The contract uses require to ensure that bids are valid and revert to halt transactions if conditions are not met, ensuring a secure and transparent auction process.

## Authors

Saurabh Mishra  


## License

This project is licensed under the MIT License
