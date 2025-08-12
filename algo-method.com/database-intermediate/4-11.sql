CREATE TABLE follows(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    followee_id INTEGER,
    follower_id INTEGER,
    FOREIGN KEY (followee_id) REFERENCES users(id)
    FOREIGN KEY (follower_id) REFERENCES users(id)
);

INSERT INTO
    follows(followee_id, follower_id)
VALUES
    (1, 2),
    (1, 3),
    (2, 1);

SELECT
    id,
    followee_id,
    follower_id
FROM
    follows;
