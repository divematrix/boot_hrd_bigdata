-- * 오라클

--  - 트리거(trigger)

SQL>	ed trig01
SQL>	@trig01
SQL>	select * from emp02;
SQL>	insert into emp02 values (8010, '강감찬', 'clerk', 20);
SQL>	insert into emp02 values (8020, '장영실', 'salesman', 30);
SQL>

-- * 트리거 삭제
SQL>	drop	trigger		trg_01;
