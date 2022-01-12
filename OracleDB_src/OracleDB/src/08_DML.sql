-- * 오라클 SQL 문 : 데이터 입력/출력(select)/수정/삭제
--                        (DML:Data Manipulation Language)

--[1] 샘플 테이블 생성
create table exam01(
	deptno		number(2),
	dname		varchar2(14),
	loc			varchar2(14)
);

select * from tab;
select * from exam01;

--[2] 데이터 입력(저장) : insert into ~ values()
insert into exam01(deptno, dname, loc) values (10, '회계부', '서울');
insert into exam01(dname, deptno, loc) values ('개발부', 20, '부산');

select * from exam01;
--[3] 데이터 입력 : 행 생략
insert into exam01 values (30, '영업부', '대전');

--[4] null 값 입력
insert into exam01 values(40, '운영부', null); -- 입력 데이터가 없음에도 불구하고 , error 방지를 위해.

select * from exam01 order by deptno;
--[5] 데이터 출력 : select문
--        . 02_Select_Command 실습 참조.

--[6] 필드의 데이터를 변경 : 부서번호 변경
update exam01 set deptno = 50 where deptno = 40;

--[7] 급여 10% 인상 금액 반영
select * from tab;
create table exam02 as select * from emp;
select * from exam02;

update exam02 set sal = sal*1.1;
--[8] 부서번호가 10인 사원의 부서번호를 20으로 변경.
update exam02 set deptno = 20 where deptno = 10

--[9] 급여가 3000 이상인 사원만 급여를 10% 인상.
update exam02 set sal = sal * 1.1 where sal >= 3000;


--[10] 사원 이름이 scott인 자료의 부서번호를 10, 
--       직급을 MANAGER로 변경.
update exam02 set deptno=10, job='MANAGER' where ename='SCOTT';

--[11] 30번 부서 사원을 삭제
delete from exam02 where deptno = 30;

--[12] 사원을 삭제
delete from exam02;

