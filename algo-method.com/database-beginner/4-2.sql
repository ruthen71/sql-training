SELECT
    subject AS "科目",
    COUNT((90 <= score AND score <= 100) OR NULL) AS "秀",
    COUNT((80 <= score AND score < 90 ) OR NULL) AS "優",
    COUNT((65 <= score AND score < 80 ) OR NULL) AS "良",
    COUNT((50 <= score AND score < 65 ) OR NULL) AS "可",
    COUNT((0  <= score AND score < 50 ) OR NULL) AS "不可"
FROM
    grades
GROUP BY
    subject;
