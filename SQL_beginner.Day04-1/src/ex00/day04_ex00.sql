-- Active: 1707304605534@@127.0.0.1@5432@model03
CREATE VIEW v_persons_female AS
    SELECT * FROM person
        WHERE person.gender = 'female';

CREATE VIEW v_persons_male AS
    SELECT * FROM person
        WHERE person.gender = 'male';