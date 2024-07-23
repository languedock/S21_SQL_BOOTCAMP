-- Active: 1707304605534@@127.0.0.1@5432@model03
CREATE USER new_user WITH PASSWORD 'example' SUPERUSER;

-- Session #1
BEGIN;

SELECT * FROM pizzeria;

UPDATE pizzeria SET rating = 5 WHERE name = 'Pizza Hut';

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';

-- Session #1

END;

-- Session #2

SELECT * FROM pizzeria WHERE name = 'Pizza Hut';



