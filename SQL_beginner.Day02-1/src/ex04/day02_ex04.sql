SELECT temp.pizza_name , 
       pizzeria.name AS pizzeria_name,
       temp.price
FROM (
    SELECT pizzeria_id, pizza_name, price
    FROM menu
    WHERE pizza_name = 'mushroom pizza' OR
          pizza_name = 'pepperoni pizza'
     ) AS temp
JOIN pizzeria ON temp.pizzeria_id = pizzeria.id
--WHERE temp.pizza_name is NOT NULL
ORDER BY pizza_name, pizzeria_name ;