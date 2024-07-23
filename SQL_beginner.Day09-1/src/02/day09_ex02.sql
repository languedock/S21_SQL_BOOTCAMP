CREATE OR REPLACE FUNCTION fnc_trg_person_delete_audit() RETURNS trigger 
AS $trg_person_delete_audit$
BEGIN 
    IF (TG_OP = 'DELETE') THEN
        INSERT INTO person_audit
        SELECT CURRENT_TIMESTAMP AT TIME ZONE 'Asia/Yekaterinburg', 'D', OLD.*;
    END IF;
    RETURN NULL;
END;
$trg_person_delete_audit$ LANGUAGE plpgsql;

-- DROP FUNCTION fnc_trg_person_delete_audit;

CREATE TRIGGER trg_person_delete_audit AFTER DELETE ON person
    FOR EACH ROW EXECUTE FUNCTION fnc_trg_person_delete_audit();

-- DROP TRIGGER trg_person_delete_audit ON person;

DELETE FROM person WHERE id = 10;

-- SELECt * FROM person;

-- SELECT * FROM person_audit;

-- DELETE FROM person_audit WHERE type_event = 'D';