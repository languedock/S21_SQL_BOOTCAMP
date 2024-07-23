CREATE UNIQUE INDEX idx_menu_unique ON menu(pizzeria_id, pizza_name);

SET ENABLE_SEQSCAN TO OFF;

SELECT pizzeria_id , pizza_name 
FROM menu
WHERE pizza_name = 'cheese pizza';

EXPLAIN ANALYZE
SELECT pizzeria_id , pizza_name 
FROM menu
WHERE pizza_name = 'cheese pizza';