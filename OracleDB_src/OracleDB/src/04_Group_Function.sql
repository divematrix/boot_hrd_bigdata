-- * 오라클 명령어 : Group 함수

-- nvl(매개변수, 반환인자) : 매개변수에 대입되는 전달인자가 null 일경우 두번째 반환인자 반환
select ename, comm, nvl(comm, 0), nvl(comm, 100) from emp;
	
-- sum() : 합계
select sum(sal) "총급여" from emp;

-- count() : 카운트
	-- 사원의 수 구하기 (행의 개수)
	select count(*) "사원수" from emp;

-- avg() : 평균
select avg(sal) "평균 급여" from emp;

-- max() : 최대값
select max(sal) "최고 급여 수령자" from emp;

-- min() : 최소값
select min(sal) "최저 급여 수령자" from emp;

-- Group by 절 : 직업별 급여 평균
select job, avg(sal) from emp group by job;

-- Having 절 : 직업별 급여 평균(단, 급여 평균 2000이상 직업)
select job, avg(sal) from emp group by job having avg(sal) >= 2000;

