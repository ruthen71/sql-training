CREATE TABLE posts(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT DEFAULT "名無し",
    body TEXT
);

INSERT INTO
    posts(body)
VALUES
    ("こんにちは"),
    ("今日は暑いですね");

INSERT INTO
    posts(name, body)
VALUES
    ("イルル", "こんにちは");

SELECT
    *
FROM
    posts;
