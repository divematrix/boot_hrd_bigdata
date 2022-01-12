--  * 오라클 : PL/SQL

--[1] 'Hello World' 출력
SQL>
	set serveroutput on

SQL>
	begin
		DBMS_OUTPUT.PUT_LINE('Hello World');
	end;
	/

--[2] 변수 사용하기
SQL>
	declare
		vempno	number(4);			--	스칼라 변수 선언
		vename	varchar2(20);
	begin
		vempno	:=	7890;
		vename	:=	'SCOTT';
		
		DBMS_OUTPUT.PUT_LINE('사번/이름');
		DBMS_OUTPUT.PUT_LINE('~~~~~ ~~~~~ ~~~~~ ~~~~~ ~~~~~');
		DBMS_OUTPUT.PUT_LINE(vempno||'/'||vename);
	end;
	/

SQL>
	declare
		vempno		emp.empno%type;	-- 레퍼런스 변수 선언
		vename		emp.ename%type;
	begin
		DBMS_OUTPUT.PUT_LINE('사번/이름');
		DBMS_OUTPUT.PUT_LINE('~~~~~ ~~~~~ ~~~~~ ~~~~~ ~~~~~');
		
		select empno, ename into vempno, vename
		from emp
		where ename = 'SCOTT';
		
		DBMS_OUTPUT.PUT_LINE(vempno||'/'||vename);
	end ;
	/


--[3] record type 사용
---- emp 테이블에서 scott 사원의 정보를 출력

SQL>
	declare
		type	emp_record_type			--	레코드 타입을 정의
		is record(
			v_empno		emp.empno%type,
			v_ename		emp.ename%type,
			v_job		emp.job%type,
			v_deptno	emp.deptno%type		-- , 없음
		);
		
		emp_record		emp_record_type;
	begin
		select	empno, ename, job, deptno	into	emp_record
		from	emp
		where	ename = 'SCOTT';
		
		DBMS_OUTPUT.PUT_LINE('사원번호 : ' || TO_CHAR(emp_record.v_empno));
		DBMS_OUTPUT.PUT_LINE('사원이름 : ' || TO_CHAR(emp_record.v_ename));
		DBMS_OUTPUT.PUT_LINE('담당업무 : ' || TO_CHAR(emp_record.v_job));
		DBMS_OUTPUT.PUT_LINE('부서번호 : ' || TO_CHAR(emp_record.v_deptno));
	end ;
	/

--[4] 조건문
----   사원번호가 7788인 사원의 부서 번호를 얻어와서 부서 번호에 따른 부서명을 구하세요.
SQL>
	declare
		vempno		number(4);
		vename		varchar2(20);
		vdeptno		emp.deptno%type;
		vdname		varchar2(20) :=	null;
	begin
		select	empno, ename, deptno
		into	vempno, vename, vdeptno
		from	emp
		where	empno	=	7788;
		
		if		(vdeptno = 10)	then
			vdname	:=	'회계부';
		elsif	(vdeptno = 20)	then
			vdname	:=	'영업부';
		elsif	(vdeptno = 30)	then
			vdname	:=	'개발부';
		elsif	(vdeptno = 40)	then
			vdname	:=	'관리부';
		-- else
		end if;
		
		DBMS_OUTPUT.PUT_LINE('사번 / 이름 / 부서명');
		DBMS_OUTPUT.PUT_LINE('~~~~~ ~~~~~ ~~~~~ ~~~~~ ~~~~~');
		DBMS_OUTPUT.PUT_LINE(vempno ||'/'|| vename ||'/'|| vdname);
		
		DBMS_OUTPUT.PUT_LINE('사원번호 : ' || vempno);
		DBMS_OUTPUT.PUT_LINE('사원이름 : ' || vename);
		DBMS_OUTPUT.PUT_LINE('부서이름 : ' || vdname);
	end;
	/


--[5] 반복문
---- 1) basic loop문
SQL>
	declare
		n number := 1;
	begin
		LOOP
			DBMS_OUTPUT.PUT_LINE(n);
			n := n + 1;
			
			if (n >= 5) then
				exit;
			end if;
		end LOOP;
	end;
	/

---- 2) for loop문
SQL>
	begin
		for n in 1..5 LOOP
			DBMS_OUTPUT.PUT_LINE(n);
		end LOOP;
	end;
	/

---- 3) while loop문
SQL>
	declare
		n	number	:=	1;
	begin
		while(n <= 5)	LOOP
			DBMS_OUTPUT.PUT_LINE(n);
			n := n +1 ;
		end LOOP;
	end;
	/