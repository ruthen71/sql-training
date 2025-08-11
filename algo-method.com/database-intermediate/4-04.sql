CREATE TABLE users(
    id TEXT NOT NULL PRIMARY KEY,
    name TEXT UNIQUE,
    email TEXT UNIQUE,
    age INTEGER
);

INSERT INTO
    users
VALUES
    ("00001", "arara234", "arara.qa@algo-method.com", 38),
    ("00002", "ir1ri_kame", "iriri.yi@algo-method.com", 14),
    ("00003", "oruru", "oruru.td@algo-method.com", 25);

SELECT
    *
FROM
    users;
