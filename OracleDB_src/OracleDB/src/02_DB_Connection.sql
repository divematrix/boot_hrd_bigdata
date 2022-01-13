-- * 오라클 접속

c:\Users> -- 방법1

c:\Users> -- 방법2



-- system 계정으로 접속시만 적용 가능.

--[1] 최고 관리자로 접속하여 hr 사용자의 계정을 풀어줌
SQL>alter user 아이디 account unlock;

--[2] 사용자 암호를 변경
SQL>alter user 아이디 identified by 패스워드;

--[3] 현재 접속하고 있는 계정 확인
SQL>show user;

--[4] 접속 계정 변경
SQL>conn 아이디/패스워드;

--[5] 계정 사용 풀어줌 + 암호변경
SQL>alter user 아이디 identified by 패스워드 account unlock;