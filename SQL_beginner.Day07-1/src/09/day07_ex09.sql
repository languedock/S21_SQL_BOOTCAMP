WITH temp AS (
    SELECT address,
    ROUND( 
        CAST(MAX(age) AS NUMERIC) - 
        CAST(MIN(age) AS NUMERIC) /
        CAST(MAX(age)AS NUMERIC), 
        2
    ) AS formula,
    ROUND(
        AVG(age), 2
    ) AS average
FROM person
GROUP BY address
)
SELECT * , (formula > average) AS comparison
FROM temp
ORDER BY address;