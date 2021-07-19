CREATE USER studentmgmt_db_user WITH PASSWORD '__BACKEND_DB_PW__';
CREATE DATABASE studentmgmt_db OWNER studentmgmt_db_user;

\c studentmgmt_db;

CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

