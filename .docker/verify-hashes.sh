#!/usr/bin/env bash
set -euxo pipefail

export MOUNTDIR="/tmp/testnet"
export HASH_FILE="${MOUNTDIR}/genesis.asc"

function setup() {
  apt-get update
  apt-get install -y --no-install-recommends \
    openssl
}

#
# helper to verify the different genesis file hashes
#

function verify_hash() {
  HASH_TYPE=$1
  FILE=$2

  case $HASH_TYPE in
    "SHA-256")
      ACTUAL_HASH=$(sha256sum $FILE | cut -d' ' -f1)
      EXPECTED_HASH=$(grep "$HASH_TYPE" "$HASH_FILE" | cut -d' ' -f2)
      ;;
    "SHA-512")
      ACTUAL_HASH=$(sha512sum $FILE | cut -d' ' -f1)
      EXPECTED_HASH=$(grep "$HASH_TYPE" "$HASH_FILE" | cut -d' ' -f2)
      ;;
    "SHAKE128")
      ACTUAL_HASH=$(cat $FILE | openssl dgst -shake128 | cut -d' ' -f2)
      EXPECTED_HASH=$(grep "$HASH_TYPE" "$HASH_FILE" | cut -d' ' -f3)
      ;;
    "SHAKE256")
      ACTUAL_HASH=$(cat $FILE | openssl dgst -shake256 | cut -d' ' -f2)
      EXPECTED_HASH=$(grep "$HASH_TYPE" "$HASH_FILE" | cut -d' ' -f3)
      ;;
  esac

  if [ "$EXPECTED_HASH" == "$ACTUAL_HASH" ]; then
    echo "$HASH_TYPE verification successful."
  else
    echo "$HASH_TYPE verification failed."
    exit 1
  fi
}

setup
verify_hash "SHA-256" "${MOUNTDIR}/genesis.json"
verify_hash "SHA-512" "${MOUNTDIR}/genesis.json"
verify_hash "SHAKE128" "${MOUNTDIR}/genesis.json"
verify_hash "SHAKE256" "${MOUNTDIR}/genesis.json"
