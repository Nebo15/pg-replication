#!/bin/bash

echo "host    all            postgres         ${REPLICA_HOST}           trust" >> "${PGDATA}/pg_hba.conf"
echo "host    replication    postgres         ${REPLICA_HOST}           trust" >> "${PGDATA}/pg_hba.conf"
echo "host    all            all              172.17.0.0/16           trust" >> "${PGDATA}/pg_hba.conf"

echo "wal_level = 'logical'" >> "${PGDATA}/postgresql.conf"
echo "max_worker_processes = 10" >> "${PGDATA}/postgresql.conf"
echo "max_replication_slots = 10" >> "${PGDATA}/postgresql.conf"
echo "max_wal_senders = 10" >> "${PGDATA}/postgresql.conf"
echo "shared_preload_libraries = 'pglogical'" >> "${PGDATA}/postgresql.conf"
