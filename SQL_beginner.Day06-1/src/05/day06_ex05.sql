-- Active: 1708617426017@@127.0.0.1@5432@model
COMMENT ON TABLE person_discounts IS 'Entries about personal discounts';
COMMENT ON COLUMN person_discounts.id IS 'Unique number of every entry' ;
COMMENT ON COLUMN person_discounts.person_id IS 'Unique identifier person';
COMMENT ON COLUMN person_discounts.pizzeria_id IS 'Unique identifier pizzeria' ;
COMMENT ON COLUMN person_discounts.discount IS 'Discount value' ;