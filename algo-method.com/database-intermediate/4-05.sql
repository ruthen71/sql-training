PRAGMA foreign_keys = ON;

CREATE TABLE regions(
    id INTEGER NOT NULL PRIMARY KEY,
    name TEXT
);

CREATE TABLE prefectures(
    id INTEGER NOT NULL PRIMARY KEY,
    name TEXT,
    region_id INTEGER,
    FOREIGN KEY (region_id) REFERENCES regions(id)
);

INSERT INTO
    regions
VALUES
    (1, "北海道"),
    (2, "東北");

INSERT INTO
    prefectures
VALUES
    (1, "北海道", 1),
    (2, "青森県", 2),
    (3, "岩手県", 2);

SELECT
    prefectures.name AS "都道府県名",
    regions.name AS "地方名"
FROM
    prefectures
    INNER JOIN regions
        ON prefectures.region_id = regions.id;
