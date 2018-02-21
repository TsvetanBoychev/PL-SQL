SET SERVEROUTPUT ON 
----------------------------- LOOP Ñ EXIT WHEN------------------------------
DECLARE
counter NUMBER :=0;
l_sum NUMBER :=0;

BEGIN
    LOOP
    l_sum := l_sum + counter;
    counter := counter + 1;
    EXIT WHEN counter > 2;
    END LOOP;
    
    DBMS_OUTPUT.PUT_LINE( l_sum);
    
    END;
    
    ----------------------------LOOP Ñ EXIT------------------------------------
    
    
DECLARE
counter NUMBER :=0;
l_sum NUMBER :=0;

BEGIN
    LOOP
    l_sum := l_sum + counter;
    counter := counter + 1;
    IF counter > 3 THEN
     EXIT;
    END IF;
  END LOOP;
    
    DBMS_OUTPUT.PUT_LINE( l_sum);
    
    END;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    