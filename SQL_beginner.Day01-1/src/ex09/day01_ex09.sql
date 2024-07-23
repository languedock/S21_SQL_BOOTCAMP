SELECT name
FROM pizzeria
WHERE name NOT IN (
    SELECT name  
    FROM pizzeria
    JOIN person_visits 
    ON person_visits.pizzeria_id = pizzeria.id
);


SELECT name
FROM pizzeria
WHERE id = (
    SELECT id
    FROM pizzeria
    WHERE NOT EXISTS (
        SELECT pizzeria_id
        FROM person_visits
        WHERE pizzeria_id = pizzeria.id
    )
)