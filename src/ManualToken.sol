// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

contract ManualToken {
  

    mapping(address => uint256) private s_balances;

    string public name = "ManualToken";
    
    constructor() {
        s_balances[msg.sender] = totalSupply();
    }


    function totalSupply() public pure returns(uint256) {
        return 100 ether; //100 + 18decimals
    }
    function decimals() public pure returns(uint256){
        return 18;
    }
    function balanceOf(address _owner) public view returns (uint256) {
        return s_balances[_owner];
    }

    function transfer(address _to,uint256 _amount) public{
        uint256 previousBalances = balanceOf(_to) + balanceOf(msg.sender);
        s_balances[msg.sender] -= _amount;
        s_balances[_to] += _amount;
        require(balanceOf(msg.sender) + balanceOf(_to) == previousBalances);
    }

}