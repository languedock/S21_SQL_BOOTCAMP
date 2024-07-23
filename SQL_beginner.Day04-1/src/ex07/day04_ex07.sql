INSERT INTO person_visits
VALUES ( (SELECT MAX(id) FROM person_visits)+1,
        (SELECT id FROM person WHERE name = 'Dmitriy'),
        (SELECT DISTINCT pizzeria.id FROM pizzeria 
        JOIN menu ON pizzeria.id = menu.pizzeria_id
        JOIN mv_dmitriy_visits_and_eats AS m 
        ON m.pizzeria_name != pizzeria.name
        WHERE price < 800 LIMIT 1),
        '2022-01-08'
);

REFRESH MATERIALIZED VIEW mv_dmitriy_visits_and_eats;

-- DELETE FROM person_visits WHERE id = 22

-- SELECT * FROM person_visits ;