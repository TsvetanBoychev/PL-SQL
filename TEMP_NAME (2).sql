SET SERVEROUTPUT ON -- Включва печат на конзола
DECLARE 
l_right_now VARCHAR2 (9); --Недостатъчна големина на променливата
BEGIN
l_right_now := SYSDATE;

DBMS_OUTPUT.PUT_LINE(l_right_now);
EXCEPTION
WHEN VALUE_ERROR THEN
DBMS_OUTPUT.PUT_LINE ('Недостатъчна големина на променливата l_right_now!');

END;

/*DECLARE
str VARCHAR2 (1) := '';
BEGIN
IF str IS NULL
END;*/ --Това не работи\


----------------------------------------------------------------------------


DECLARE
salary FLOAT := 10500;
min_salary FLOAT :=2003;
BEGIN
IF salary < min_salary
THEN
salary :=salary+salary * .25;

ELSE DBMS_OUTPUT.PUT_LINE('Заплатата е голяма, ама много голяма. Виж отдолу колко е голяма:');
END IF;
DBMS_OUTPUT.PUT_LINE(salary || ' '|| 'лв.');
END;

<<INS_BUT_Ignore>>
BEGIN

-------------------------------------------------------------------------------
DECLARE
counter NUMBER :=0;
counter NUMBER :=0;













