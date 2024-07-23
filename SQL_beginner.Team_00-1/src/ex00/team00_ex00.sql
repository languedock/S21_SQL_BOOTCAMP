-- Active: 1708617426017@@127.0.0.1@5432@team00
-- SELECT city_cost.point1, city_cost.point2
-- FROM city_cost
--     JOIN city_cost as temp ON city_cost.point1 = temp.point2
--     AND temp.point1 = 'a'

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
WHERE
    total_cost = (
        SELECT MIN(total_cost)
        FROM result
    )
ORDER BY 2;