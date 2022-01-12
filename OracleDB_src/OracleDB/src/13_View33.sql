-- * 오라클 - 뷰(View)

--[1] 뷰의 기본테이블 생성
--      (1) DEPT 테이블을 복사한 DEPT_COPY 테이블을 생성해서 사용하도록 함.
create table dept_copy
as
select * from dept;

--      (2) EMP 테이블을 복사한 EMP_COPY 테이블을 생성해서 사용하도록 함. 
create table emp_copy
as
select * from emp;


--[2] 뷰(view) 정의하기
--    . 뷰를 생성하기 위해서는 create view로 시작함.
--    . as 다음은 마치 서브쿼리문과 유사함.
--    . 서브쿼리는 우리가 지금까지 사용하였던 select문을 기술하면 됨.

--  ex)  만일 30번 부서에 소속된 사원들의 사번과 이름과 
--       부서번호를 자주 검색한다고 가정하면
select empno, ename, deptno
from emp_copy
where deptno = 30;

--         . 위와 같이 결과를 출력하기 위해서 매번 select문을
--           입력하기란 여간 번거로운 일이 아닐 수 없음.
--         . 뷰는 이와같이 번거로운 select문을 매번 입력하는 
--           대신 보다 쉽게 원하는 결과를 얻고자 하는 바램에서
--           출발한 개념.

--[view를 생성할 수 있는 권한 부여]
--   . dos command 창에서sqlplus로 연결
SQL>conn system/admin1234
SQL>show user
SQL>grant create view to scott;
SQL>conn scott/tiger

create view emp_view30
as
select empno, ename, deptno
from emp_copy
where deptno = 30;

select * from emp_view30;
desc emp_view30;


-- [문제] 기본 테이블은 emp_copy로 합니다. 20번 부서에 
--        소속된 사원들의 사번과 이름, 부서번호, 상관의
--        사번을 출력하기 위한 select문을 emp_view20
--        이라는 이름의 뷰로 정의해 보세요.



--[3] 뷰의 내부 구조와 user_views 데이터 딕셔너리
SQL> desc user_views;
SQL> select view_name, text from user_views;


--[4] 뷰의 동작원리
--     1. 사용자가 뷰에 대해서 질의를 하면 user_views에서
--        뷰에 대한 정의를 조회한다.
--     2. 기본 테이블에 대한 뷰의 접근 권한을 살핀다.
--     3. 뷰에 대한 질의를 기본테이블에 대한 질의로 변환.
--     4. 기본 테이블에 대한 질의를 통해 데이터를 검색.
--     5. 검색된 결과를 출력한다.

--[5] 뷰와 기본 테이블 관계 파악
--   1. 뷰를 통한 데이터 저장이 가능?
insert into emp_view30
values(8000, 'ANGEL', 30);

select * from emp_view30;

--   2. insert문에 뷰(emp_view30)를 사용하였지만, 뷰는
--      쿼리문에 대한 이름일 뿐 새로운 레코드는 기본 테이블
--      (emp_copy)에 실질적으로 추가되는 것이다.

select * from emp_copy;

--   3. 뷰는 실질적인 데이터를 저장한 기본 테이블을 볼 수
--      있도록한 투명한 창이다. 즉, 기본 테이블의 모양이 
--      바뀐 것이고 그 바뀐 내용을 뷰라는 창을 통해서 볼 
--      뿐이다. 뷰에 insert뿐만 아니라, update, delete 모두
--      사용 할 수 있는데, 이 명령문 역시 뷰의 텍스트에 
--      저장되어 있는 기본 테이블을 변경하는 것이다.

--[6] 뷰를 사용하는 이유

-- ex) 인사과 뷰
create view emp_view
as
select empno, ename, job, hiredate, deptno
from emp_copy;


-- [7] 뷰의 특징
--    1. 단순 뷰(한 개의 테이블)에 대한 데이터 조작
insert into emp_view30
values(8010, 'cheolsoo', 30);

select * from emp_view30;
select * from emp_copy;

--    2. 단순 뷰의 컬럼에 별칭 부여하기
create view emp_view_copy(사원번호, 사원명, 급여, 부서번호)
as
select empno, ename, sal, deptno
from emp_copy;

select * from emp_view_copy;

-- 주의)
select * from emp_view_copy
where deptno = 30; -- failed

select * from emp_view_copy
where 부서번호 = 30;

--    3. 그룹 함수를 사용한 단순 뷰
create view view_sal
as
select deptno, sum(sal), avg(sal)
from emp_copy
group by deptno; -- failed

