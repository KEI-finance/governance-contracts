// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.20;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";
import {IVotes} from "@openzeppelin/contracts/governance/utils/IVotes.sol";
import {SafeERC20, IERC20} from "@openzeppelin/contracts/token/ERC20/utils/SafeERC20.sol";

import {IVotesContainer} from "./IVotesContainer.sol";

contract VotesContainer is IVotesContainer, OwnableUpgradeable {
    using SafeERC20 for IERC20;

    function initialize() external initializer {
        __Ownable_init(msg.sender);
        __Context_init_unchained();
    }

    function delegate(address token, address target) external override onlyOwner {
        IVotes(token).delegate(target);
    }

    function transfer(address token, address to, uint256 amount) external override onlyOwner {
        IERC20(token).safeTransfer(to, amount);
    }
}
