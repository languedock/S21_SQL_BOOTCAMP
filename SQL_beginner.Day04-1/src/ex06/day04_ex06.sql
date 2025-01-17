CREATE MATERIALIZED VIEW mv_dmitriy_visits_and_eats AS (
SELECT pizzeria.name AS pizzeria_name
FROM person_visits
JOIN person ON person_visits.person_id = person.id
JOIN menu ON person_visits.pizzeria_id = menu.pizzeria_id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
WHERE person.name = 'Dmitriy' 
      AND person_visits.visit_date = '2022-01-08'
      AND menu.price < 800
);