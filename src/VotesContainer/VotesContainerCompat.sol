// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.20;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import {IVotesContainer} from "./IVotesContainer.sol";

contract VotesContainerCompat {

    error VotesContainerAlreadyInitialized();

    function initialize(address container, address owner) external {
        if (OwnableUpgradeable(container).owner() == address(0)) {
            revert VotesContainerAlreadyInitialized();
        }

        IVotesContainer(container).initialize();
        OwnableUpgradeable(container).transferOwnership(owner);
    }
}
