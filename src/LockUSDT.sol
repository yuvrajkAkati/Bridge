// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {IERC20} from "@openzeppelin/contracts/token/ERC20/IERC20.sol";

contract LockUSDT {
    address public usdtAddress; 
    mapping (address => uint256) pendingBalance;

    constructor(address _usdtAddress){
        usdtAddress = _usdtAddress;
    }

    function deposit (uint256 amount) public{
        require(IERC20(usdtAddress).allowance(msg.sender,address(this)) >= amount) ;
        IERC20(usdtAddress).transferFrom(msg.sender,address(this),amount);
        pendingBalance[msg.sender] += amount;
    }
    function withdraw() public{
        IERC20(usdtAddress).transfer(msg.sender,pendingBalance[msg.sender]);
        pendingBalance[msg.sender] = 0;
    }

}