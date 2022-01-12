-- * 오라클 : 사용자(User) 권한(Role)
--                       (DCL:Data Control Language)
--   
----[1] 권한의 역할과 종류

----[2] thomas 계정 생성(command 창에서 실행)
SQL>
SQL>

SQL>
SQL>

----[3] 데이터베이스 접속 권한 부여
SQL>
SQL>
SQL>

SQL>


----[4] 테이블 생성 권한
SQL>
SQL>
SQL>
SQL>

----[5] 테이블 스페이스 확인
--         : 테이블 스페이스(table space)는 디스크 공간을 소비하는 테이블과 뷰 그리고 그 밖의 다른 데이터베이스
--           객체들이 저장되는 장소.
---- cf) 오라클 xe버전의 경우 메모리 영역은 system으로 할당.
--         오라클 full버전의 경우 메모리 영역은 users으로 할당.
--           SQL>alter user thomas quota 2m on users
SQL>
SQL>
SQL>
SQL>


SQL>
SQL>


-- ※ 계정 생성 및 테이블 생성까지의 권한 부여 정리
C:\>
SQL>
SQL>
SQL>
SQL>


--[6] with admin option
--       : 사용자에게 시스템 권한을 with admin option과 함께
--          부여하면 그 사용자는 데이터베이스 관리자가 아닌데
--          도 불구하고 부여받은 시스템 권한을 다른 사용자에게
--          부여할 수 있는 권한도 함께 부여 받게 됨.

-- tester1 계정 생성 및 권한 부여
SQL>
SQL>
SQL>
SQL>
SQL>

SQL>
SQL>
        
-- tester2 계정 생성 및 권한 부여
SQL>
SQL>
SQL>
SQL>
SQL>

SQL>
SQL>
        
--[7] 테이블 객체에 대한 select 권한 부여(scott/emp -> thomas)
SQL>
SQL>
SQL>
SQL>

--[8] 스키마(SCHEMA) : 객체를 소유한 사용자명을 의미.
SQL>

--[9] 사용자에게 부여된 권한 조회
--      . user_tab_privs_made : 현재 사용자가 다른 사용자에게 부여한 권한 정보를 알려줌.
--      . user_tab_privs_recd : 자신에게 부여된 사용자 권한을 알고 싶을 때.
SQL>
SQL>
SQL>

--[10] 비밀번호 변경시
SQL>
SQL>

--[11] 객체 권한 제거하기
SQL>
SQL>

--[12] with grant option
--       : 사용자에게 객체 권한을 with grant option과 함께
--          부여하면 사용자는 객체를 접근할 권한을 부여 받으
--          면서 그 권한을 다른 사용자에게 부여할 수 있는 권한
--          도 함께 부여받게 됨.
SQL>
SQL>

SQL>
SQL>

SQL>
SQL>

--[13] 사용자 계정 제거
SQL>
SQL>

--[14] 권한(Role)

SQL>
SQL>
SQL>
SQL>
SQL>
