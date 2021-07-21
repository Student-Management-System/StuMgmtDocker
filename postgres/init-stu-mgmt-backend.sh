#!/bin/sh

set -e

psql <<SQL
	CREATE USER studentmgmt_db_user WITH PASSWORD '$BACKEND_DB_PW';
	CREATE DATABASE studentmgmt_db OWNER studentmgmt_db_user;

	\c studentmgmt_db;

	CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
SQL
