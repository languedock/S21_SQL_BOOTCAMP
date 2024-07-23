SELECT person.name
FROM person_order
JOIN person ON person_order.person_id = person.id
JOIN menu ON person_order.menu_id = menu.id
WHERE gender = 'male' AND
      address IN ('Moscow', 'Samara' )
      AND pizza_name IN ('pepperoni pizza','mushroom pizza')
ORDER BY name DESC;
