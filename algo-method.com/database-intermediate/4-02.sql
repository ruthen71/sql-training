CREATE TABLE prefectures(
    id INTEGER,
    name TEXT,
    area INTEGER,
    population INTEGER
);

INSERT INTO
    prefectures
VALUES
    (1, "北海道", 83423, 5225000),
    (2, "青森県", 9645,  1238000),
    (3, "岩手県", 15275, 1211000);

SELECT
    *
FROM
    prefectures;
