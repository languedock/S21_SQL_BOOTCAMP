-- Active: 1707304605534@@127.0.0.1@5432@model03
SELECT name FROM v_persons_female
UNION
SELECT name FROM v_persons_male
ORDER BY name;