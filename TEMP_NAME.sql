SET SERVEROUTPUT ON -- ������� ����� �� �������
DECLARE 
l_right_now VARCHAR2 (9); --������������ �������� �� ������������
BEGIN
l_right_now := SYSDATE;

DBMS_OUTPUT.PUT_LINE(l_right_now);
EXCEPTION
WHEN VALUE_ERROR THEN
DBMS_OUTPUT.PUT_LINE ('������������ �������� �� ������������ l_right_now!');

END;

/*DECLARE
str VARCHAR2 (1) := '';
BEGIN
IF str IS NULL
END;*/ --���� �� ������
