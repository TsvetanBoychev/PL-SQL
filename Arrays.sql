DECLARE 
   type namesarray IS VARRAY(40) OF VARCHAR2(100); 
   type grades IS VARRAY(5) OF INTEGER; 
   names namesarray; 
   marks grades; 
   total integer; 
BEGIN 
   names := namesarray('Kiro', 'Lilo', 'Ayan', 'Gosho', 'Milen'); 
   marks:= grades(98, 97, 78, 87, 92); 
   total := names.count; 
   dbms_output.put_line('Total '|| total || ' Students'); 
   FOR i in 1 .. total LOOP 
      dbms_output.put_line('Student: ' || names(i) || ' Marks: ' ||'-------'|| marks(i)); 
   END LOOP; 
END; 

--------------------------------------------------------------------------------

DECLARE
type CECOARRAY IS VARRAY (200) OF INTEGER;
scores CECOARRAY;
total integer;

BEGIN
scores := CECOARRAY (85, 125, 58, 456);
total := scores.count;

FOR i in 1 .. total LOOP

dbms_output.put_line('REZULT ' || scores(i));
   END LOOP;
END;

-----------------------------------------------------------------------------
DECLARE
type CECOARRAY IS VARRAY (600) OF VARCHAR2;
scores CECOARRAY;
total integer;

BEGIN
scores := CECOARRAY (85, 125, 58, 456);
total := scores.count;

FOR i in 1 .. total LOOP

dbms_output.put_line('REZULT ' || scores(i));
   END LOOP;
END;