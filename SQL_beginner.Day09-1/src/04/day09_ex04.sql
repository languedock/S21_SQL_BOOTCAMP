CREATE FUNCTION fnc_persons_female() RETURNS table(
    id       bigint,
    name     varchar,
    age      integer,
    gender   varchar,
    address  varchar
)
AS $$ SELECT * FROM person WHERE gender = 'female'; $$ LANGUAGE sql;

CREATE FUNCTION fnc_persons_male() RETURNS table(
    id       bigint,
    name     varchar,
    age      integer,
    gender   varchar,
    address  varchar
)
AS $$ SELECT * FROM person WHERE gender = 'male'; $$ LANGUAGE sql;

SELECT * FROM fnc_persons_female();

SELECT * FROM fnc_persons_male();