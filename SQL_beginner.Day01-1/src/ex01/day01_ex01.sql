-- Active: 1706963353323@@127.0.0.1@5432@model01
SELECT name AS object_name
FROM ( 
       SELECT name FROM person ORDER BY name 
     )
UNION ALL
SELECT pizza_name
FROM ( 
       SELECT pizza_name FROM menu ORDER BY pizza_name
     ) ;