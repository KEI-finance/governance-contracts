// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test} from "forge-std/Test.sol";
import {VotesContainer} from "src/VotesContainer/VotesContainer.sol";

contract VotesContainerTest is Test {
    VotesContainer public votes;

    constructor() {
        votes = new VotesContainer();
    }
}

contract VotesContainerTest__delegate is VotesContainerTest {}
