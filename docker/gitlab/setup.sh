#!/bin/bash

# Required environment variables
REQUIRED_ENV=(
  "DATA_PATH"
)

# Check missing environment variables
missing_variables=false
for env in "${REQUIRED_ENV[@]}"; do
  if [[ -z "${!env}" ]]; then
    echo "Missing required environment variable $env"
    missing_variables=true
  fi
done

# Exit if there are missing variables
if [ $missing_variables = "true" ]; then exit 1; fi

# Creating data directories
mkdir -p ${DATA_PATH}/gitlab/{config,data,logs}
mkdir -p ${DATA_PATH}/gitlab-postgres/data

# Start necessary components
docker-compose -f compose-gitlab.yaml up -d redis postgresql

# Wait for the components to be ready and healthy
read -p "Wait until the components are ready and healthy then press enter to continue..."

# Start gitlab
docker-compose -f compose-gitlab.yaml up -d gitlab
