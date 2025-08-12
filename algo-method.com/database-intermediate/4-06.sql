CREATE TABLE users(
    id INTEGER NOT NULL PRIMARY KEY,
    name TEXT UNIQUE,
    age INTEGER,
    CHECK(5 <= LENGTH(name) AND LENGTH(name) <= 15),
    CHECK(age >= 13)
);

INSERT INTO
    users
VALUES
    ("00001", "arara234", 38),
    ("00002", "ir1ri_kame", 14),
    ("00003", "oruru", 25);

SELECT
    *
FROM
    users;
