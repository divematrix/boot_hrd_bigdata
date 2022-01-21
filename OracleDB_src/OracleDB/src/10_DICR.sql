-- * 오라클  : 데이터 무결성 제약 조건

--   1) 데이터 무결성 제약 조건(Data Integrity Constraint Rule)
--   2) 종류

SQL>desc USER_CONSTRAINTS; -- [command] 창에서 확인할 것.

SQL>select constraint_name, constraint_type, table_name from user_constraints;

-- command terminal 에서 출력되는 간격 조절
SQL>column constraint_name format a15;
SQL>column constraint_type format a4;
SQL>column table_name format a10;

-- * USER_CONS_COLUMNS  데이터 딕셔너리 뷰
--     : 어떤 컬럼에 어떤 제약 조건이 지정되었는지 알려주는 데이터 딕셔너리.
SQL>select * from user_cons_columns;

-- 컬럼 레벨 제약 조건 지정
--[1] Not null 제약 조건을 설정하지 않고 테이블 생성
drop table emp01 purge;
create table emp01 (
	empno	number(4),
	ename	varchar2(20),
	job		varchar2(20),
	deptno	number(2)
);

select * from tab;
select * from emp02;
--[null 데이터 입력 연습]
insert into emp01
values(null, null, 'salesman', 40);


--[2] Not null 제약 조건을 걸고 테이블 생성
drop table emp02 purge;
create table emp02 (
	empno	number(4) not null,
	ename	varchar2(20) not null,
	job		varchar2(20),
	deptno	number(2)
);

--[null 데이터 입력 연습]
insert into emp02
values(null, '홍길동', 'salesman', 40);

insert into emp02
values(2579, null, 'salesman', 40);

insert into emp02
values(2579, '홍길동', 'salesman', 40);

--[3] Unique 제약 조건을 설정하여 테이블 생성
create table emp03 (
	empno	number(4) unique,
	ename	varchar2(20) not null,
	job		varchar2(20),
	deptno	number(2)
);

insert into emp03
values(1234, '홍길동', 'salesman', 40);

insert into emp03
values(5678, '이순신', 'manager', 30);

insert into emp03
values(5678, '세종대왕', 'salesman', 10); -- unique constraint (SCOTT.SYS_C007013) violated

insert into emp03
values(null, '세종대왕', 'salesman', 10);

insert into emp03
values(null, '강감찬', 'manager', 20); --

select * from emp03;
--[4] 컬럼 레벨로 조건명 명시하기. not null & unique 제약 조건
drop table emp04 purge;
create table emp04 (
	empno	number(4) constraint emp04_empno_uk unique,
	ename	varchar2(20) constraint emp04_ename_nn not null,
	job		varchar2(20),
	deptno	number(2)
);

insert into emp04
values(1234, '홍길동', 'salesman', 40);

insert into emp04
values(1234, '이순신', 'manager', 30); -- unique constraint (SCOTT.EMP04_EMPNO_UK) violated

insert into emp04
values(2345, null, 'manager', 30); --  cannot insert NULL into ("SCOTT"."EMP04"."ENAME")
--[5] Primary key(기본키) 제약 조건 설정하기
--        : not null + unique
drop table emp05 purge;
create table emp05 (
	empno	number(4) constraint emp05_empno_uk primary key,
	ename	varchar2(20) constraint emp05_ename_nn not null,
	job		varchar2(20),
	deptno	number(2)
);

insert into emp05
values(1234, '홍길동', 'salesman', 40);

insert into emp05
values(1234, '이순신', 'manager', 30);

insert into emp05
values(null, '이순신', 'manager', 30);


--[6] 참조 무결성을 위한 Foreign key(외래키) 제약 조건
drop table dept06 purge;
create table dept06 (
	deptno	number(4) constraint dept06_deptno_pk primary key,
	dname	varchar2(20),
	loc		varchar2(20)
);

insert into dept06
values (10, '관리부', '서울');
insert into dept06
values (20, '연구부', '대전');
insert into dept06
values (30, '영업부', '대구');

drop table emp06 purge;
create table emp06 (
	empno	number(4) constraint emp06_empno_pk primary key,
	ename	varchar2(20) constraint emp06_ename_nn not null,
	job		varchar2(20),
	deptno	number(2) constraint emp06_deptno_fk references dept06(deptno)
);

insert into emp06
values (1234, '홍길동', 'salesman', 40); --integrity constraint (SCOTT.EMP06_DEPTNO_FK) violated - parent key not found

insert into emp06
values (1234, '홍길동', 'salesman', 10);

