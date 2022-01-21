--  * 오라클 - 동의어(Synonym)

--   - 종류

--[1] 테이블 생성 후 객체 권한 부여하기
SQL>	conn system/admin1234
SQL>	create table table_systbl(
			ename	varchar2(20)
		);

        
SQL>	insert into table_systbl values('이순신');
SQL>	insert into table_systbl values('강감찬');

---- scott 사용자(계정)에게 table_systbl 이란 테이블에 select
--    할 권한을 부여합니다.
SQL>	grant select on table_systbl to scott;

SQL>	conn scott/tiger;
SQL>	select * from table_systbl;	-- 접속 에러
SQL>	select * from system.table_systbl; -- 접속 성공 : 스키마와 같이 테이블 이름 사용

--[2] 동의어 생성 및 의미 파악하기
SQL>	conn system/admin1234
SQL>	grant create synonym to scott;
SQL>	conn scott/tiger
SQL>	create synonym systab for system.table_systbl;
SQL>	select * from systab;

--[3] 비공개 동의어 생성 및 의미
--		. 사용자 정의 롤을 생성한 후에 사용자 정의 롤에 connect, resource role과
--		  create synonym 권한과 scott 소유자의 emp테이블과 dept테이블에 대한
--		  select 객체 권한을 role에 부여.

SQL>	conn system/admin1234
SQL>	create role test_role;
SQL>	grant connect, resource, create synonym to test_role;
SQL>	grant select on scott.emp to test_role;
SQL>	grant select on scott.dept to test_role;

---- 사용자 생성
SQL>	create user tester50 identified by tiger;
SQL>	create user tester51 identified by tiger;

---- 사용자에게 롤 부여 
SQL>	grant test_role to tester50;
SQL>	grant test_role to tester51;


SQL>	conn tester50/tiger
SQL>	select * from dept;		-- 에러
SQL>	select * from scott.dept;

-- 사용자 tester50 비공개 동의어 생성
SQL>	conn tester50/tiger
SQL>	create synonym	dpt for scott.dept;
SQL>	select * from dpt;

SQL>	conn tester51/tiger
SQL>	select * from dpt; -- 에러

--[4] 공개 동의어 정의하기
SQL>	conn system/admin1234
SQL>	create public synonym PubDept for scott.dept;

-- 사용자 생성
SQL>	create user tester52 identified by tiger

--  사용자에게 롤 부여
SQL>	grant test_role to tester52;

SQL>	conn tester52/tiger
SQL>	select * from dpt;		-- 비공개 동의어
SQL>	select * from PubDept;	--   공개 동의어

--[5] 비공개 동의어 제거하기
--		. 비공개 동의어인 dpt는 동의어를 소유한 사용자로 접속한 후 제거해 줘야 함
SQL>	conn tester50/tiger
SQL>	drop synonym dpt;
SQL>	select * from dpt;	-- 확인

--[6] 공개 동의어 제거하기
SQL>	conn system/admin1234
SQL>	drop public synonym PubDept;	-- public synonym은 삭제시에도 public synonym으로 정의해줘야 함
SQL>	
