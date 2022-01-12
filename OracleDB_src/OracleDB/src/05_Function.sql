-- * 오라클 명령어 : 내장 함수

--[1] 샘플 테이블인 dual 테이블 (더미테이블)
select * from dual;

--[2] 임시 데이터 출력
select 1234 * 1234 from dual;

-- *** 문자열 처리 관련 함수 ***
--[3] lower() : 모든 문자를 소문자로 변환
select lower('Hong Kil Dong') "소문자" from dual;

--[4] upper() : 모든 문자를 대문자로 변환
select upper('Hong Kil Dong') "대문자" from dual;

--[5] initcap() : 첫자만 대문자로 변환
select initcap('hoNG kIL doNG') "첫글자만 대문자 나머진 소문자" from dual;

--[6] concat() : 문자열 연결
select concat('더조은 IT ', '아카데미') "문자열 연결" from dual;

--[7] length() : 문자열의 길이
select length('더조은 아이티 아카데미'), length('The Joeun IT') from dual;

--[8] substr() : 문자열 추출(데이터, 인덱스(1), 카운트)
select substr('홍길동 만세', 1, 3) from dual;

--[9] instr() : 문자열 시작 위치
select instr('홍길동 만세', '동') from dual;

--[10] lpad(), rpad() : 자리 채우기
	-- lpad : 왼쪽을 채우기
	-- rpad : 오른쪽을 채우기
select lpad('Oracle', 20, '#') from dual;
select rpad('Oracle', 20, '#') from dual;

--[11] trim()
-- 컬럼이나 대상 문자열에서 특정 문자가 첫번째 글자이거나 마지막 글자이면
-- 잘라내고 남은 문자열만 반환.
select trim('a' from 'aaaaOracleaaaaaa') from dual;
select trim(' ' from '    Oracle   ') from dual;

-- *** 수식 처리 관련 함수 ***

--[12] round() : 반올림(음수:소수점 이상 자리)
select round(12.3456, 3) from dual;
select deptno, sal, round(sal, -3) from emp where deptno = 30;

--[13] abs() : 절대값
select abs(-10) from dual;

--[14] floor() : 소수자리 버리기
select floor(12.3456) from dual;

--[15] trunc() : 특정 자리 자르기(반올림 x)
select trunc(12.3456, 3) from dual;

--[16] mod() : 나머지
select mod(8, 5) from dual;

-- *** 날짜 처리 관련 함수 ***

--[17] sysdate : 날짜
select sysdate from dual;

-- 날짜 포맷 출력 변경(dos command)
alter session set nls_date_format = 'yyyy/mm/dd hh24:mi:ss';

--[18] months_between() : 개월 수 구하기
select ename, hiredate, round(months_between(sysdate, hiredate),2) "근무 개월 수" from emp where deptno = 10;

--[19] add_months() : 개월 수 더하기
select add_months(sysdate, 200) from dual;
select add_months(sysdate, -200) from dual;

--[20] next_day() : 다가올 요일에 해당하는 날짜
select next_day(sysdate,'일요일') from dual;

--[21] last_day() : 해당 달의 마지막 일 수
select last_day(sysdate) from dual

--[22] to_char() : 문자열로 반환
select to_char(sysdate, 'yyyy-mm-dd') from dual;

--[23] to_date() : 날짜형(date)으로 변환
select to_data('2009/12/31', 'yyyy/mm/dd') from dual;

--[24] nvl() : NULL인 데이터를 다른 데이터로 변경.
select ename, comm, nvl(comm, 0), nvl(comm, 100) from emp;

--[25] decode() : switch문과 같은 기능
select ename, deptno, decode(deptno, 10, 'A', 20, 'R', 30, 'S', 40, 'O') "부서 약자" from emp;

--[26] case() : if ~ else if ~ -- , 안붙는것 유의
select ename, deptno,
		case
			when deptno = 10 then '회계부'
			when deptno = 20 then '개발부'
			when deptno = 30 then '영업부'
			when deptno = 40 then '관리부'
		end "부서명"
from emp;
