SELECT
    IFNULL(students.name, "該当なし") AS "氏名",
    faculties.name AS "所属学部"
FROM
    faculties
    LEFT OUTER JOIN students
        ON faculties.id = students.faculty_id;
