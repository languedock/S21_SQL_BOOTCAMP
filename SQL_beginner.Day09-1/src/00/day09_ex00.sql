-- Active: 1708617426017@@127.0.0.1@5432@model

-- DROP TABLE IF EXISTS person_audit;

CREATE TABLE IF NOT EXISTS person_audit(
    -------------------------
    created     TIMESTAMP(0) WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    type_event  char(1) DEFAULT('I') NOT NULL,
    -------------------------
    row_id  bigint NOT NULL,
    name    varchar,
    age     integer,
    gender  varchar,
    address varchar 
    -------------------------
    CONSTRAINT ch_type_event check ( type_event IN ('I', 'U', 'D'))
);

CREATE OR REPLACE FUNCTION fnc_trg_person_insert_audit() RETURNS trigger 
AS $trg_person_insert_audit$
BEGIN 
    IF (TG_OP = 'INSERT') THEN
        INSERT INTO person_audit
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Yekaterinburg', 'I', NEW.*;
    END IF;
    RETURN NULL;
END;
$trg_person_insert_audit$ LANGUAGE plpgsql;

-- DROP FUNCTION fnc_trg_person_insert_audit;

CREATE TRIGGER trg_person_insert_audit AFTER INSERT ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_insert_audit();

-- DROP TRIGGER trg_person_insert_audit ON person;

INSERT INTO person(id, name, age, gender, address) 
VALUES (10,'Damir', 22, 'male', 'Irkutsk');

-- DELETE FROM person WHERE id = 10;

-- SELECT * FROM person

-- SELECT * FROM person_audit;