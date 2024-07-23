-- Active: 1707055609288@@127.0.0.1@5432@model02
SELECT menu.pizza_name,
       pizzeria.name AS pizzeria_name
FROM person_order
JOIN menu ON person_order.menu_id = menu.id
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id 
JOIN person ON person_order.person_id = person.id 
WHERE person.name IN ('Anna', 'Denis')
ORDER BY pizza_name, pizzeria_name ;