-- * 오라클 명령어 : 내장 함수

--[1] 샘플 테이블인 dual 테이블


--[2] 임시 데이터 출력


-- *** 문자열 처리 관련 함수 ***
--[3] lower() : 모든 문자를 소문자로 변환


--[4] upper() : 모든 문자를 대문자로 변환


--[5] initcap() : 첫자만 대문자로 변환


--[6] concat() : 문자열 연결


--[7] length() : 문자열의 길이


--[8] substr() : 문자열 추출(데이터, 인덱스(1), 카운트)


--[9] instr() : 문자열 시작 위치


--[10] lpad(), rpad() : 자리 채우기


--[11] trim() : 컬럼이나 대상 문자열에서 특정 문자가 첫번째
--                   글자이거나 마지막 글자이면 잘라내고 남은
--                   문자열만 반환.


-- *** 수식 처리 관련 함수 ***

--[12] round() : 반올림(음수:소수점 이상 자리)




--[13] abs() : 절대값


--[14] floor() : 소수자리 버리기


--[15] trunc() : 특정 자리 자르기(반올림 x)


--[16] mod() : 나머지



-- *** 날짜 처리 관련 함수 ***

--[17] sysdate : 날짜


-- 날짜 포맷 출력 변경(dos command)


--[18] months_between() : 개월 수 구하기



--[19] add_months() : 개월 수 더하기



--[20] next_day() : 다가올 요일에 해당하는 날짜


--[21] last_day() : 해당 달의 마지막 일 수


--[22] to_char() : 문자열로 반환


--[23] to_date() : 날짜형(date)으로 변환



--[24] nvl() : NULL인 데이터를 다른 데이터로 변경.


--[25] decode() : switch문과 같은 기능



--[26] case() : if ~ else if ~


