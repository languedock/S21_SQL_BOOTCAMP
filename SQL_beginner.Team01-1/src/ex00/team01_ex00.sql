-- Active: 1706796229547@@127.0.0.1@5432@postgres
--EXPLAIN ANALYSE
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    b.type,
    sum(b.money) AS volume,
    COALESCE(c.name, 'not defined') AS currency_name,
    COALESCE(c.rate_to_usd, 1) AS last_rate_to_usd,
    sum(b.money) * COALESCE(c.rate_to_usd, 1)::NUMERIC AS total_volume_in_usd
FROM
    "user" AS u
    RIGHT JOIN balance b ON b.user_id = u.id
    LEFT JOIN currency c ON b.currency_id = c.id
    AND c.updated IN (
        SELECT max(updated)
        FROM currency
        GROUP BY
            id
    )
GROUP BY
    1,
    2,
    3,
    5,
    6
ORDER BY 1 DESC, 2, 4