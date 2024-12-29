// SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "forge-std/Script.sol";
import "../src/OurToken.sol";

contract DeployOurToken is Script{
    address public owner;
    constructor() {
        owner = msg.sender;
    }
    uint256 public constant INITIAL_SUPPLY = 1000 ether;
    function run() external returns(OurToken) {
        vm.startBroadcast();
        OurToken ot = new OurToken(INITIAL_SUPPLY);
        vm.stopBroadcast();
        return ot;
    }
    
}