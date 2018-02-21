-- create demo table
create table Employee(
ID                 VARCHAR2(4 BYTE)         NOT NULL primary key,
First_Name         VARCHAR2(10 BYTE),
Last_Name          VARCHAR2(10 BYTE),
Start_Date         DATE,
End_Date           DATE,
Salary             Number(8,2),
City               VARCHAR2(10 BYTE),
Description        VARCHAR2(15 BYTE)
)

select * from Employee;


BEGIN
  FOR v_LoopCounter IN 1..20 LOOP
  INSERT INTO Employee (id)
  VALUES (v_LoopCounter);
  END LOOP;
  END;