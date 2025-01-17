-- Active: 1706796229547@@127.0.0.1@5432@postgres

--DROP TABLE IF EXISTS city_cost

CREATE TABLE city_cost (
    id SERIAL PRIMARY KEY, point1 VARCHAR NOT NULL, point2 VARCHAR NOT NULL, cost INT NOT NULL
);

INSERT INTO
    city_cost (point1, point2, cost)
VALUES ('a', 'b', 10),
    ('a', 'c', 15),
    ('a', 'd', 20),
    ('b', 'a', 10),
    ('b', 'c', 35),
    ('b', 'd', 25),
    ('c', 'a', 15),
    ('c', 'b', 35),
    ('c', 'd', 30),
    ('d', 'a', 20),
    ('d', 'b', 25),
    ('d', 'c', 30);