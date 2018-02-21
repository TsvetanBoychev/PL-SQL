DECLARE 
   a number(2) := 10; 
BEGIN 
   a:= 10; 
  -- check the boolean condition using if statement  
   IF( a < 20 ) THEN 
      -- if condition is true then print the following   
      dbms_output.put_line('a is less than 20 ' ); 
   END IF; 
   dbms_output.put_line('value of a is : ' || a); 
END;



-----------------------------------------------------------------------
DECLARE 
   a number(3) := 100; 
BEGIN 
   -- check the boolean condition using if statement  
   IF( a < 20 ) THEN 
      -- if condition is true then print the following   
      dbms_output.put_line('a is less than 20 ' ); 
   ELSE 
      dbms_output.put_line('a is not less than 20 ' ); 
   END IF; 
   dbms_output.put_line('value of a is : ' || a); 
END; 

-----------------------------------------------------------------------

DECLARE

a number (30):= 1005855;
BEGIN

IF (a < 3) THEN
       dbms_output.put_line('a is bigger than 3' ); 
ELSE
       dbms_output.put_line('a is less than 3 ' );   
END IF;  
       dbms_output.put_line('value of a is : ' || a); 
END;
------------------------------------------------------------------------
DECLARE 
   a number(3) := 30; 
BEGIN 
   IF ( a = 10 ) THEN 
      dbms_output.put_line('Value of a is 10' ); 
   ELSIF ( a = 20 ) THEN 
      dbms_output.put_line('Value of a is 20' ); 
   ELSIF ( a = 30 ) THEN 
      dbms_output.put_line('Value of a is 30' ); 
   ELSE 
       dbms_output.put_line('None of the values is matching'); 
   END IF; 
   dbms_output.put_line('Exact value of a is: '|| a );  
END;           

---------------------------------------------------------------------------
DECLARE
a number(5);
v number(3);
c number(3);

BEGIN
c:=50;
v:=55;
a:=955;
IF (c>a) OR (v>a) THEN
  dbms_output.put_line('ÏÚÐÂÎ ÓÑËÎÂÈÅ');
ELSE
 dbms_output.put_line('ÂÒÎÐÎ ÓÑËÎÂÈÅ' ); 
END IF;
END; 

-----------------------------------------------------------------------------

DECLARE 
   x number := 10; 
BEGIN 
   LOOP 
      dbms_output.put_line(x); 
      x := x + 10; 
      IF x > 50 THEN 
         exit; 
      END IF; 
   END LOOP; 
   -- after exit, control resumes here  
   dbms_output.put_line('After Exit x is: ' || x); 
END; 
-----------------------------
DECLARE 
   x number := 10; 
BEGIN 
   LOOP 
   
      dbms_output.put_line(x); 
      x := x + 10;
       
      exit WHEN x > 50; 
   END LOOP; 
   -- after exit, control resumes here 
   dbms_output.put_line('After Exit x is: ' || x); 
END;
----------------------------------------------------------------------------