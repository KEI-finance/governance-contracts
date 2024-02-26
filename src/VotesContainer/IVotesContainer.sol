// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

/// @title Voting Interface
/// @author My Name
/// @notice This interface provides voting information and functionality
interface IVotesContainer {
    /// @notice Initializes the contract
    function initialize() external;

    /// @notice Delegates a token to a target address
    /// @param token The token to delegate
    /// @param target The target address to delegate to
    function delegate(address token, address target) external;

    /// @notice Transfers a token to a certain address
    /// @param token The token to transfer
    /// @param to The recipient address
    /// @param amount The amount of token to transfer
    function transfer(address token, address to, uint256 amount) external;
}
