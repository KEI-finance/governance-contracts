// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.20;

import {OwnableUpgradeable} from "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

import {IVotesContainer} from "./IVotesContainer.sol";

contract VotesContainerCompat {

    error VotesContainerAlreadyInitialized();

    function initialize(address[] calldata containers, address owner) external {
        uint256 _totalContainers = containers.length;
        for (uint i; i < _totalContainers; i++) {
            if (OwnableUpgradeable(containers[i]).owner() == address(0)) {
                revert VotesContainerAlreadyInitialized();
            }

            IVotesContainer(containers[i]).initialize();
            OwnableUpgradeable(containers[i]).transferOwnership(owner);
        }
    }
}
