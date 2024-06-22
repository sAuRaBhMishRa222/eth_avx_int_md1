# Error Handling in solidity

This Solidity contract defines an error handling system with credit and debit functions, allowing for the increase and decrease of balances. The contract also includes checks to ensure that only the owner can perform these operations and maintains the total balance. Additionally, the contract provides a function to view the balance of a specific address, accessible only by the owner.

## Description

This program is a simple contract written in Solidity, a programming language used for developing smart contracts on the Ethereum blockchain. This contract implements an error handling system for managing balances, allowing the owner to credit and debit amounts from user accounts. Additionally, it maintains a record of each user's balance and ensures the integrity of the total balance across all accounts.
## Getting Started

### Executing program

To run this program, you can use Remix, an online Solidity IDE. To get started, go to the Remix website at https://remix.ethereum.org/.

Once you are on the Remix website, create a new file by clicking on the "+" icon in the left-hand sidebar. Save the file with a .sol extension (e.g., myToken.sol). Copy and paste the following code into the file:

```javascript
// SPDX-License-Identifier: MIT
pragma solidity 0.8.26;

contract errorhandling{
    address public owner;
    string public owner_name="Saurabh Mishra";
    uint public total_balance=0;

    mapping (address=>uint) public balances;

    constructor() {
        owner=msg.sender;
    }

    function credit(address _address, uint _amount) public {
        require(msg.sender==owner,"Only Owner has access to it...!!!!");
        total_balance+= _amount;
        balances[_address]+= _amount;

        assert(total_balance >= balances[_address]);
    } 

    function debit(address _address, uint _amount) public {
        require(msg.sender==owner,"Only Owner has access to it...!!!!");
        if(balances[_address]<_amount){
            revert("Balance is Insufficient");
        }
        total_balance-= _amount;
        balances[_address]-= _amount;

        assert(total_balance >= 0);
    }

    function get_balance(address _address) public view returns(uint ){
        assert(msg.sender==owner);
        return balances[_address];
    } 
}

```

To compile the code, click on the "Solidity Compiler" tab in the left-hand sidebar. Make sure the "Compiler" option is set to "0.8.26" (or another compatible version), and then click on the "Compile eth_avx_md1.sol" button.

Once the code is compiled, you can deploy the contract by clicking on the "Deploy & Run Transactions" tab in the left-hand sidebar. Select the "errorhandling" contract from the dropdown menu, and then click on the "Deploy" button.

Once the contract is deployed, you can interact with it by calling various functions to manage balances. Click on the deployed `errorhandling` contract in the left-hand sidebar. To credit an account, click on the `credit` function, pass the required parameters (address `_address` and uint `_amount`), and execute the function to increase the balance of the specified address and update the total balance. To debit an account, click on the `debit` function, pass the required parameters (address `_address` and uint `_amount`), and execute the function to decrease the balance of the specified address, provided it has sufficient balance, and update the total balance. To view the balance of an account, click on the `get_balance` function, pass the required parameter (address `_address`), and execute the function to see the balance of the specified address. The contract uses `require` to ensure only the owner can call `credit` and `debit` functions, `assert` to enforce critical conditions, and `revert` to halt transactions if conditions are not met, ensuring robust error handling and access control.

## Authors

Saurabh Mishra  


## License

This project is licensed under the MIT License
