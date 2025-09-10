SELECT
    x,
    y,
    z,
    IF (x + y > z AND y + z > x and z + x > y, "Yes", "No") AS triangle
FROM
    Triangle
;
