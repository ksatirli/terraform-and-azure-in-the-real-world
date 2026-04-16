#!/usr/bin/env bash
set -euo pipefail

RG="rg-demo"
NAME="stdemo${RANDOM}"
LOCATION="eastus2"

az \
  group \
    create \
      --name "${RG}" \
      --location "${LOCATION}"

az \
  storage \
    account \
      create \
        --name "${NAME}" \
        --resource-group "${RG}" \
        --location "${LOCATION}" \
        --sku Standard_LRS \
        --kind StorageV2 \
        --min-tls-version TLS1_2 \
        --allow-blob-public-access false \
        --https-only true

echo "created: ${NAME}"
