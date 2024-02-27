// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.20;

import {console} from "forge-std/Test.sol";
import {BaseTest} from "@kei.fi/testing-lib/BaseTest.sol";

import {VotesContainer, IVotesContainer, IVotes} from "src/VotesContainer/VotesContainer.sol";
import {GovernanceLibrary} from "src/lib/GovernanceLibrary.sol";
import {ERC20VotesMock} from "./mocks/ERC20VotesMock.sol";
import {GovernanceTest} from "src/tests/GovernanceTests.sol";

contract VotesContainerTest is BaseTest, GovernanceTest {
}

contract VotesContainerTest__delegate is VotesContainerTest {

    function test_success() external {
        address votes = GovernanceLibrary.createVotesContainer();
        address token = address(new ERC20VotesMock());

        assertEq(IVotes(token).getVotes(ALICE), 0, 'start with no tokens');

        ERC20VotesMock(token).mint(votes, 1 ether);
        assertEq(ERC20VotesMock(token).totalSupply(), 1 ether, 'token should only have 1 ether total supply');
        assertEq(ERC20VotesMock(token).balanceOf(votes), 1 ether, 'token should have the total supply held by VotesContainer');

        assertEq(IVotes(token).getVotes(votes), 0, 'after mint votes should be 0');
        assertEq(IVotes(token).getVotes(ALICE), 0, 'alice should also be 0 after mint');

        IVotesContainer(votes).delegate(token, ALICE);

        assertEq(IVotes(token).getVotes(votes), 0, 'VotesContainer should have delegated its entire votes to Alice');
        assertEq(IVotes(token).getVotes(ALICE), 1 ether, 'Alice should have the votes from VotesContainer');
    }
}
