#!/bin/bash
set -e

# Check for required environment variables
if [ -z "${POSTGRES_USER}" ]; then
  echo "ERROR: Missing environment variable POSTGRES_USER"
  exit 1
fi

if [ -z "${POSTGRES_DB}" ]; then
  echo "ERROR: Missing environment variable POSTGRES_DB"
  exit 1
fi

# Check for optional environment variable
if [ -n "${POSTGRES_NON_ROOT_USER:-}" ]; then
    psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname "$POSTGRES_DB" <<EOSQL
        CREATE USER ${POSTGRES_NON_ROOT_USER} WITH PASSWORD '${POSTGRES_NON_ROOT_PASSWORD}';
        GRANT USAGE ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};
        GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO ${POSTGRES_NON_ROOT_USER};
        ALTER DEFAULT PRIVILEGES IN SCHEMA public GRANT ALL PRIVILEGES ON TABLES TO ${POSTGRES_NON_ROOT_USER};
        GRANT CREATE ON SCHEMA public TO ${POSTGRES_NON_ROOT_USER};
        GRANT CONNECT ON DATABASE ${POSTGRES_DB} TO ${POSTGRES_NON_ROOT_USER};
        CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
EOSQL
else
    echo "SETUP INFO: No Environment variables given for non-root user setup!"
fi