CREATE TABLE posts(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    name TEXT,
    body TEXT
);

INSERT INTO
    posts(name, body)
VALUES
    ("アルル", "こんにちは"),
    ("アルル", "今日は暑いですね"),
    ("イルル", "アルルさん、こんにちは");

SELECT
    *
FROM
    posts;
