WITH cte_days(missing_date) AS (
    SELECT DISTINCT person_visits.visit_date AS missing_date
    FROM person_visits 
)
SELECT missing_date
FROM cte_days
LEFT JOIN (SELECT visit_date FROM person_visits
      WHERE person_id = 1 OR person_id = 2
     ) AS temp
ON missing_date = temp.visit_date
WHERE temp.visit_date is NULL
ORDER BY missing_date ASC;