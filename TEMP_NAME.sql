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
END;*/ --Това не работи
