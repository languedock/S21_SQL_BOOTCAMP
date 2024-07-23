-- Active: 1707055609288@@127.0.0.1@5432@model03
WITH female(pizzeria_name) AS (
    SELECT pizzeria.name AS pizzeria_name, person.gender
    FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    WHERE person.gender = 'female'
),
     male(pizzeria_name)AS (
    SELECT pizzeria.name AS pizzeria_name
    FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    JOIN person_order ON person_order.menu_id = menu.id
    JOIN person ON person_order.person_id = person.id
    WHERE person.gender = 'male'
),   res1(pizzeria_name) AS (
    SELECT pizzeria_name AS pizzeria_name
    FROM female
    EXCEPT 
    SELECT pizzeria_name
    FROM male
),   res2(pizzeria_name) AS (
     SELECT pizzeria_name AS pizzeria_name
    FROM male
    EXCEPT 
    SELECT pizzeria_name
    FROM female
)
SELECT pizzeria_name AS pizzeria_name
FROM res1
UNION 
SELECT pizzeria_name
FROM res2
ORDER BY pizzeria_name ;