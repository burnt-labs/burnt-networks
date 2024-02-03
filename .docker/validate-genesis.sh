#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/home/xiond/.xiond"
export MOUNTDIR="/tmp/testnet"
export MONIKER=${MONIKER:-"burnt"}
export CHAIN_ID=${CHAIN_ID:-"test"}

function setup() {
  rm -rvf ${BASEDIR}
  xiond init "${MONIKER}" \
    --chain-id "${CHAIN_ID}" \
    --home "${BASEDIR}"
  cp -vf ${MOUNTDIR}/genesis.json ${BASEDIR}/config/genesis.json
}

#
# helper to call validate-genesis
# we could get fancy with interchaintests, but let's just go with the binary for now
#

setup
xiond genesis validate-genesis \
  ${BASEDIR}/config/genesis.json
