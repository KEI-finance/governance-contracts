// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.20;

import "./Base.s.sol";

contract DeployScript is BaseScript {
    using stdJson for string;

    function run() public record {
        deploy("VotesContainer");
    }
}
