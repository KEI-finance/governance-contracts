// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

import {Clones} from "@openzeppelin/contracts/proxy/Clones.sol";

import {IVotesContainer} from "../VotesContainer/IVotesContainer.sol";

library GovernanceLibrary {
    address internal constant CONTAINER_IMPLEMENTATION = 0x8069D509b03BE2DC191DF198652D071Bb7220fCD;

    function createVotesContainer() internal returns (address instance) {
        instance = Clones.clone(CONTAINER_IMPLEMENTATION);
        IVotesContainer(instance).initialize();
    }
}
