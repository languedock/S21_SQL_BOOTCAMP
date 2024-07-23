-- Active: 1706963353323@@127.0.0.1@5432@model01
SELECT id AS object_id, pizza_name AS object_name
FROM menu 
UNION 
SELECT id, name
FROM person
ORDER BY object_id, object_name;