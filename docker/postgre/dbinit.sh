#!/bin/bash

psql -U postgres -c "CREATE DATABASE my_db"
psql -U postgres -d my_db -c "CREATE TABLE test (test INTEGER PRIMARY KEY)"
psql -U postgres -d my_db -c "INSERT INTO test VALUES ('111')"
