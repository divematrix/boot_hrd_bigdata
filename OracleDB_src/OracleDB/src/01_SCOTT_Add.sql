-- * scott 계정 활성화

c:\>sqlplus system/admin1234 -- system 계정 접속

SQL>@c:\scott.sql -- scott.sql 파일 임포트

SQL>alter user scott identified by tiger; -- 비밀번호 변경

SQL>conn scott/tiger -- scott 계정으로 변환

SQL>show user; -- 현재 command에서 접속중인 계정 조회

SQL>select * from tab; -- scott 계정 테이블 목록

SQL>select * from dept; -- dept 테이블 모든 필드 , 모든 행 조회

SQL>quit; -- 종료
