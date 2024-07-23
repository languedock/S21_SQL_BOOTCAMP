-- Active: 1708617426017@@127.0.0.1@5432@team00
WITH RECURSIVE
    routes (
        tour, point1, point2, cost, amount, iteration
    ) AS (
        SELECT
            point1 AS tour, point1, point2, cost, cost AS amount, 0 AS iteration
        FROM city_cost
        WHERE
            point1 = 'a'
        UNION
        SELECT
            tour || ',' || rec.point1 AS tour, rec.point1, rec.point2, rec.cost, amount + rec.cost AS amount, iteration + 1
        FROM city_cost AS rec
            JOIN routes AS main ON rec.point1 = main.point2
        WHERE
            tour NOT LIKE '%' || rec.point1 || '%'
    ),
    result AS (
        SELECT
            tour AS routes, amount AS total_cost, '{' || tour || ',' || point2 || '}' AS tour, point1, point2, iteration
        FROM routes
        WHERE
            point2 = 'a'
            AND LENGTH(
                CONCAT('{', tour, ',', point2, '}')
            ) > 9
    )
SELECT total_cost, tour
FROM result
ORDER BY 1, 2;

-- UPDATE city_cost SET cost = 115 WHERE ID = 7 OR ID = 2;

-- UPDATE city_cost SET cost = 15 WHERE ID = 7 OR ID = 2;