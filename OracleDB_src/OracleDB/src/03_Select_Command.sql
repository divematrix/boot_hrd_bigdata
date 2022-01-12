-- * 오라클 명령어 : select문(검색)
-- 주석문

--[1] scott 사용자가 관리하는 테이블 목록
select * from tab;

--[2] 특정 테이블의 구조(필드 리스트/데이터 형식/제약조건)
desc dept; -- dos command 창에서 확인

--[3] 특정 테이블의 data 표시
select * from dept;
select * from emp;

--[4] 모든 컬럼(필드명)이 아닌, 필요한 컬럼(필드명) 내용만 출력
select dname, loc from dept;

--[5] 각각의 필드명에 별칭을 주어서 출력 : as 생략 가능
select deptno as 부서번호, dname as 부서명, loc as 부서위치 from dept;
select deptno 부서번호, dname 부서명, loc 부서위치 from dept;
	-- 별칭에 빈칸 금지 : select deptno 부서 번호, dname 부서명, loc 부서 위치 from dept;
	-- 별칭에 빈칸 가능 조건 : ""로 별칭 묶어쓰기
	select deptno "부서 번호", dname 부서명, loc "부서 위치" from dept;

--[6] 사원들의 직업명을 중복 제거 후 출력
select distinct job from emp;

--[7] 급여가 3000 이상인 사원 정보 출력
select empno, ename, sal from emp where sal >= 3000;

--[8] 이름이 scott 사원의 정보 출력
	-- 단, 문자/문자열 data의 경우는 대/소문자를 구별.
	-- 문자, 문자열은 작은 따옴표로 구분
select * from emp where ename = 'SCOTT';

--[9] 1985년도 이후로 입사한 사원 정보
select empno, ename, hiredate from emp where hiredate >= '1985/01/01';

--[10] 부서번호가 10이고, 그리고 직업이 'MANAGER'인 사원 출력
select ename, deptno, job from emp where deptno = 10 and job = 'MANAGER';

--[11] 부서번호가 10이거나, 직업이 'MANAGER'인 사원 출력
select ename, deptno, job from emp where deptno = 10 OR job = 'MANAGER';

--[12] 부서번호가 10이 아닌 사원
select ename, deptno from emp where not (deptno = 10);
select ename, deptno from emp where deptno <> 10;
select ename, deptno from emp where deptno != 10;
select ename, deptno from emp where deptno ^= 10;

--[13] 급여가 1000 ~ 3000 사이인 사원을 출력
select ename, sal from emp where sal >= 1000 and sal <=3000;
select ename, sal from emp where sal between 1000 and 3000;

--[14] 급여가 1300 또는 1500 또는 1600인 사원 정보 출력
select ename, sal from emp where sal = 1300 or sal = 1500 or sal = 1600;
select ename, sal from emp where sal in (1300, 1500, 1600);

--[15] 이름이 'K'로 시작하는 사원 출력
select empno, ename from emp where ename like 'K%'
select empno, ename from emp where ename like 'M%'

--[16] 이름이 'K'로 끝나는 사원 출력
select empno, ename from emp where ename like '%K'

--[17] 이름에 'K'가 포함되어 있는 사원 출력
select empno, ename from emp where ename like '%K%'

--[18] 2번째 자리에 'A'가 들어가 있는 사원 출력
select empno, ename from emp where ename like '_A%'

--[19] 커미션을 받지 않는 사원 출력
select empno, ename, comm from emp where comm = 0 or comm is null;

--[20] 커미션을 받는 사원 출력
select empno, ename, comm from emp where not (comm = 0 or comm is null);
select empno, ename, comm from emp where comm <> 0 and comm is not null;

--[21] 사번의 정렬(오름차순)으로 출력
select empno, ename from emp order by empno asc; -- asc 생략 가능 (기본값)

-- 이름순
select empno, ename from emp order by ename asc; -- asc 생략 가능 (기본값)

--[22] 사번의 정렬(내름차순)으로 출력
select empno, ename from emp order by empno desc;

--[23] 사원의 연봉 출력
select ename, sal, sal * 12 from emp
select ename, sal, sal * 12 as "연봉" from emp; -- as 생략 가능


--[24] 커미션을 포함한 최종 연봉 출력
select ename, sal, comm, sal * 12 + comm from emp;


--[25][24]의 오류 해결법
select ename, sal, comm, sal * 12 + comm, nvl(comm, 0), sal*12 + nvl(comm, 0) "연봉" from emp;

select ename, sal*12, nvl(comm, 0), sal*12+nvl(comm, 0) "연봉" from emp;
          
          
          
          