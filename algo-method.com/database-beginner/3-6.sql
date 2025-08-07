SELECT email FROM registrations_day1
INTERSECT
SELECT email FROM registrations_day2
INTERSECT
SELECT email FROM registrations_day3;
