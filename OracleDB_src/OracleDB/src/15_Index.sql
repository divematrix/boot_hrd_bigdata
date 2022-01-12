-- * 오라클 : 인덱스(index)


--[1] 인덱스 정보 조회
select	index_name, table_name, column_name
from	user_ind_columns
where	table_name in ('EMP', 'DEPT', 'EMP01');


--[2] 조회 속도 비교하기
----   사원 테이블 복사하기
drop table emp01 purge;

create table emp01
as
select * from emp;

----  주의)데이터 복사시 테이블 구조와 내용만 복사될 뿐 제약조건은 복사되지 않는다.


-- command 창에 실행
insert into emp01 select * from emp01; -- 데이터 복사 (총 데이터 3670016 * 2개)

set timing on

insert into emp01(empno, ename)
values (8010, 'ANGEL');

select distinct empno, ename
from emp01
where	ename = 'ANGEL';		-- Elapsed: 00:00:00.57 (index 연결 x)

--[3] 인덱스 생성
create index idx_emp01_ename
on emp01(ename);

select	index_name, table_name, column_name
from	user_ind_columns
where	table_name in ('EMP01');

select distinct empno, ename
from emp01
where	ename = 'ANGEL';		-- Elapsed: 00:00:00.00 (index 연결 o)

--[4] 인덱스 제거
drop index idx_emp01_ename;