create view view_sal
as
select deptno, sum(sal) as "SalSum", avg(sal) as "SalAvg"
from emp_copy
group by deptno;

select * from view_sal;

insert into view_sal
values(30, 3500, 2755); -- failed

--    4. 복합 뷰(두 개 이상의 테이블)
select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where e.deptno = d.deptno
order by empno desc;

create view emp_view_dept
as
select empno, ename, sal, e.deptno, dname, loc
from emp e, dept d
where e.deptno = d.deptno
order by empno desc;

select * from emp_view_dept;

--[8] 뷰 삭제
drop view emp_view_dept;


--[9] 뷰 생성에 사용되는 다양한 옵션(or replace)
create or replace view emp_view30
as
select empno, ename, comm, deptno
from emp_copy
where deptno = 30;

--[10] 뷰 생성에 사용되는 다양한 옵션(force/noforce)
select * from employees;

create or replace view employees_view
as
select empno, ename, deptno
from employees
where deptno = 30; -- failed

create or replace force view employees_view
as
select empno, ename, deptno
from employees
where deptno = 30;

select view_name, text
from user_views;

insert into employees_view
values(8020, '철수', 30); -- failed


--[11] 뷰 생성에 사용되는 다양한 옵션(with check option)
create or replace view emp_view30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30;

select * from emp_view30;

-- 예시) 30번 부서에 소속된 사원 중에 급여가 1200 이상인 사원은 20번 부서로 이동 시켜 보세요.
update emp_view30
set deptno = 20
where sal >= 1200; -- 여러 사람이 공유하는 경우에는 문제 발생.

select * from emp_view30;

create or replace view view_chk30
as
select empno, ename, sal, comm, deptno
from emp_copy
where deptno = 30 with check option;

select * from view_chk30;

update view_chk30
set deptno = 20
where sal >= 900;

insert into emp_copy(empno, ename, sal, deptno)
values(8040, '홍길동', 1020, 30);

update view_chk30
set comm = 1000;


--[12] 뷰 생성에 사용되는 다양한 옵션(with read only)
--         : 기본 테이블의 어떤 컬럼에 대해서도 뷰를 통한 내용 수정을 불가능하게 만드는 옵션.
create table emp_copy03
as
select * from emp;

create or replace view view_check30
as
select empno, ename, sal, comm, deptno
from emp_copy03
where deptno = 30;

update view_check30
set comm = 1000;

select * from emp_copy03;

create or replace view view_read30
as
select empno, ename, sal, comm, deptno
from emp_copy03
where deptno = 30 with read only;

update view_read30
set comm = 2000; -- failed


--[13] Top 쿼리
-- [rownum]의 특징
-- [rownum] 컬럼 값 출력

-- (1)
select rownum, empno, ename, sal
from emp;

--(2)
select rownum, empno, ename, sal
from emp
order by sal desc;

--(3)
select rownum, e.empno, e.ename, e.sal
from (select rownum, empno, ename, sal
      from emp
      order by sal desc) e;

--(4)
select rownum, e.empno, e.ename, e.sal
from (select rownum, empno, ename, sal
      from emp
      order by sal desc) e
where rownum <= 7;


-- 응용
create or replace view view_sal
as
select empno, ename, sal
from emp
order by sal;

select * from view_sal;

select rownum, empno, ename, sal
from view_sal;

select rownom, empno, ename, sal
from (select empno, ename, sal from emp order by sal);

--  [1] rownum을 이용
select rownum, empno, ename, sal
from view_sal
where rownum <= 5;

select rownum, empno, ename, sal
from view_sal
where rownum >= 3 and rownum <= 5;

--  [2] inline view(인라인 뷰)를 이용
--      : sql문에서 사용하는 서브쿼리의 일종으로 보통 from절에 위치해서 테이블처럼 사용하는 것.
select rownum, empno, ename, sal
from ( select empno, ename, sal
		from emp
		order by sal )
where rownum <= 5;

select rownum, empno, ename, sal
from (	select *
		from emp
		order by sal );

select rownum, e.*
from 	(	select rownum rnum, empno, ename, sal
			from	(	select *
						from emp
						order by sal
					)
		)	e
where (rnum >=3) and (rnum <= 7);

--[문제] 사원중에서 급여를 가장 많이 받는 사원 7명만을 출력하는 명령문을 
--        인라인 뷰를 이용해서 구현해 보세요.



--[문제] 입사일자를 기준으로 내림차순으로 정렬을 해서 5와 10사이의 존재하는
--          사원을 출력을 해보세요.


