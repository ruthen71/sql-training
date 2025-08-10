SELECT
    faculties.id AS "学部ID",
    faculties.name AS "学部名",
    COUNT(*) AS "学生数"
FROM
    faculties
    INNER JOIN students
        ON faculties.id = students.faculty_id
GROUP BY
    faculties.id
ORDER BY
    faculties.id;
