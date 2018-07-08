# hello-kong

Experiments with Kong API Gateway

## Requirements

- [docker & docker-compose](https://store.docker.com/editions/community/docker-ce-desktop-mac)

## Installation

- Step 1: Start Postgres

```sh
docker-compose -f compose-kong.yaml up -d postgres
```

- Step 2: Run Kong database migration on Postgres (only do this on first installation)

```sh
docker-compose -f compose-kong.yaml run --rm kong kong migrations up --v
```

- Step 3: Start Kong & optional Dashboard

```sh
docker-compose -f compose-kong.yaml up -d kong dashboard
```

- Step 4: Configure Kong on Admin Dashboard at http://localhost:1337 or through Admin API at http://localhost:8001
