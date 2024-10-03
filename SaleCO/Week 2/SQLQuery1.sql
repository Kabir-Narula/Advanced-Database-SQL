-- Week 3-----

--show the product whose P_price is greater than average price of all products

select *
from product
where p_price >= (Select avg(p_price) from product);

-- products whose P_price is greater or equal than averge price of products supplied by their vendor using corri subq.
select * , (Select avg(p_price) from product where v_code = p.v_code ) as avgprice_vend
from product p
where p_price >= (Select avg(p_price) from product where v_code = P.v_code );


-- show the customer that have maximum balance
select *
from customer
where cus_balance = (SELECT max(cus_balance) from customer);


-- show the customer that have maximum balance within there area code
SELECT *
FROM customer c
WHERE cus_balance = (
    SELECT MAX(cus_balance)
    FROM customer
    WHERE cus_areacode = c.cus_areacode
);

SELECT *
FROM product
WHERE P_QOH = (SELECT MAX(P_QOH) FROM product);


--- list the vendors that supply most products within their states
select v.v_code,v.V_STATE, count (*) as nbprod
from product p join vendor v
on p.v_code=v.V_CODE
where v.v_code is not null
group by v.v_code, v.v_state;
