CREATE FUNCTION fnc_person_visits_and_eats_on_date( 

    pperson varchar default 'Dmitry',
    pprice numeric default 500,
    pdate date default '2022-01-08'
) 
-----------------------------
RETURNS table(
    
    pizzeria_name varchar
)
-----------------------------
AS $$ SELECT DISTINCT pizzeria.name AS pizzeria_name
FROM person_order
------
JOIN person_visits ON person_visits.person_id = person_order.person_id 
                  AND person_visits.visit_date = person_order.order_date
------
JOIN person ON person.id = person_order.person_id
------
JOIN menu ON menu.id = person_order.menu_id
------
JOIN pizzeria ON pizzeria.id = menu.pizzeria_id
------
WHERE person.name = pperson
  AND menu.price < pprice 
  AND person_order.order_date = pdate ;
-----------------------------
$$ LANGUAGE sql; 

--DROP FUNCTION fnc_person_visits_and_eats_on_date;

SELECT * FROM fnc_person_visits_and_eats_on_date( pprice := 800);

SELECT * FROM fnc_person_visits_and_eats_on_date( 
                                                  pperson := 'Anna',
                                                  pprice  := 1300,
                                                  pdate   := '2022-01-01'
                                                );