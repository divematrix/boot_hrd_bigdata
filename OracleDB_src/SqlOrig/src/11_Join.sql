-- * 오라클 SQL문 : 조인(join)

--[1] 'SCOTT'이 근무하는 부서명, 지역 출력.
--      원하는 정보가 두 개 이상의 테이블에 나뉘어져 있을 때
--      결과 출력.



--[2] join(조인) 
--- (1) cross join 


--- (2) equi join 


---- 이름이 scott인 사원의 부서명, 위치 출력



---- 컬럼명 앞에 테이블명을 기술하여 컬럼 소속을 명확히 
---- 밝힐 수 있다.



---- 테이블명에 별칭을 준 후 컬럼 앞에 소속 테이블을 
---- 지정하고자 할 때는 반드시 테이블명이 아닌 별칭으로 붙여야 함. 



--- (3) non-equi join




---- emp, dept, salgrade 3개의 테이블 join


--- (4) self join 


--- (5) outer join 



--[3] ANSI join(조인)
--   (1) Ansi Cross join



--   (2) Ansi Inner join



---- natural join



--   (3) Ansi Outer join


