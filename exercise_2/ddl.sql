/*
CREATE DATABASE vtapp;

CREATE USER vtapp_user WITH PASSWORD 'vinsol';

GRANT CONNECT ON DATABASE vtapp TO vtapp_user;

\c vtapp   -- we have to connect to the database before granting schema/table permissions

GRANT USAGE ON SCHEMA public TO vtapp_user;

GRANT ALL PRIVILEGES ON ALL TABLES IN SCHEMA public TO vtapp_user;

*/