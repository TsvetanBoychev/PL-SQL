DECLARE
l_check INTEGER :=1;
BEGIN
WHILE l_check <100
LOOP
l_check :=DBMS_RANDOM.VALUE(1,50);
DBMS_OUTPUT.PUT_LINE(l_check);
END LOOP;
END;

----------------------------------------

SET SERVEROUTPUT ON 

------------------------------------------------------------------------------
--DECLARE
--loop_index INTEGER :=1;
BEGIN
FOR loop_index IN 1 .. 100
LOOP
IF MOD (loop_index,2) = 0
THEN
/*Печата, когато индексът е четно число*/
--calc_values (loop_index);
DBMS_OUTPUT.PUT_LINE(loop_index);
END IF;
END LOOP;
END;

-----------------------------------------------------------------------------------------------
  declare
  idx number := 100;
  begin
  dbms_output.put_line (idx);
  for idx in 2..5 loop
  dbms_output.put_line (idx);
  end loop;
  dbms_output.put_line (idx);
  end;
  
  ---------------------------------------------------------------------------------------------------
 /* DECLARE
   x NUMBER := 100;
BEGIN
   FOR i IN 1..10 LOOP
      IF MOD(i,2) = 0 THEN     -- i is even
         INSERT INTO temp VALUES (i, x, 'i is even');
      ELSE
         INSERT INTO temp VALUES (i, x, 'i is odd');
      END IF;
      x := x + 100;
   END LOOP;
   --COMMIT;
END;*/

-------------------------------------CONTINUE------------------------------
DECLARE 
l_counter NUMBER :=0;
BEGIN 
FOR l_counter IN 1..5
LOOP
IF l_counter = 3
THEN CONTINUE;
END IF;
DBMS_OUTPUT.PUT_LINE (l_couner);
END LOOP;
END;
---------------------------------------------------------------Вградени цикли--------------------------
DECLARE
l_firs_counter INTEGER :=0;
l_second_counter INTEGER :=0;
BEGIN
<<Outer_Loop>>
FOR l_firs_counter IN 1..2
LOOP
DBMS.OUTPUT.PUT_LINE ('OuterLoop:' || l_firs_counter);
<<Inner_Loop>>
FOR l_second_counter IN 3..4
LOOP
DBMS.OUTPUT.PUT_LINE ('InnerLoop'||l_second_counter);
END LOOP Inner_Loop;
END LOOP Outer_Loop;
END;







