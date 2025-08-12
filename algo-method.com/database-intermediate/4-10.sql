CREATE TABLE likes(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    post_id INTEGER,
    FOREIGN KEY (user_id) REFERENCES users(id)
    FOREIGN KEY (post_id) REFERENCES posts(id)
);

INSERT INTO
    likes(user_id, post_id)
VALUES
    (2, 1),
    (2, 2),
    (3, 2),
    (1, 3);

SELECT
    posts.id AS "投稿ID",
    posts.body AS "投稿内容",
    users.id AS "いいねしたユーザのID",
    users.name AS "いいねしたユーザ"
FROM
    likes
    INNER JOIN posts, users
        ON likes.user_id = users.id
        AND likes.post_id = posts.id;
