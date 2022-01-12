create or replace trigger trg_01
after insert
on emp02

begin
	DBMS_OUTPUT.PUT_LINE('succeed data insert');
end ;
/