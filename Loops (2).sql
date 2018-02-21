SET SERVEROUTPUT ON 
----------------------------- LOOP С EXIT WHEN------------------------------
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
    
    ----------------------------LOOP С EXIT------------------------------------
    
    
DECLARE
counter NUMBER :=0;
l_sum NUMBER :=0;

BEGIN
    LOOP
    l_sum := l_sum + counter;
    counter := counter + 1.2;
    IF counter > 3 THEN
     EXIT;
    END IF;
  END LOOP;
    
    DBMS_OUTPUT.PUT_LINE( l_sum);
    
    END;
    
    -----------------Прекъсване с RETURN---------------------------
    
DECLARE
counter NUMBER :=0;
l_sum NUMBER :=0;

BEGIN
    LOOP
    l_sum := l_sum + counter;
    counter := counter + 1.2;
    IF counter > 3 THEN
     RETURN;
    END IF;
  END LOOP;
    
    DBMS_OUTPUT.PUT_LINE( l_sum); --Забелязвам, че при RETURN не стига до печата, защо?
    
    END;
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    