-- Active: 1708617426017@@127.0.0.1@5432@model
WITH temp AS (
    SELECT menu.id AS menu_id, pizzeria_id
    FROM menu
    JOIN pizzeria ON menu.pizzeria_id = pizzeria.id
    GROUP BY pizzeria_id, menu_id
)
--
INSERT INTO person_discounts(id, person_id, pizzeria_id, discount)
SELECT ROW_NUMBER() OVER() AS id , person_id, pizzeria_id,
(
CASE 
    WHEN COUNT(person_order.person_id) = 1 THEN 10.5  
    WHEN COUNT(person_order.person_id) = 2 THEN 22
    ELSE  30
END
) AS discount
--
FROM person_order
--
JOIN temp ON temp.menu_id = person_order.menu_id
--
GROUP BY person_order.person_id, temp.pizzeria_id
--
ORDER BY person_id;