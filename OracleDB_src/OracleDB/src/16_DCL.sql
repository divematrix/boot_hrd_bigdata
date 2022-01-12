-- * 오라클 : 사용자(User) 권한(Role)
--                       (DCL:Data Control Language)
--   
----[1] 권한의 역할과 종류

----[2] thomas 계정 생성(command 창에서 실행)
SQL>	sqlplus system/admin1234 or conn system/admin1234	-- system 계정 접속
SQL>	show user;	-- system 계정 접속 확인

SQL>	create user thomas identified by tiger; -- id : thomas / pw : tiger 계정 생성
SQL>	conn thomas/tigher -- 에러 : 접속 권한 없음

----[3] 데이터베이스 접속 권한 부여
SQL>	conn system/admin1234
SQL>	grant create session to thomas;
SQL>	conn thomas/tiger -- 접속 성공

SQL>	create table emp01 (
			empno		number(2),
			ename		varchar2(10),
			job			varchar2(10),
			deptno		number(2)
		);		-- 에러 : 테이블 생성 권한 없음

		----[4] 테이블 생성 권한
SQL>	conn system/admin1234
SQL>	grant create table to thomas;
SQL>	conn thomas/tigher
SQL>	create table emp01 (
			empno		number(2),
			ename		varchar2(10),
			job			varchar2(10),
			deptno		number(2)
		);			-- 에러 : 생성 권한은 있으나 테이블을 생성할 메모리 공간에 대한 권한이 없음

----[5] 테이블 스페이스 확인
--         : 테이블 스페이스(table space)는 디스크 공간을 소비하는 테이블과 뷰 그리고 그 밖의 다른 데이터베이스
--           객체들이 저장되는 장소.
---- cf) 오라클 xe버전의 경우 메모리 영역은 system으로 할당.
--         오라클 full버전의 경우 메모리 영역은 users으로 할당.
--           SQL>alter user thomas quota 2m on users
SQL>	conn system/admin1234
SQL>	alter user thomas quota 2m on system;
SQL>	conn thomas/tiger
SQL>	create table emp01 (
			empno		number(2),
			ename		varchar2(10),
			job			varchar2(10),
			deptno		number(2)
		);		-- 테이블 생성 성공

SQL>	select * from tab;
SQL>	select * from emp01;


-- ※ 계정 생성 및 테이블 생성까지의 권한 부여 정리
C:\>	sqlplus system/admin1234
SQL>	create user thomas identified by tiger;
SQL>	grant create session to thomas;
SQL>	grant create table to thomas;
SQL>	alter user thomas quota 2m on system;


--[6] with admin option
--       : 사용자에게 시스템 권한을 with admin option과 함께
--          부여하면 그 사용자는 데이터베이스 관리자가 아닌데
--          도 불구하고 부여받은 시스템 권한을 다른 사용자에게
--          부여할 수 있는 권한도 함께 부여 받게 됨.

-- tester1 계정 생성 및 권한 부여
SQL>	conn system/admin1234
SQL>	create user tester1 identified by tiger;
SQL>	grant create session to tester1;
SQL>	grant create table to tester1;
SQL>	alter user tester1 quota 2m on system;

SQL>	conn tester1/tiger
SQL>	grant create session to thomas; --	에러 : 일반 유저는 권한부여 권한이 없다
        
-- tester2 계정 생성 및 권한 부여
SQL>	conn system/admin1234
SQL>	create user tester2 identified by tiger;
SQL>	grant create session to tester2 with admin option;
SQL>	grant create table to tester2;
SQL>	alter user tester2 quota 2m on system;


SQL>	conn tester2/tiger
SQL>	grant create session to thomas; -- 성공 : with admin option에는 권한부여 권한이 있다
        
--[7] 테이블 객체에 대한 select 권한 부여(scott/emp -> thomas)
SQL>	conn scott/tiger
SQL>	grant select on emp to thomas;
SQL>	conn thomas/tiger
SQL>	select * from tab;

--[8] 스키마(SCHEMA) : 객체를 소유한 사용자명을 의미.
SQL>	select * from scott.emp;

--[9] 사용자에게 부여된 권한 조회
--      . user_tab_privs_made : 현재 사용자가 다른 사용자에게 부여한 권한 정보를 알려줌.
--      . user_tab_privs_recd : 자신에게 부여된 사용자 권한을 알고 싶을 때.
SQL>	conn thomas/tiger
SQL>	select * from user_tab_privs_made;
SQL>	select * from user_tab_privs_recd;

--[10] 비밀번호 변경시
SQL>	conn system/admin1234
SQL>	alter user thomas identified by thomas;

--[11] 객체 권한 제거하기
SQL>	conn scott/tiger
SQL>	revoke select on emp from thomas;

--[12] with grant option
--       : 사용자에게 객체 권한을 with grant option과 함께
--          부여하면 사용자는 객체를 접근할 권한을 부여 받으
--          면서 그 권한을 다른 사용자에게 부여할 수 있는 권한
--          도 함께 부여받게 됨.
SQL>	conn scott/tiger
SQL>	grant select on emp to tester1 with grant option;

SQL>	conn tester1/tiger
SQL>	grant select on scott.emp to tester2;

SQL>	conn tester2/tiger
SQL>	select * from scott.emp;

--[13] 사용자 계정 제거
SQL>	conn system/admin1234
SQL>	drop user tester2;

--[14] 권한(Role)

SQL>	conn system/admin1234
SQL>	create user tester10 identified by tiger;
SQL>	grant connect, resource to tester10;
SQL>	conn tester10/tiger
SQL>	select * from dict where table_name like '%ROLE%';
