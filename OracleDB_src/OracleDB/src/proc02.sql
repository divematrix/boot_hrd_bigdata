create or replace	procedure	del_name (vename emp01.ename%type)
is
begin
	delete	from emp01
		where ename = vename;
end;
/