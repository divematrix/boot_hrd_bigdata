<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>홈 페이지</title>
</head>
<body>
	<h1>게시판 프로그램</h1>
	<hr>
	<!-- *.me 형식을 servlet-context.xml에 등록 -->
	<!-- method를 지정하지 않으면 GET형식으로 request -->
	<a href="login.me">로그인</a>
	
	<br><br>
	
	<a href="getBoardList.do">글 목록 바로가기</a>
</body>
</html>