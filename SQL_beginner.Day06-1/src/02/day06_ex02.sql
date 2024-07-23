-- Active: 1708617426017@@127.0.0.1@5432@model
SELECT
person.name,
menu.pizza_name,
menu.price,
CAST(menu.price - menu.price * (pd.discount/100) AS INTEGER) AS discount_price,
pizzeria.name AS pizzeria_name
--
FROM person_order
--
JOIN menu ON menu.id = person_order.menu_id
--
JOIN person ON person.id = person_order.person_id
--
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
--
JOIN person_discounts AS pd ON pd.person_id = person_order.person_id
                            AND pd.pizzeria_id = pizzeria.id 
--
ORDER BY person.name, menu.pizza_name;   