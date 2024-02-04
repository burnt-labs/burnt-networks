#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/home/xiond/.xiond"
export MOUNTDIR="/tmp/testnet"

function setup_node() {
  rm -rvf "${BASEDIR}/data"/* rm -rvf "${BASEDIR}/config"/*
  for dir in "${BASEDIR}"/keyring*; do
      [ -d "$dir" ] && rm -rvf "$dir"
  done

  xiond init "${MONIKER}" --chain-id "${CHAIN_ID}" --home "${BASEDIR}"

  cp -vf ${MOUNTDIR}/genesis.json ${BASEDIR}/config/genesis.json
  mkdir -p ${BASEDIR}/config/gentx/
  cp -rvf ${MOUNTDIR}/gentx/* ${BASEDIR}/config/gentx/
}

setup_node

xiond genesis collect-gentxs
xiond genesis validate-genesis

cp -vf ${BASEDIR}/config/genesis.json ${MOUNTDIR}/genesis.json
