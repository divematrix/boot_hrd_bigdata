create or replace procedure	cursor_sample
is
	vdept		dept%rowtype;
	cursor		c1
	is
	select *	from dept;
begin
	DBMS_OUTPUT.PUT_LINE('deptno / dname / loc');
	DBMS_OUTPUT.PUT_LINE('--------------------');
	open	c1;
	LOOP
		fetch c1 into vdept.deptno, vdept.dname, vdept.loc;
		exit when c1%notfound;
		DBMS_OUTPUT.PUT_LINE(vdept.deptno ||'  /  '|| vdept.dname ||'  /  '|| vdept.loc);
	end	LOOP;
	close	c1;
end ;
/