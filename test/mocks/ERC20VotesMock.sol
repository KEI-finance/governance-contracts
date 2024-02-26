// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import {ERC20Votes, ERC20} from "@openzeppelin/contracts/token/ERC20/extensions/ERC20Votes.sol";
import {EIP712} from "@openzeppelin/contracts/utils/cryptography/EIP712.sol";

contract ERC20VotesMock is ERC20Votes {
    constructor()
    ERC20("ERC20Mock", "E20M")
    EIP712("ERC20Mock", "E20M") {}

    function mint(address account, uint256 amount) external {
        _mint(account, amount);
    }

    function burn(address account, uint256 amount) external {
        _burn(account, amount);
    }
}
