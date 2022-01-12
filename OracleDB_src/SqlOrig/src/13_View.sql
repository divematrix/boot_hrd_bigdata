-- * 오라클 - 뷰(View)

--[1] 뷰의 기본테이블 생성
--      (1) DEPT 테이블을 복사한 DEPT_COPY 테이블을 생성해서 사용하도록 함.


--      (2) EMP 테이블을 복사한 EMP_COPY 테이블을 생성해서 사용하도록 함. 



--[2] 뷰(view) 정의하기

--  ex)  만일 30번 부서에 소속된 사원들의 사번과 이름과 
--         부서번호를 자주 검색한다고 가정하면



--         . 위와 같이 결과를 출력하기 위해서 매번 select문을
--           입력하기란 여간 번거로운 일이 아닐 수 없음.
--         . 뷰는 이와같이 번거로운 select문을 매번 입력하는 
--           대신 보다 쉽게 원하는 결과를 얻고자 하는 바램에서
--           출발한 개념.

--[view를 생성할 수 있는 권한 부여]
--   . dos command 창에서sqlplus로 연결





-- [문제] 기본 테이블은 emp_copy로 합니다. 20번 부서에 
--        소속된 사원들의 사번과 이름, 부서번호, 상관의
--        사번을 출력하기 위한 select문을 emp_view20
--        이라는 이름의 뷰로 정의해 보세요.

--[3] 뷰의 내부 구조와 user_views 데이터 딕셔너리
SQL>
SQL>


--[4] 뷰의 동작원리
--     1. 사용자가 뷰에 대해서 질의를 하면 user_views에서
--          뷰에 대한 정의를 조회한다.
--     2. 기본 테이블에 대한 뷰의 접근 권한을 살핀다.
--     3. 뷰에 대한 질의를 기본테이블에 대한 질의로 변환.
--     4. 기본 테이블에 대한 질의를 통해 데이터를 검색.
--     5. 검색된 결과를 출력한다.

--[5] 뷰와 기본 테이블 관계 파악
--   1. 뷰를 통한 데이터 저장이 가능?



--   2. insert문에 뷰(emp_view30)를 사용하였지만, 뷰는
--        쿼리문에 대한 이름일 뿐 새로운 레코드는 기본 테이블
--        (emp_copy)에 실질적으로 추가되는 것이다.



--   3. 뷰는 실질적인 데이터를 저장한 기본 테이블을 볼 수
--      있도록한 투명한 창이다. 즉, 기본 테이블의 모양이 
--      바뀐 것이고 그 바뀐 내용을 뷰라는 창을 통해서 볼 
--      뿐이다. 뷰에 insert뿐만 아니라, update, delete 모두
--      사용 할 수 있는데, 이 명령문 역시 뷰의 텍스트에 
--      저장되어 있는 기본 테이블을 변경하는 것이다.

--[6] 뷰를 사용하는 이유

-- ex) 인사과 뷰



-- [7] 뷰의 특징
--    1. 단순 뷰(한 개의 테이블)에 대한 데이터 조작



--    2. 단순 뷰의 컬럼에 별칭 부여하기




--    3. 그룹 함수를 사용한 단순 뷰


--    4. 복합 뷰(두 개 이상의 테이블)


--[8] 뷰 삭제



--[9] 뷰 생성에 사용되는 다양한 옵션(or replace)





--[10] 뷰 생성에 사용되는 다양한 옵션(force/noforce)



--[11] 뷰 생성에 사용되는 다양한 옵션(with check option)



-- 예시) 30번 부서에 소속된 사원 중에 급여가 1200 이상인 사원은 20번 부서로 이동 시켜 보세요.





--[12] 뷰 생성에 사용되는 다양한 옵션(with read only)
--         : 기본 테이블의 어떤 컬럼에 대해서도 뷰를 통한 내용 수정을 불가능하게 만드는 옵션.





--[13] Top 쿼리

-- [rownum] 컬럼 값 출력






-- [rownum]의 특징



--  [1] rownum을 이용



--  [2] inline view(인라인 뷰)를 이용
--      : sql문에서 사용하는 서브쿼리의 일종으로 보통 from절에 위치해서 테이블처럼 사용하는 것.




--[문제] 사원중에서 급여를 가장 많이 받는 사원 7명만을 출력하는 명령문을 
--        인라인 뷰를 이용해서 구현해 보세요.




--[문제] 입사일자를 기준으로 내림차순으로 정렬을 해서 5와 10사이의 존재하는
--          사원을 출력을 해보세요.