--[7] Check 제약 조건 설정하기
--	. 급여 컬럼을 생성하되 값은 500~5000 사이의 값만 저장 가능.
--	. 성별 저장 컬럼으로 gender를 정의하고, 'M'/'F' 둘 중 하나의 값만 저장 가능
drop table emp07 purge;
create table emp07 (
	empno	number(4)		constraint emp07_empno_pk	primary key,
	ename	varchar2(20)	constraint emp07_ename_nn	not null,
	sal		number(7, 2)	constraint emp07_sal_ck		check(sal between 500 and 5000),
	gender	varchar2(1)		constraint emp07_gender_ck	check(gender in ('M', 'F'))
);

insert into emp07
values (1234, '홍길동', 6000, 'M'); -- check constraint (SCOTT.EMP07_SAL_CK) violated

insert into emp07
values (1234, '홍길동', 1000, 'K'); -- check constraint (SCOTT.EMP07_GENDER_CK) violated

insert into emp07
values (1234, '홍길동', 1000, 'm'); -- check constraint (SCOTT.EMP07_GENDER_CK) violated


--[8] Default 제약 조건 설정하기
--	. 지역명(loc) 컬럼에 아무 값도 입력하지 않을 때,
--	  디폴드 값인 '서울' 입력되도록 default 제약 조건 지정
drop table dept08 purge;
create table dept08 (
	deptno	number(4)		constraint dept08_deptno_pk	primary key,
	dname	varchar2(20)	constraint dept08_dname_nn	not null,
	loc		varchar2(20)	default '서울'
);

insert into dept08(deptno, dname)
values(10, '관리부');

insert into dept08
values (20, '연구소', '경기도');

select * from dept08;
truncate table dept08;
--[9] 제약 조건 명시 방법
--	1) 컴럼 레벨로 제약 조건명을 명시해서 제약 조건 설정.
drop table emp09 purge;
create table emp09 (
	empno	number(4)		constraint emp09_empno_pk	primary key,
	ename	varchar2(20)	constraint emp09_ename_nn	not null,
	sal		number(7, 2)	constraint emp09_sal_ck		check(sal between 500 and 5000),
	gender	varchar2(1)		constraint emp09_gender_ck	check(gender in ('M', 'F'))
);

-- 2) 테이블 레벨 방식으로 제약 조건 설정.
-- 주의) not null 조건은 테이블 레벨 방식으로 제약 조건을 지정할 수 없다
create table emp09 (
	empno	number(4),
	ename	varchar2(20)	constraint emp09_ename_nn	not null,
	sal		number(7, 2),
	gender	varchar2(1),
	constraint emp09_empno_pk	primary key(empno),
	constraint emp09_sal_ck		check(sal between 500 and 5000),
	constraint emp09_gender_ck	check(gender in ('M', 'F'))
);

drop table emp09 purge;
create table emp09 (
	empno	number(4),
	ename	varchar2(20)	constraint emp09_ename_nn	not null,
	job		varchar2(20),
	deptno	number(2),
	constraint emp09_empno_pk	primary key(empno),
	constraint emp09_job_uk		unique(job),
	constraint emp09_deptno_fk	foreign key(deptno)		references dept06(deptno)
);

desc table emp09;
--[10] 제약 조건 추가하기
create table emp10(
	empno	number(4),
	ename	varchar2(20),
	job		varchar2(20),
	deptno	number(2)
);

alter table emp10
add constraint emp10_empno_pk primary key(empno);

alter table emp10
add constraint emp10_deptno_fk
foreign key (deptno) references dept06(deptno);

--[11] not null 제약 조건 추가하기
alter table emp10
add constraint emp10_ename_nn not null(ename); -- 오류

alter table emp10
modify ename constraint emp10_ename_nn not null; -- 기본 설정값이 null 이므로 add가 아니라 modify 명령어로 실행

--[12] 제약 조건 제거하기
alter table emp10
drop primary key;

--[13] 제약 조건(외래키) 컬럼 삭제
select * from dept06;

delete from dept06 where deptno = 10; -- fail

--   1) 제약 조건의 비활성화
delete from emp06
disable constraint emp06_deptno_fk;

delete from dept06 where deptno = 10;

insert into dept06
values (10, '인사부', '경기도');

--   2) cascade 옵션
alter table dept06
disable primary key cascade;


select constraint_name, constraint_type, table_name, r_constraint_name, status 
from user_constraints
where table_name in ('DEPT06', 'EMP06');

alter table dept06
drop primary key cascade;

select * from user_cons_columns;

