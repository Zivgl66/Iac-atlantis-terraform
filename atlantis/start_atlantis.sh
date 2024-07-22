#!/bin/bash

# Export the Vault address
export VAULT_ADDR='http://127.0.0.1:8200'

# Retrieve secrets from Vault and set as environment variables
export ATLANTIS_GH_USER=$(vault kv get -field=gh_user secret/atlantis)
export ATLANTIS_GH_TOKEN=$(vault kv get -field=gh_token secret/atlantis)
export ATLANTIS_REPO_ALLOWLIST=$(vault kv get -field=repo_allowlist secret/atlantis)
export ATLANTIS_GITLAB_TOKEN=$(vault kv get -field=gitlab_token secret/atlantis)
export ATLANTIS_GITLAB_WEBHOOK_SECRET=$(vault kv get -field=gitlab_webhook_secret secret/atlantis)


# Decode and write the GCP key to the config folder
vault kv get -field=key secret/atlantis/gcp-key | base64 -d > ./config/gcp-cred.json


# Set the GOOGLE_APPLICATION_CREDENTIALS environment variable
export GOOGLE_APPLICATION_CREDENTIALS="/etc/atlantis/gcp-cred.json"

# Ensure the variables are set
if [ -z "$ATLANTIS_GH_USER" ] || [ -z "$ATLANTIS_GH_TOKEN" ] || [ -z "$ATLANTIS_REPO_ALLOWLIST" ] || [ -z "$ATLANTIS_GITLAB_TOKEN" ] || [ -z "$ATLANTIS_GITLAB_WEBHOOK_SECRET" ] || [ -z "$GOOGLE_APPLICATION_CREDENTIALS" ]; then
  echo "Error: One or more environment variables are not set."
  exit 1
fi

# Pass the environment variables to Docker Compose
sudo ATLANTIS_GH_USER=$ATLANTIS_GH_USER ATLANTIS_GH_TOKEN=$ATLANTIS_GH_TOKEN ATLANTIS_REPO_ALLOWLIST=$ATLANTIS_REPO_ALLOWLIST ATLANTIS_GITLAB_TOKEN=$ATLANTIS_GITLAB_TOKEN ATLANTIS_GITLAB_WEBHOOK_SECRET=$ATLANTIS_GITLAB_WEBHOOK_SECRET GOOGLE_APPLICATION_CREDENTIALS=$GOOGLE_APPLICATION_CREDENTIALS docker-compose up -d
