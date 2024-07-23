WITH per_vis AS (
SELECT name , COUNT(*) AS count, 'visit' AS action_type
FROM person_visits
JOIN  pizzeria ON pizzeria.id = person_visits.pizzeria_id
GROUP BY name
ORDER BY count
),
per_ord AS (
SELECT name, COUNT(*) AS count, 'order' AS action_type
FROM person_order
JOIN menu ON menu.id = person_order.menu_id
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
GROUP BY name
ORDER BY count
)
SELECT pizzeria.name,
(CASE WHEN per_vis.count IS NULL THEN 0 ELSE per_vis.count END
)+
(CASE WHEN per_ord.count IS NULL THEN 0 ELSE per_ord.count END
) AS total_count
FROM pizzeria
--
LEFT JOIN per_vis ON per_vis.name = pizzeria.name 
LEFT JOIN per_ord ON per_ord.name = pizzeria.name
-- 
ORDER BY total_count DESC, name;