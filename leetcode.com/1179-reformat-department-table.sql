SELECT
    id,
    SUM(IF(month = "Jan", revenue, NULL)) AS Jan_Revenue,
    SUM(IF(month = "Feb", revenue, NULL)) AS Feb_Revenue,
    SUM(IF(month = "Mar", revenue, NULL)) AS Mar_Revenue,
    SUM(IF(month = "Apr", revenue, NULL)) AS Apr_Revenue,
    SUM(IF(month = "May", revenue, NULL)) AS May_Revenue,
    SUM(IF(month = "Jun", revenue, NULL)) AS Jun_Revenue,
    SUM(IF(month = "Jul", revenue, NULL)) AS Jul_Revenue,
    SUM(IF(month = "Aug", revenue, NULL)) AS Aug_Revenue,
    SUM(IF(month = "Sep", revenue, NULL)) AS Sep_Revenue,
    SUM(IF(month = "Oct", revenue, NULL)) AS Oct_Revenue,
    SUM(IF(month = "Nov", revenue, NULL)) AS Nov_Revenue,
    SUM(IF(month = "Dec", revenue, NULL)) AS Dec_Revenue
FROM
    Department
GROUP BY
    id
;
/*
-- Another solution
SELECT
    ids.id,
    Jan_Revenue,
    Feb_Revenue,
    Mar_Revenue,
    Apr_Revenue,
    May_Revenue,
    Jun_Revenue,
    Jul_Revenue,
    Aug_Revenue,
    Sep_Revenue,
    Oct_Revenue,
    Nov_Revenue,
    Dec_Revenue
FROM
    (SELECT DISTINCT id FROM Department) AS ids
    LEFT OUTER JOIN (SELECT id, revenue AS Jan_Revenue FROM Department WHERE month = "Jan") AS M01 ON ids.id = M01.id
    LEFT OUTER JOIN (SELECT id, revenue AS Feb_Revenue FROM Department WHERE month = "Feb") AS M02 ON ids.id = M02.id
    LEFT OUTER JOIN (SELECT id, revenue AS Mar_Revenue FROM Department WHERE month = "Mar") AS M03 ON ids.id = M03.id
    LEFT OUTER JOIN (SELECT id, revenue AS Apr_Revenue FROM Department WHERE month = "Apr") AS M04 ON ids.id = M04.id
    LEFT OUTER JOIN (SELECT id, revenue AS May_Revenue FROM Department WHERE month = "May") AS M05 ON ids.id = M05.id
    LEFT OUTER JOIN (SELECT id, revenue AS Jun_Revenue FROM Department WHERE month = "Jun") AS M06 ON ids.id = M06.id
    LEFT OUTER JOIN (SELECT id, revenue AS Jul_Revenue FROM Department WHERE month = "Jul") AS M07 ON ids.id = M07.id
    LEFT OUTER JOIN (SELECT id, revenue AS Aug_Revenue FROM Department WHERE month = "Aug") AS M08 ON ids.id = M08.id
    LEFT OUTER JOIN (SELECT id, revenue AS Sep_Revenue FROM Department WHERE month = "Sep") AS M09 ON ids.id = M09.id
    LEFT OUTER JOIN (SELECT id, revenue AS Oct_Revenue FROM Department WHERE month = "Oct") AS M10 ON ids.id = M10.id
    LEFT OUTER JOIN (SELECT id, revenue AS Nov_Revenue FROM Department WHERE month = "Nov") AS M11 ON ids.id = M11.id
    LEFT OUTER JOIN (SELECT id, revenue AS Dec_Revenue FROM Department WHERE month = "Dec") AS M12 ON ids.id = M12.id
;
*/
