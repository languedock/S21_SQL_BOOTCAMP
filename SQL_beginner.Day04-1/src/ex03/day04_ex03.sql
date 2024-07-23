SELECT generated_date AS missing_date
FROM v_generated_dates
LEFT JOIN person_visits 
ON person_visits.visit_date = v_generated_dates.generated_date
WHERE person_visits.visit_date is NULL
ORDER BY missing_date ;