-- Active: 1706796229547@@127.0.0.1@5432@postgres

--INSERT INTO currency values ( 100, 'EUR', 0.85, '2022-01-01 13:29' );
--INSERT INTO currency values ( 100, 'EUR', 0.79, '2022-01-08 13:29' );
--DROP Function getClosestDate

CREATE OR REPLACE FUNCTION getClosestDate(currency_id 
bigint, currentDate timestamp) RETURNS SETOF currency AS 
$$
	SELECT *
	FROM currency c
	WHERE (
	        SELECT
	            CASE
	                WHEN (c.updated < currentDate) THEN MAX(c.updated)
	                ELSE MIN(c.updated)
	            END AS updated
	        FROM currency c
	        WHERE
	            c.id = currency_id
	        GROUP BY (c.updated < currentDate)
	        ORDER BY c.updated < currentDate DESC
	        LIMIT 1
	    ) = updated
	    AND c.id = currency_id;
$$
LANGUAGE
SQL; 

--EXPLAIN ANALYSE
SELECT
    COALESCE(u.name, 'not defined') AS name,
    COALESCE(u.lastname, 'not defined') AS lastname,
    ccd.name AS currency_name,
    (b.money * ccd.rate_to_usd)::REAL AS currency_in_usd
FROM
    balance b
    FULL JOIN "user" u ON u.id = b.user_id
    JOIN getClosestDate (b.currency_id, b.updated) ccd ON ccd.id = b.currency_id
ORDER BY 1 DESC, 2, 3;