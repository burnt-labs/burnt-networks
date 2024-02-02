#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/home/xiond/.xiond"
export MOUNTDIR="/tmp/testnet"
export MONIKER="validate-genesis"
export CHAIN_ID="xion-testnet-1"

#
# helper to call validate-genesis
# we could get fancy with interchaintests, but let's just go with the binary for now
#

rm -rvf /home/xiond/.xiond

xiond init "${MONIKER}" \
  --chain-id "${CHAIN_ID}" \
  --home "${BASEDIR}"

cp -vf ${MOUNTDIR}/genesis.json ${BASEDIR}/config/genesis.json

xiond genesis validate-genesis \
  ${BASEDIR}/config/genesis.json
