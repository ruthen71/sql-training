SELECT
    *
FROM
    prefectures
WHERE name 
    IN ("栃木県", "群馬県", "埼玉県", "山梨県", "長野県", "岐阜県", "滋賀県", "奈良県")
ORDER BY
    area DESC;
