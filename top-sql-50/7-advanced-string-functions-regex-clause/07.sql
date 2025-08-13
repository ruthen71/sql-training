SELECT
    *
FROM
    Users
WHERE
    BINARY mail REGEXP BINARY '^[a-zA-Z][a-zA-Z0-9._-]*@leetcode\\.com$'
;
