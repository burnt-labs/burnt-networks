![Burnt banner](https://files.xion-testnet-1.burnt.com/banner.jpg)

# burnt-networks

Reference config for all Burnt networks.

Please refer to the [official documentation](https://docs.burnt.com) for more details.

## Mainnet

- Coming soon!

## Testnets

- [xion-testnet-1](./testnets/xion-testnet-1/)
- [xion-rehearsal-1](./testnets/xion-rehearsal-1/)

## Genesis Tooling

We are automating our lead-up to mainnet genesis, out of an abundance of transparency and caution.

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

### Adding your `gentx` to the genesis file

If you are a validator, you will need to add your `gentx` to the genesis file.

You're welcome to generate it with methods you are familiar with, but for convenience we have a tool to help you.

1. Configure the `gentx` bind mounts in `docker-compose.yaml`
2. Configure the `gentx` envs in `docker-compose.yaml`
2. Run the following command:
```bash
docker compose up gentx
```

---