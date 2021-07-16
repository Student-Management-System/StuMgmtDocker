#!/bin/bash

set -e

psql <<SQL
	CREATE USER $BACKEND_DB_USER WITH PASSWORD '$BACKEND_DB_PW';
	CREATE DATABASE studentmgmt_db OWNER $BACKEND_DB_USER;

	\c studentmgmt_db;

	CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
SQL
