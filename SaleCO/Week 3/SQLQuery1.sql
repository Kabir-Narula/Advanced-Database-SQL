-- how to declare a function
declare @lname varchar(10);  --- variable name and then datatype
set @lname = 'Smith';


select * 
from customer
where cus_lname = @lname;
 

create procedure displayprod
as
select *from product;
go
exec displayprod;

------------------------------
------------------------------
create procedure displayprod
@pcode nvarchar(20)
as
select *from product
where p_code = @pcode;
go

exec displayprodoneparam = '2232/QWE'

--------------------------------

-- Create the stored procedure with a RETURN statement
CREATE PROCEDURE displayprod
  @pcode nvarchar(20)
AS
BEGIN
  DECLARE @ReturnValue INT;

  -- Your SELECT query to fetch product information
  SELECT * FROM PRODUCT
  WHERE P_CODE = @pcode;

  -- Check if any rows were affected
  IF @@ROWCOUNT > 0
  BEGIN
    -- If rows were found (success), set the return value to 0
    SET @ReturnValue = 0;
  END
  ELSE
  BEGIN
    -- If no rows were found (failure), set the return value to a non-zero value
    SET @ReturnValue = 1;
  END

  -- Return the result (0 for success, non-zero for failure)
  RETURN @ReturnValue;
END;
GO

--------------------------------
---------------------------------
CREATE PROCEDURE GetOutstandingBalance
  @cus_code int  , @balance float output
AS


  -- Calculate the outstanding balance for the specified customer code
  SELECT @balance = CUS_BALANCE
  FROM customer
  WHERE cus_code = @cus_code;

GO
Select * from customer;

DECLARE @cusbalance float;;
EXEC GetOutstandingBalance @cus_code = 10012,   @balance = @cusbalance output;
print @cusbalance;


----------------------
-- if else
----------------------
CREATE PROCEDURE UpdateCustomerBalance
  @cus_code INT,
  @amount DECIMAL(10, 2)
AS
BEGIN
  DECLARE @new_balance DECIMAL(10, 2);

  -- Get the current balance for the customer
  SELECT @new_balance = CUS_BALANCE
  FROM customer
  WHERE cus_code = @cus_code;

  -- Check if the new balance will be greater than 1000
  IF @new_balance + @amount > 1000
  BEGIN
    -- If the new balance exceeds 1000, set it to 1000
    SET @new_balance = 1000;
  END
  ELSE
  BEGIN
    -- Otherwise, update the balance with the provided amount
    SET @new_balance = @new_balance + @amount;
  END

  -- Update the customer's balance
  UPDATE customer
  SET CUS_BALANCE = @new_balance
  WHERE cus_code = @cus_code;
END;


-------------------
-------------------




