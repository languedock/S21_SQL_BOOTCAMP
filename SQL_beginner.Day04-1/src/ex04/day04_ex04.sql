CREATE VIEW v_symmetric_union AS (
WITH R(person_id) AS (
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-02'
),
    S(person_id)AS (
    SELECT person_id
    FROM person_visits
    WHERE visit_date = '2022-01-06'
),   R_S(person_id) AS (
    SELECT person_id AS person_id
    FROM R
    EXCEPT 
    SELECT person_id
    FROM S
),   S_R(person_id) AS (
     SELECT person_id AS person_id
    FROM S
    EXCEPT 
    SELECT person_id
    FROM R
)
SELECT person_id
FROM R_S
UNION 
SELECT person_id
FROM S_R 
);