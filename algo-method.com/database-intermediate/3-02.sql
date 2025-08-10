SELECT
    students.name AS "氏名",
    faculties.name AS "所属学部"
FROM
    students
    INNER JOIN faculties
        ON students.faculty_id = faculties.id;
