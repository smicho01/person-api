CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

CREATE TABLE person
(
    id         UUID PRIMARY KEY DEFAULT uuid_generate_v4(),
    name       VARCHAR(100),
    email      VARCHAR(100),
    created_at TIMESTAMP        DEFAULT CURRENT_TIMESTAMP
);