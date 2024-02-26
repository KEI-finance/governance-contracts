// SPDX-License-Identifier: UNLICENSED
pragma solidity >=0.8.0;

/// @title Voting Interface
/// @author My Name
/// @notice This interface provides voting information and functionality
interface IVotesContainer {
    /// @notice Initializes the contract
    function initialize() external;

    /// @notice Returns the number of votes of a given token
    /// @param token The token whose votes to return
    /// @return The number of votes
    function getVotes(address token) external view returns (uint256);

    /// @notice Returns the number of votes of a given token at a certain block
    /// @param token The token whose votes to return
    /// @param blockNumber The block at which to check the votes
    /// @return The number of votes
    function getPastVotes(address token, uint256 blockNumber) external view returns (uint256);

    /// @notice Returns the delegate of a token
    /// @param token The token whose delegate to return
    /// @return The delegate's address
    function delegates(address token) external view returns (address);

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
