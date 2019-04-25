# unita-docker
Unita docker image

## What is Unita

Unita is an enterprise blockchain solution. It features high TPS (Transactions Per Second) and low transaction confirmation time, to make DApps (Decentralized Applications) applicable to more business scenarios. By using SCAR (Scalable Consensus Algorithm), storage and network requirements are minimized to reduce operating costs. Unita development is based on the open-source Qtum project, which is compatible with the Bitcoin UTXO data structure and Ethereum EVM using Solidity for smart contracts.

## Resource

Tools: [Homepage](https://unita.network), [Download](https://github.com/UnitaNetwork/unita/releases), [Stats](https://stats.unita.network), [Explorer](https://explorer.unita.network), [Faucet](https://faucet.unita.network), [One-click Blockchain](https://chain.unita.network).

Document: [English](https://doc.unita.network/en/), [中文](https://doc.unita.network/zh/).

## Roadmap
1. Develop the blockchain system, with SCAR consensus. (Done)
2. Build related tools, including Stats, Explorer, Faucet, One-click Blockchain, etc. (Done)
3. Develop application templates, to show how to build business applications based on Unita. (In progress)
4. Upload Unita to cloud service providers, like AWS and Google Cloud, to make the system deployment more convenient. (Todo)
5. Develop the cross-chain solution, Canal. (Todo)
6. Develop the data management solution, DDAO. (Todo)
7. Start courses, teaching how to develop projects on Unita. (Todo)

## Quickstart

### Get docker image

You might take either way:

#### Pull a image from Public Docker hub
```
$ docker pull unita/unita
```

Or, build unita image with provided Dockerfile
```
$docker build --rm -t unita/unita .
```
### Launch unitad

In order to save block chain data, -v option for docker is recommended.

First chose a path to save qtum block chain data:

```
$ sudo rm -rf /data/unita-data
$ sudo mkdir -p /data/unita-data
$ sudo chmod a+w /data/unita-data
$ cd /data/unita-data
```

If you want to use user-defined config file, you need to creat your config file:
```
$ cd /data/unita-data
$ touch unita.conf
 ```
Note rpcuser and rpcpassword to required for later unita-cli usage for docker, so it is better to set those two options. So edit /data/unita-data/unita.conf(${PWD}/qtum.conf) with content:
```
rpcuser=unita
rpcpassword=unitatest
```

To launch unita node:

```
## to launch unitad
$ docker run -d --rm --name unita_node \
             -v ${PWD}:/root/.unita  
             unita/unita unitad

## check docker processed
$ docker container ls

## to stop unitad
$ docker run -i --network container:unita_node \
             -v ${PWD}:/root/.unita
             unita/unita unita-cli stop
```
### Interact with unitad using unita-cli
Use following docker command to interact with your unita node with unita-cli:
```
$ docker exec -it unita_node sh
# unita-cli getblockchaininfo
```

For more unita-cli commands, use:
```
$ docker exec -it unita_node sh
# unita-cli help
```
