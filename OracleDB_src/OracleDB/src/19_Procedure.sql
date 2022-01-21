-- * 오라클 - 저장 프로시저(procedure)

drop table emp01 purge;

create	table	emp01
as
select	*
from	emp;

SQL>	ed proc01				--	프로시저 생성 코드 작업
SQL>	@proc01					--	프로시저 생성
SQL>	execute del_all			--	프로시저 실행
SQL>	select * from emp01;	--

--[1] 저장프로시저 조회하기
SQL>	desc user_source;
SQL>	select name, text from user_source;

--[2] 저장 프로시저의 매개변수
SQL>	insert into emp01 select * from emp;
SQL>	ed proc02
SQL>	@proc02
SQL>	execute del_name('SCOTT');

select * from emp01;

--[3] IN, OUT, INOUT 매개변수

SQL>	ed proc03
SQL>	@proc03

SQL>	variable	var_ename	varchar2(16);
SQL>	variable	var_sal		number;
SQL>	variable	var_job		varchar2(10);

SQL>	execute		sel_empno(7788, :var_ename, :var_sal, :val_job);

SQL>	print var_ename;
SQL>	print var_sal;
SQL>	print var_job;

--[4] 저장 함수

SQL>	ed proc04
SQL>	@proc04

SQL>	variable	var_result	number;
SQL>	execute		:var_result	:=	cal_bonus(7788);
SQL>	print		var_result;

--[5] Cursor(커서)

SQL>	select * from dept;

SQL>	ed proc05
SQL>	@proc05
SQL>	execute	cursor_sample
SQL>
