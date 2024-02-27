// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.20;

import {Test} from "forge-std/Test.sol";

import {VotesContainer} from "../VotesContainer/VotesContainer.sol";
import {GovernanceLibrary} from "../lib/GovernanceLibrary.sol";

contract GovernanceTest is Test {

    constructor() {
        VotesContainer votes = new VotesContainer();
        vm.etch(GovernanceLibrary.CONTAINER_IMPLEMENTATION, address(votes).code);
    }
}
