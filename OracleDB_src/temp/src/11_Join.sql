-- * 오라클 SQL문 : 조인(join)

--[1] 'SCOTT'이 근무하는 부서명, 지역 출력.
-- 원하는 정보가 두 개 이상의 테이블에 나뉘어져 있을 때 결과 출력.

select * from emp;
select * from dept;

select deptno from emp where ename = 'SCOTT'; -- 20
select dname, loc from dept where deptno = 20;

--[2] join(조인) 
--- (1) cross join 
select * from emp, dept

--- (2) equi join 
select * from emp, dept where emp.deptno = dept.deptno;

---- 이름이 scott인 사원의 부서명, 위치 출력
select ename, dname, loc, emp.deptno 
from emp, dept 
where emp.deptno = dept.deptno and ename = 'SCOTT';


---- 컬럼명 앞에 테이블명을 기술하여 컬럼 소속을 명확히 
---- 밝힐 수 있다.
select emp.ename, dept.dname, dept.loc, emp.deptno 
from emp, dept 
where emp.deptno = dept.deptno and emp.ename = 'SCOTT';


---- 테이블명에 별칭을 준 후 컬럼 앞에 소속 테이블을 
---- 지정하고자 할 때는 반드시 테이블명이 아닌 별칭으로 붙여야 함. 
select e.ename, d.dname, d.loc, e.deptno 
from emp e, dept d
where e.deptno = d.deptno and e.ename = 'SCOTT';

select emp.ename, dept.dname, dept.loc, emp.deptno -- fail
from emp e, dept d
where e.deptno = d.deptno and e.ename = 'SCOTT';

--- (3) non-equi join
select * from tab;
select * from emp;
select * from salgrade;

select e.ename, e.sal, s.grade 
from emp e, SALGRADE s 
where e.sal >= s.losal and e.sal <= s.hisal;

select e.ename, e.sal, s.grade 
from emp e, SALGRADE s 
where e.sal between s.losal and s.hisal;

---- emp, dept, salgrade 3개의 테이블 join
select e.ename, e.sal, s.grade, d.dname
from emp e, salgrade s, dept d
where e.deptno = d.deptno
and e.sal between s.losal and s.hisal;

--- (4) self join 
select ename, mgr from emp;

select employee.ename, employee.mgr, manager.ename
from emp employee, emp manager
where employee.mgr = manager.empno;

--- (5) outer join
--- 두 테이블에서 맵핑이 되는 데이터가 없더라도 출력
select employee.ename, employee.mgr, manager.ename
from emp employee, emp manager
where employee.mgr = manager.empno(+); -- null이 나오는 곳에 (+) 표시


--[3] ANSI join(조인)
--   (1) Ansi Cross join
select * from emp cross join dept;

--   (2) Ansi Inner join
select ename, dname
from emp inner join DEPT
on emp.deptno = dept.deptno;

select ename, dname
from emp inner join DEPT
using (deptno);

---- natural join
select ename, dname
from emp natural join dept;

--   (3) Ansi Outer join
drop table dept01 purge;
create table dept01(
	deptno	number(2),
	dname	varchar2(14)
);

insert into dept01 values (10, '관리부');
insert into dept01 values (20, '개발부');

drop table dept02 purge;
create table dept02(
	deptno	number(2),
	dname	varchar2(14)
);

insert into dept02 values (10, '관리부');
insert into dept02 values (30, '영업부');

-- 기존 오라클 방법
select * from dept01, dept02
where dept01.deptno = dept02.deptno(+);

select * from dept01, dept02
where dept01.deptno(+) = dept02.deptno;

select * from dept01, dept02
where dept01.deptno(+) = dept02.deptno(+); -- Fail

-- Ansi
select *
from dept01 left outer join dept02
on dept01.deptno = dept02.deptno;

select *
from dept01 right outer join dept02
on dept01.deptno = dept02.deptno;

select *
from dept01 full outer join dept02
on dept01.deptno = dept02.deptno;