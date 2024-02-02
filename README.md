![Burnt banner](https://files.xion-testnet-1.burnt.com/banner.jpg)

# burnt-networks

Reference config for all Burnt networks.

Please refer to the [official documentation](https://docs.burnt.com) for more details.

## Mainnet

- Coming soon!

## Testnets

- [xion-testnet-1](./testnets/xion-testnet-1/)


## Genesis Tooling

We are automating our lead-up to genesis, ut of an abundance of transparency and caution.

### Validating the genesis file

The zeroth block of a Cosmos chain is represented by its `genesis.json` file. It contains the entire initial state of the network. 

To validate any genesis file in this repo:

1. Configure the bind mounts in `docker-comose.yaml`
2. Run the following command:
```bash
docker compose up validate-genesis
```
