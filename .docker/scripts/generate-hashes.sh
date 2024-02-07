#!/usr/bin/env bash
set -euxo pipefail

export MOUNTDIR="/tmp/testnet"
export HASH_FILE="${MOUNTDIR}/genesis.asc"

function setup() {
  apt-get update
  apt-get install -y --no-install-recommends openssl
  rm -vf ${HASH_FILE}
}

#
# helper to hash the genesis file for verification
#
# we'll be using SHA-2 / SHA-256 and SHA-512
# as well as SHA-3 / SHAKE128 and SHAKE256
#

setup
cd ${MOUNTDIR}
echo "SHA-256:" $(sha256sum ${MOUNTDIR}/genesis.json) > "$HASH_FILE"
echo "SHA-512:" $(sha512sum ${MOUNTDIR}/genesis.json) >> "$HASH_FILE"
echo "SHAKE128:" $(cat ${MOUNTDIR}/genesis.json | openssl dgst -shake128) >> "$HASH_FILE"
echo "SHAKE256:" $(cat ${MOUNTDIR}/genesis.json | openssl dgst -shake256) >> "$HASH_FILE"
