SELECT temp.pizza_name AS pizza_name, temp.price,
       pizzeria.name AS pizzeria_name
FROM(
    SELECT *
    FROM menu
    WHERE menu.id NOT IN (
        SELECT menu_id
        FROM person_order
    ) 
    ) AS temp
JOIN pizzeria ON temp.pizzeria_id = pizzeria.id
ORDER BY pizza_name, price;