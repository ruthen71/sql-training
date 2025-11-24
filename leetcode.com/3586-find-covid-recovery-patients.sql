WITH positive_patients AS (
    SELECT
        patients.patient_id
        , patients.patient_name
        , patients.age
        , MIN(covid_tests.test_date) AS first_positive_date
    FROM
        patients
        INNER JOIN covid_tests
            ON patients.patient_id = covid_tests.patient_id
    WHERE
        covid_tests.result = 'Positive'
    GROUP BY
        patients.patient_id
)
SELECT
    positive_patients.patient_id
    , positive_patients.patient_name
    , positive_patients.age
    # 単に - で日付同士を計算すると, 日付が整数と解釈された上で計算されるため, '2023-02-01' - '2023-01-01' = 20230201 - 20230101 = 100 となってしまう
    , DATEDIFF(MIN(covid_tests.test_date),  positive_patients.first_positive_date) AS recovery_time
FROM
    positive_patients
    INNER JOIN covid_tests
        ON positive_patients.patient_id = covid_tests.patient_id
            AND positive_patients.first_positive_date < covid_tests.test_date
WHERE
    covid_tests.result = 'Negative'
GROUP BY
    positive_patients.patient_id
ORDER BY
    recovery_time ASC
    , positive_patients.patient_name ASC
;
