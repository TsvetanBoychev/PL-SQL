-- create demo table
create table EmployeeCECO(
ID                 VARCHAR2(4 BYTE)         NOT NULL primary key,
First_Name         VARCHAR2(10 BYTE),
Last_Name          VARCHAR2(10 BYTE),
Start_Date         DATE,
End_Date           DATE,
Salary             Number(8,2),
City               VARCHAR2(10 BYTE),
Description        VARCHAR2(15 BYTE)
)

select * from EmployeeCECO WHERE CITY IS NULL;


BEGIN
  FOR v_LoopCounter IN 1..20 LOOP
  INSERT INTO EmployeeCECO (id, Salary, Start_Date)
  VALUES ( v_LoopCounter, (1000 + (v_LoopCounter)*5),(SYSDATE+v_LoopCounter));
  --IF First_Name.EmployeeCECO = NULL THEN
  --First_Name.EmployeeCECO := 'GOSHO';
  --City := 'Sofia;
  --END IF;
  END LOOP;
  END;
  
  TRUNCATE TABLE EmployeeCECO;
  DROP TABLE EmployeeCECO;
  
  
-------------------------------------------------------------------------