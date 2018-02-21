CREATE OR REPLACE PROCEDURE greetings 
AS 
BEGIN 
   dbms_output.put_line('Hello World!'); 
END; 
----------------------------------------------------------------
EXECUTE greetings;
----------------------------------------------------------------

BEGIN 
   greetings; 
END; 

----------------------------------------------------------------

DROP PROCEDURE greetings; 

----------------------------------------------------------------
DECLARE 
   a number; 
   b number; 
   c number;
PROCEDURE findMin(x IN number, y IN number, z OUT number) IS 
BEGIN 
   IF x < y THEN 
      z:= x; 
   ELSE 
      z:= y; 
   END IF; 
END;   
BEGIN 
   a:= 23; 
   b:= 45; 
   findMin(a, b, c); 
   dbms_output.put_line(' Minimum of (23, 45) : ' || c); 
END; 


--------------------------------------------------------------------------


   
  CREATE OR REPLACE PROCEDURE squareNum(x IN OUT number) IS 
   a number;
   b number;
BEGIN 
    x := x * x;
    a:= 83;
    b:=a; 
   squareNum(a); 
   dbms_output.put_line(' Square of ' || b ||' ' || 'is ' || a); 
END; 

-----------------------------------------------------------------------
DECLARE
a decimal(2);
b decimal(2);
c decimal(2);
d decimal(5);


PROCEDURE equationCECO(a IN decimal, b IN decimal,c IN decimal, d OUT decimal) IS
BEGIN
d := POWER((a + b),c);
END;

BEGIN
a:= 2;
b:= 3.5;
c:= 3;

equationCECO(a,b,c,d);
   dbms_output.put_line(' Equation of POWER((a + b),c: ' || d); 
END; 


























