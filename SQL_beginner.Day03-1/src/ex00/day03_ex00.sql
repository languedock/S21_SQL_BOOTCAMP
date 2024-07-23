-- Active: 1707055609288@@127.0.0.1@5432@model03
SELECT menu.pizza_name AS pizza_name,
       menu.price,
       pizzeria.name AS pizzeria_name,
       person_visits.visit_date
FROM person_visits
JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN person ON person_visits.person_id = person.id
JOIN pizzeria ON person_visits.pizzeria_id = pizzeria.id
WHERE person.name = 'Kate' AND (price BETWEEN 800 AND 1000)
ORDER BY pizza_name, price, pizzeria_name