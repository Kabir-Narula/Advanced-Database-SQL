select *
from vendor
where v_code not in (select v_code from product where v_code is not null);
-- shows 9 groups with only one product each group and minimum price on each group..

-- p_price should be minimum...
select *
from product
where p_price = (select min(p_price) from product);

--P_price should be max
select *
from product
where p_price = (select max(p_price) from product);

-- product where price is less then average price
select *
from product
where p_price = (select avg(p_price) from product);

-- show the product code, description and average price of all products...
select * from product;

select p_code, p_descript, (select avg(p_price) from product) as avgprice
from product;

select avg(p_price) from product;

--to display the product price, description, and the difference between the product price and the average price, 
SELECT
  p_price AS "Product Price",
  P_DESCRIPT AS "Product Description",
  p_price - (SELECT AVG(p_price) FROM product) AS "Price Difference to Average"
FROM product;

-- show the perecentage of quantity in stock of each product out of total inventory...
select * from product;
select p_code, p_descript, P_qoh, p_qoh*1.0/(select sum(p_qoh) from product) as PercinStock
from product;


--------
select V_code, sum(p_QOH * p_price) as ASSET
from product
where v_CODE is not null
group by v_code;

------add the vendor name to the query that calculates the asset values for each vendor, you can use a join with the "vendor" table.
SELECT
  p.v_code,
  v.v_name AS VendorName,
  SUM(p.p_qoh * p.p_price) AS Asset
FROM
  product p
  INNER JOIN vendor v ON p.v_code = v.v_code
WHERE
  p.v_code IS NOT NULL
GROUP BY
  p.v_code, v.v_name;


 ------