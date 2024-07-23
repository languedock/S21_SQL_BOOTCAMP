-- Active: 1708617426017@@127.0.0.1@5432@model
SET ENABLE_SEQSCAN TO OFF;

SELECT pizza_name , pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id

EXPLAIN ANALYZE 
SELECT pizza_name , pizzeria.name AS pizzeria_name
FROM menu
JOIN pizzeria ON menu.pizzeria_id = pizzeria.id