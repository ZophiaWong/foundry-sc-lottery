#include .env

.PHONY: all test deploy

all : clean remove install update build

clean :; forge clean

# remove modules
remove :; rm -rf .gitmodules && rm -rf .git/modules/* && rm -rf lib && touch .gitmodules && git add . && git commit -m "modules"

install :; forge install cyfrin/foundry-devops@0.2.2 && forge install smartcontractkit/chainlink-brownie-contracts@1.1.1 && forge install foundry-rs/forge-std@v1.8.2 && forge install transmissions11/solmate@v6

update :; forge update

build :; forge build

test :; forge test

deploy-sepolia: 
	@forge script scripts/DeployRaffle.s.sol:DeployRaffle --rpc-url $(SEPOLIA_RPC_URL) --account $(ACCOUNT) --broadcast --verify --etherscan-api-key $(ETHERSCAN_API_KEY) -vvvv

fund-subscription : 
	@forge script scripts/Interactions.s.sol:FundSubscription --rpc-url $(SEPOLIA_RPC_URL) --account $(ACCOUNT) --broadcast -vvvv
