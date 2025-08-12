PRAGMA foreign_keys = ON;

CREATE TABLE posts(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    body TEXT,
    CHECK(1 <= LENGTH(body) AND LENGTH(body) <= 140),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

INSERT INTO
    posts(body, user_id)
VALUES
    ("おはようございます", 1),
    ("今日は暑いですね", 1),
    ("あ", 3);

SELECT
    users.name AS "ユーザ名",
    posts.body AS "投稿内容"
FROM
    users
    INNER JOIN posts
        ON posts.user_id = users.id;
