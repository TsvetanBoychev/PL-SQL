
 SELECT * FROM SCET_DATE;

 select * from obj603 where promo_in=1 and c_15=2 and   order by id desc;

 select C_1,C_2,C_3,C_10,C_22,C_23,C_3+C_22 from obj679 where c_11=24924 and c_4=0 order by id; --PP
 --------------------------------------------------------------------
 select * from obj679 where c_11=24919 order by id;  
------------------------------------------------------------------------------
 select * from obj603 where id=24918;
 update obj603 set c_28=40 where id=24924;
 
 ---------------
 
 select * from obj603;
 
 select * from AUTO_ANNUITY;
 
 -----------------------------------------------------------------------------
 
 set serveroutput on

 declare

 plan1 integer;

 begin

PKG_ANNUITY_INSTALLMENTS_PLAN.AUTO_ANN_PERC_PLAN(1346,plan1,2,24952);

  dbms_output.put_line(plan1);

 end; 