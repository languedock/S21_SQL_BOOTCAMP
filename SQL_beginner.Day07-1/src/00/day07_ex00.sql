-- Active: 1707304605534@@127.0.0.1@5432@model03
SELECT person_id, COUNT(person_id) AS count_of_visits
FROM person_visits
GROUP BY person_id
ORDER BY count_of_visits DESC, person_id;