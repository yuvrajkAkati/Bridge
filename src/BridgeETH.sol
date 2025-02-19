// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import {Ownable} from "@openzeppelin/contracts/access/Ownable.sol";
import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract BridgeETH is ERC20,Ownable {
    address public tokenAdress;
    uint256 public balance;

    event Deposit(address indexed depositor,uint amount );
    mapping(address => uint256) public pendingAmount;

    constructor () Ownable(msg.sender) {
        tokenAdress = _tokenAddress
    }

    function deposit (IERC20 _tokenAdress, uint256 _amount) public {
        require(address(_tokenAdress) == tokenAdress);
        require(_tokenAdress.allowance(msg.sender,address(this)) >= _amount); 
        require(_tokenAdress.transferfrom(msg.sender,address(this),_amount));
        emit Deposit(msg.sender, _amount);
    }

    function withdraw(IERC20 _tokenAddress,uint256 _amount) public {
        require(address(_tokenAdress) == tokenAdress);
        require(pendingAmount[msg.sender] >= _amount);  
        pendingAmount[msg.sender] -= _amount;
        _tokenAddress.transfer(msg.sender,_amount)
    }

    function burnedOnOtherSide() public{
        pendingAmount[msg.sender] += _amount; 
    }
 }
