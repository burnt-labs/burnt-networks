#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/home/xiond/.xiond"
export MOUNTDIR="/tmp/testnet"

function setup_node() {
  xiond init "${MONIKER}" --chain-id "${CHAIN_ID}" --home "${BASEDIR}" --overwrite
  cp -vf ${MOUNTDIR}/genesis.json ${BASEDIR}/config/genesis.json
}

setup_node
xiond genesis add-genesis-account "${ADDRESS}" "${GENESIS_AMOUNT}" --append --home "${BASEDIR}"
cp -vf "${BASEDIR}/config/genesis.json" "${MOUNTDIR}/genesis.json"
