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
