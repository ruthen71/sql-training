SELECT
    subjects.name AS "科目名",
    COUNT(students.enrollment_year = 2023 OR NULL) AS "1年生履修者数",
    COUNT(students.enrollment_year = 2022 OR NULL) AS "2年生履修者数"
FROM
    registrations
    INNER JOIN students, subjects
        ON registrations.student_id = students.id
        AND registrations.subject_id = subjects.id
GROUP BY
    "科目名";
