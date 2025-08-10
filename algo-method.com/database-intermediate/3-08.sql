SELECT
    students.name AS "氏名",
    subjects.name AS "科目名",
    grades.score AS "点数"
FROM
    grades
    INNER JOIN students
        ON grades.student_id = students.id
        INNER JOIN subjects
            ON grades.subject_id = subjects.id;
