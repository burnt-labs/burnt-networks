#!/usr/bin/env bash
set -euxo pipefail

export BASEDIR="/home/xiond/.xiond"
export MOUNTDIR="/tmp/testnet"

xiond init "${MONIKER}" --chain-id "${CHAIN_ID}" --home "${BASEDIR}"

xiond keys add "${KEYNAME}" --keyring-backend file --home $BASEDIR [--recover]
export ADDRESS=$(xiond keys show "${KEYNAME}" -a --keyring-backend file --home "${BASEDIR}")

xiond genesis add-genesis-account "${ADDRESS}" "${GENESIS_AMOUNT}"
xiond genesis gentx "${KEYNAME}" "${GENESIS_AMOUNT}" \
  --chain-id "${CHAIN_ID}" \
  --keyring-backend file \
  --commission-max-rate ${COMMISSION_MAX_RATE} \
  --commission-max-change-rate ${COMMISSION_MAX_CHANGE_RATE} \
  --commission-rate ${COMMISSION_RATE}
xiond genesis collect-gentxs
xiond genesis validate-genesis
