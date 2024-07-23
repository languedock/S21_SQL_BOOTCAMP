CREATE OR REPLACE FUNCTION fnc_fibonacci( 

    stop integer DEFAULT 10

) RETURNS setof integer
-------
AS $$ WITH RECURSIVE fib( a , b ) AS (
    VALUES( 0, 1)
    UNION 
    SELECT b , a + b AS a
    FROM fib
    WHERE b < stop
)
SELECT a FROM fib
-------
$$ LANGUAGE sql;

SELECT * FROM fnc_fibonacci(100);

SELECT * FROM fnc_fibonacci();

--DROP FUNCTION fnc_fibonacci;