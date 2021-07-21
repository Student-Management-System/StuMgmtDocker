#!/bin/sh

set -e

psql <<SQL
	CREATE USER sparky_db_user WITH PASSWORD '$SPARKY_DB_PW';
	CREATE DATABASE sparky_db OWNER sparky_db_user;
SQL
