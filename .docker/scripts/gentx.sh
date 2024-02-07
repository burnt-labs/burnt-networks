#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/home/xiond/.xiond"
export MOUNTDIR="/tmp/testnet"

function setup_node() {
  rm -rvf "${BASEDIR}/data"/* "${BASEDIR}/config"/*
  for dir in "${BASEDIR}"/keyring*; do
      [ -d "$dir" ] && rm -rvf "$dir:?"/*
  done

  xiond init "${MONIKER}" --chain-id "${CHAIN_ID}" --home "${BASEDIR}"

  cp -vf ${MOUNTDIR}/genesis.json ${BASEDIR}/config/genesis.json
}

function setup_wallet() {
  set +x
  if [ -n "${MNEMONIC}" ];
  then
    (echo "${MNEMONIC}"; echo "${KEYRING_PASSPHRASE}"; echo "${KEYRING_PASSPHRASE}") | xiond keys add "${KEYNAME}" \
      --keyring-backend ${KEYRING_BACKEND} \
      --home ${BASEDIR} \
      --recover
  else
    (echo "${KEYRING_PASSPHRASE}"; echo "${KEYRING_PASSPHRASE}") | xiond keys add "${KEYNAME}" \
      --keyring-backend ${KEYRING_BACKEND} \
      --home ${BASEDIR}
  fi
  set -x
}

function gentx() {
  set +x
  export ADDRESS=$( (echo "${KEYRING_PASSPHRASE}"; echo "${KEYRING_PASSPHRASE}") | xiond keys show "${KEYNAME}" -a --keyring-backend ${KEYRING_BACKEND} --home "${BASEDIR}")
  set -x

  xiond genesis add-genesis-account "${ADDRESS}" "${GENESIS_AMOUNT}" --append --home "${BASEDIR}"

  set +x
  (echo "${KEYRING_PASSPHRASE}") | xiond genesis gentx "${KEYNAME}" "${GENESIS_AMOUNT}" \
    --chain-id "${CHAIN_ID}" \
    --keyring-backend "${KEYRING_BACKEND}" \
    --commission-max-rate "${VAL_COMMISSION_MAX_RATE}" \
    --commission-max-change-rate "${VAL_COMMISSION_MAX_CHANGE_RATE}" \
    --commission-rate "${VAL_COMMISSION_RATE}" \
    --details "${VAL_DETAILS}" \
    --identity "${VAL_IDENTITY}" \
    --moniker "${MONIKER}" \
    --note "$(xiond tendermint show-node-id)" \
    --security-contact "${VAL_SECURITY_CONTACT}" \
    --website "${VAL_WEBSITE}"
  set -x

  xiond genesis validate-genesis

  mkdir -vp "${MOUNTDIR}/gentx"
  cp -vf "${BASEDIR}/config/gentx/"gentx*.json "${MOUNTDIR}/gentx/${MONIKER}.json"
  cp -vf "${BASEDIR}/config/genesis.json" "${MOUNTDIR}/genesis.json"
}

setup_node
setup_wallet
gentx
