-- Active: 1707055609288@@127.0.0.1@5432@model03
WITH female(pizzeria_name) AS (
    SELECT pizzeria.name AS pizzeria_name, person.gender
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    WHERE person.gender = 'female'
),
     male(pizzeria_name)AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM person_visits
    JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
    JOIN person ON person_visits.person_id = person.id
    WHERE person.gender = 'male'
),   res1(pizzeria_name) AS (
    SELECT pizzeria_name AS pizzeria_name
    FROM female
    EXCEPT ALL
    SELECT pizzeria_name
    FROM male
),   res2(pizzeria_name) AS (
    SELECT pizzeria_name AS pizzeria_name
    FROM male
    EXCEPT ALL
    SELECT pizzeria_name
    FROM female
)
SELECT pizzeria_name AS pizzeria_name
FROM res1
UNION ALL
SELECT pizzeria_name
FROM res2
ORDER BY pizzeria_name ;