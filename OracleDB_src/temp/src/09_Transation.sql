--  * 오라클 - 트랜잭션(transation)
--     . commit : 명령어 완전 실행(DB 최종 적용).
--     . rollback : 명령어 되돌리기(실행 해제).
-- eclipse는 자동 commit을 하기 때문에 command에서 실행해야 한다

--[1] 테이블 생성
create table dept01 as select * from dept;

--[2] command 창에서 실습 진행할 것.
--      . 두 개의 command창을 띄워서 scott 계정으로 접속.
delete from dept01;  -- command(1)에서 실행
select * from dept01; -- 데이터 확인 (반영 o)

--command(2)에서 실행 및 데이터 확인.
select * from dept01; -- 데이터 확인 (반영 x)

--command(1)에서 
commit; -- 명령을 실행하면 최종 반영

--command(2)에서 실행 및 데이터 확인.
select * from dept01; -- 데이터 확인 (반영 o)

--[3] 되돌리기
rollback;

-- [2]번과 동일 실습 진행.
drop table dept01 purge;
