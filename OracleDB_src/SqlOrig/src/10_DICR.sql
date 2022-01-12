﻿-- * 오라클  : 데이터 무결성 제약 조건

--   1) 데이터 무결성 제약 조건(Data Integrity Constraint Rule)
--   2) 종류

SQL>desc USER_CONSTRAINTS; -- [command] 창에서 확인할 것.


-- * USER_CONS_COLUMNS  데이터 딕셔너리 뷰
--     : 어떤 컬럼에 어떤 제약 조건이 지정되었는지 알려주는 데이터 딕셔너리.




-- 컬럼 레벨 제약 조건 지정
--[1] Not null 제약 조건을 설정하지 않고 테이블 생성



--[null 데이터 입력 연습]



--[2] Not null 제약 조건을 걸고 테이블 생성



--[null 데이터 입력 연습]



--[3] Unique 제약 조건을 설정하여 테이블 생성






--[4] 컬럼 레벨로 조건명 명시하기. not null & unique 제약 조건




--[5] Primary key(기본키) 제약 조건 설정하기
--        : not null + unique




--[6] 참조 무결성을 위한 Foreign key(외래키) 제약 조건






--[7] Check 제약 조건 설정하기





--[8] Default 제약 조건 설정하기




--[9] 제약 조건 명시 방법



--[10] 제약 조건 추가하기




--[11] not null 제약 조건 추가하기


--[12] 제약 조건 제거하기


--[13] 제약 조건(외래키) 컬럼 삭제



--   1) 제약 조건의 비활성화

--   2) cascade 옵션




