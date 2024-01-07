CREATE TABLE events (
    uuid CHAR(36) NOT NULL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    description LONGTEXT,
    start_date VARCHAR(100) NOT NULL,
    end_date VARCHAR(100) NOT NULL,
    user_id VARCHAR(36)
);