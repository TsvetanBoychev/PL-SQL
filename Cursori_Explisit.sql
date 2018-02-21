declare
  CURSOR crs is SELECT * FROM employees;       
  rec employees%rowtype;
begin
  if not crs%isopen then
    open crs;
  end if;
  loop
    fetch crs into rec;
    exit when crs%notfound;
    dbms_output.put_line(rec.first_name || ' ' ||
                         rec.last_name);
  end loop;
  if crs%isopen then
    close crs;
  end if;
end;