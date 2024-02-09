# Contributing to Burnt Networks

The genesis tooling provided is this repository is designed to be used by the Burnt Networks Validator community to generate all required files to boot and join the different Burnt networks.

## Getting Started

To get started, please refer to the [official documentation](https://docs.burnt.com) for a rundown of the protocol.

## Using the Genesis Tooling

---

### Step 1: Start fresh

First, let's start with a blank slate.

```bash
make clean
```

This will wipe out the `.docker/home/...` directory.

---

### Step 2: Validate the existing genesis file

Before adding any changes, ensure that the existing genesis file is valid.

```bash
make validate
```

If `make validate` fails, something is wrong with the genesis file. Please do not proceed until the genesis file is valid.

---

### Step 3: Verify the genesis file hashes

As an extra measure, we hash the genesis file for verification by the end user.

```bash
make verify
```

If `make verify` fails, the genesis file hashes do not match. Please do not proceed until the genesis file hashes are valid.

---

### Step 4: Create gentx for your Validator node

This step will provide you with all the required files to run your Validator node.

Specifically, the files we're interested in are:
- `**/genesis.json`
- `**/gentx/<moniker>.json`
- `.docker/home/config/node_key.json`
- `.docker/home/config/priv_validator_key.json`

```bash
make gentx
```

NB. Be sure to keep the `node_key.json` and `priv_validator_key.json` files safe and secure. 

These are the keys which identify your Validator node on the network, and are used to compute your node ID. They are associated with your gentx; if you lose them, you will need to regenerate your gentx for genesis boot, or join the network at a later time.

---

### Step 5: Committing your files to the repository

This repository has some branch protections in place:
- The `main` branch requires linear history; ie. rebases only.
- The `main` branch requires signed commits.
- You cannot push directly to `main`.
- Your PR cannot be rebased without at least one approval from a `CODEOWNER`.
- Your PR cannot be rebased without passing the CI checks.
- The CI checks require that the `make validate` and `make verify` commands pass.

To get your changes into the repository, you will need to:
- Create a branch from `main`
- Push your changes to your branch
- Open a Pull Request
- Pass the CI checks
- Get at least one approval from a `CODEOWNER`.

The `CODEOWNERS` have final say on what gets merged into the `main` branch. If they're requesting changes or refusing your PR outright, there's a good reason for it.

---

## Finalizing the genesis file

The `CODEOWNERS` will review your PR and rebase it into the `main` branch. 

When all gentx's have been submitted, the `CODEOWNERS` will run the `make collect` command to collect all pending gentx's and add them to the final genesis file. 
