#!/bin/bash

set -e

CONFIG_PATH=/data/options.json

VAULT_ADDR=$(jq --raw-output ".vault_addr" $CONFIG_PATH)
VAULT_TOKEN=$(jq --raw-output ".vault_token" $CONFIG_PATH)
LOG_LEVEL=$(jq --raw-output ".log_level" $CONFIG_PATH)

export VAULT_TOKEN VAULT_ADDR

exec /consul-template -log-level=$LOG_LEVEL -template "/hassio_secrets.ctmpl:/config/secrets.yaml"
