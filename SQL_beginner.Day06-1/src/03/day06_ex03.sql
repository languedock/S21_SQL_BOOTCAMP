-- Active: 1708617426017@@127.0.0.1@5432@model
CREATE UNIQUE INDEX idx_person_discounts_unique ON person_discounts(person_id, pizzeria_id);

SET ENABLE_SEQSCAN TO OFF;

SELECT * FROM person_discounts WHERE person_id = 1 AND pizzeria_id = 1;

EXPLAIN ANALYZE
SELECT * FROM person_discounts WHERE person_id = 1 AND pizzeria_id = 1;