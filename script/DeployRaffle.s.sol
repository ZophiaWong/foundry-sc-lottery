// SPDX-License-Identifier: MIT
pragma solidity 0.8.19;

import {Script} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Raffle} from "../src/Raffle.sol";
import {CreateSubscriptions, FundSubscription, AddConsumer} from "./Interactions.s.sol";

contract DeployRaffle is Script {
    function run() external returns (Raffle, HelperConfig) {
        HelperConfig helperConfig = new HelperConfig();
        HelperConfig.NetworkConfig memory config = helperConfig.getConfig();

        if (config.subscriptionId == 0) {
            // Create
            CreateSubscriptions createSubscriptions = new CreateSubscriptions();
            (config.subscriptionId, config.vrfCoordinatorV2_5) =
                createSubscriptions.createSubscription(config.vrfCoordinatorV2_5);
            // Fund it
            FundSubscription fundSubscription = new FundSubscription();
            fundSubscription.fundSubscription(config.vrfCoordinatorV2_5, config.subscriptionId, config.linkToken);
        }

        vm.startBroadcast();
        // deploy
        Raffle raffle = new Raffle(
            config.entranceFee,
            config.interval,
            config.vrfCoordinatorV2_5,
            config.gasLane,
            config.callbackGasLimit,
            config.subscriptionId
        );
        vm.stopBroadcast();
        // Add the deployed contract as consumer
        AddConsumer addConsumer = new AddConsumer();
        addConsumer.addConsumer(address(raffle), config.vrfCoordinatorV2_5, config.subscriptionId);

        return (raffle, helperConfig);
    }
}
