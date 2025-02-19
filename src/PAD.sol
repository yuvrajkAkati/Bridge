// SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.13;

import {ERC20} from "@openzeppelin/contracts/token/ERC20/ERC20.sol"; 
import {Ownable} from "@openzeppelin/contracts/access/Ownable.col";

contract PAD is ERC20 , Ownable { 
    constructor() ERC20("PAD","PD") Ownable(msg.sender) {

    }

    function mint(address _to,uint256 amount) public isOwner {
        _mint(_to,amount);
    }
}