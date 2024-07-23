DROP FUNCTION fnc_persons_female();

DROP FUNCTION fnc_persons_male();

CREATE FUNCTION fnc_persons(pgender varchar default 'female') RETURNS table (
    id bigint,
    name varchar,
    age int,
    gender varchar,
    address varchar
) 
AS $$ SELECT * FROM person WHERE gender = pgender; 
$$ LANGUAGE sql;

SELECT * FROM fnc_persons(pgender := 'male');

SELECT * FROM fnc_persons();