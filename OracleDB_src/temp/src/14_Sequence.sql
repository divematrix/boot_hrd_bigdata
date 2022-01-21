-- * 오라클 - 시퀀스(Sequence)
select * from memos;

--[1] 샘플테이블 생성
create	table	memos(
				num			number(4) 		constraint 	memos_num_pk	primary key,
				name		varchar2(20)	constraint	momos_name_nn	not null,
				postDate	Date			default	(sysdate)
);

--[2] 해당 테이블의 시퀀스 생성
create sequence memos_seq
start with 1 increment by 1;

--[3] 데이터 입력 : 일련번호 포함
insert into	memos	(num, name)	values	(memos_seq.nextVal, '홍길동');
insert into	memos	(num, name)	values	(memos_seq.nextVal, '이순신');
insert into	memos	(num, name)	values	(memos_seq.nextVal, '강감찬');
insert into	memos	(num, name)	values	(memos_seq.nextVal, '유관순');
insert into	memos	(num, name)	values	(memos_seq.nextVal, '장영실');

--[4] 현재 시퀀스가 어디까지 증가되어져 있는지 확인.
--  ※※※※※※ 반드시 dos command 창에서 확인할 것.
SQL> insert into	memos	(num, name)	values	(memos_seq.nextVal, '안창호');
SQL> select memos_seq.currVal from dual;

--[5] 시퀀스 수정 : 최대 증가값을 7까지로 제한.
alter sequence	memos_seq	maxvalue 7; -- 최대 증가값 7 으로 변경

insert into	memos	(num, name)	values	(memos_seq.nextVal, '김구');
insert into	memos	(num, name)	values	(memos_seq.nextVal, '안중근'); -- 7번이후 저장 오류

alter sequence	memos_seq	maxvalue 100; -- 최대 증가값 100 으로 변경

--[6] 시퀀스 삭제
drop sequence memos_seq;

--[7] 시퀀스 없는 상태에서 자동 증가값 구현?
select max(num) from memos;

insert into memos(num, name)
values((select max(num)+1 from memos), '');
