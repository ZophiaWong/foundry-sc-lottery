# Provably Random Raffle Contracts

A Provably Fair Decentralized Lottery Contract with comprehensive testing and .

## Description

### Features

1. Users should be able to enter the raffle by paying for a ticket. The ticket fees are going to be the prize the winner receivers.
2. The lottery should automatically and programmatically draw a winner after a certain period.
3. Chainlink VRF should generate a provably random number.
4. Chainlink Automation should trigger the lottery draw regularly.

###

- core `Raffle.sol` contract logic,
  - **Chainlink VRF/Automation** integration,
  - and the crucial **Checks-Effects-Interactions** security pattern
- Custom Errors, Enums and Private Variables
- Verbose Constructor
- Raffle and Chainlink Automation
- Smart Contract Execution and Testing
- Broadcasting and Interaction via Command Line
- Testing and Debugging

## Table of Content

- [Provably Random Raffle Contracts](#provably-random-raffle-contracts)
  - [Description](#description)
    - [Features](#features)
    - [](#)
  - [Table of Content](#table-of-content)
  - [Installation](#installation)
    - [Prerequisites](#prerequisites)
    - [QuickStart](#quickstart)
      - [Adding](#adding)
- [setup .env](#setup-env)

## Installation

### Prerequisites

- [git](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git)
  - You'll know you did it right if you can run `git --version` and you see a response like `git version x.x.x`
- [foundry](https://getfoundry.sh/)
  - You'll know you did it right if you can run `forge --version` and you see a response like `forge 0.2.0 (816e00b 2023-03-16T00:05:26.396218Z)`

### QuickStart

```
git clone https://github.com/ZophiaWong/foundry-sc-lottery
cd foundry-sc-lottery
forge build
```

#### Adding

# setup .env

- ACCOUNT
- SEPOLIA_RPC_URL
