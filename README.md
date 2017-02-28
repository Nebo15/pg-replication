## Docker configuration for logical replication with pglogical tool
### (https://2ndquadrant.com/en/resources/pglogical/)

#### Contents
1. docker/postgre - docker container with preinstalled postgresql 9.6 and pglogical
2. docker/pipelindeb - docker container with preinstalled pipelinedb (postgres 9.5) and pglogical  

#### PGDATA
1. /var/lib/postgresql/data  
2. /mnt/pipelindb/data  

#### API
All images can be configured by defining values for the following ENV VARs:  
MASTER_HOST (default: "172.17.0.2/32")  
REPLICA_HOST (default: "172.17.0.3/32")  
