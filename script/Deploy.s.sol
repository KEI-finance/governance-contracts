// SPDX-License-Identifier: UNLICENSED
pragma solidity =0.8.20;

import "./Base.s.sol";

contract DeployScript is BaseScript {
    using stdJson for string;

    function run() public record {
        deploy("VotesContainer");
        deploy("VotesContainerCompat");

        //        RedeemableCard card = RedeemableCard(deploy("RedeemableCard.sol", abi.encode(deployer), false));
        //        ConsumableProvider provider = ConsumableProvider(deploy("ConsumableProvider.sol", abi.encode(deployer)));
        //
        //        for (uint256 i = 0; i < config.signers.length; i++) {
        //            address signer = config.signers[i];
        //            manager.grantRole(manager.API_SIGNER_ROLE(), signer);
        //        }
        //
        //        manager.grantRole(manager.DEFAULT_ADMIN_ROLE(), config.admin);
        //        manager.renounceRole(manager.DEFAULT_ADMIN_ROLE(), deployer);
    }
}
