#!/bin/bash

echo "host    all             pipeline        ${MASTER_HOST}           trust" >> "/scripts/conf/pg_hba.conf"
echo "host    replication     pipeline        ${REPLICA_HOST}           trust" >> "/scripts/conf/pg_hba.conf"
