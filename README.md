![Burnt banner](https://files.xion-testnet-1.burnt.com/banner.jpg)

# burnt-networks

Reference config for all Burnt networks.

Please refer to the [official documentation](https://docs.burnt.com) for more details.

To contribute to the repo, please refer to the [contributing guidelines](./CONTRIBUTING.md).

## Mainnet

- [xion-mainnet-1](./mainnet/xion-mainnet-1/)

## Testnets

- [xion-testnet-1](./testnets/xion-testnet-1/)
- [xion-rehearsal-1](./testnets/xion-rehearsal-1/)
- [xion-rehearsal-2](./testnets/xion-rehearsal-2/)
- [xion-rehearsal-3](./testnets/xion-rehearsal-3/)
- [xion-rehearsal-4](./testnets/xion-rehearsal-4/)

## Genesis Tooling

We are automating our lead-up to mainnet genesis, out of an abundance of transparency and caution.

---

### Shorthand Usage

The commands below are all encapsulated in the Makefile:

```bash
make clean      # wipe out the .docker/home/...
make validate   # validate the genesis file
make hash       # generate the genesis.json hashes
make verify     # verify the genesis.json hashes
make account    # add a genesis account only
make gentx      # add a genesis account and generate a validator gentx
make collect    # collect all pending gentxs
```

---

### Validating the genesis file

The zeroth block of a Cosmos chain is represented by its `genesis.json` file. It contains the entire initial state of the network. 

To validate any genesis file in this repo, using the xiond binary:

1. Configure the bind mounts in `docker-compose.yaml`
2. Run the following command:
```bash
docker compose up validate-genesis
```

---

### Hashing and Verification of the genesis file

As an extra measure, we hash the genesis file for verification by the end user.

Don't Trust, Verify!

1. We generate the hashes with:
```bash
docker compose up generate-hashes
```
2. You verify the hashes with:
```bash
docker compose up verify-hashes
```

---

### Adding a Genesis Account

To add your Account to the genesis block with a token amount:

1. Configure the `add-genesis-account` bind mounts in `docker-compose.yaml`
2. Configure the `add-genesis-account` envs in `docker-compose.yaml`
3. Run the following command:
```bash
docker compose up add-genesis-account
```

---

### Adding a Validator Account

If you are a validator, you will need to add your account to genesis by running `gentx`.

You're welcome to generate it with methods you are familiar with, but for convenience we have a tool to help you.

1. Configure the `gentx` bind mounts in `docker-compose.yaml`
2. Configure the `gentx` envs in `docker-compose.yaml`
2. Run the following command:
```bash
docker compose up gentx
```

---

### Collecting all `gentx` files and adding them to genesis

The final step is to collect all `gentx` files and enshrine them to genesis.

1. Configure the `collect-gentxs` bind mounts in `docker-compose.yaml`
2. Run the following command:
```bash
docker compose up collect-gentxs
```
