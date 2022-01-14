<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>start page</title>
</head>
<body>
	<%-- index.jsp 작성하면 home.jsp보다 인덱스로 향한다 --%>
	
	<%-- 동일 경로의 hello.do로 리다이렉트 --%>
	<% response.sendRedirect("./hello.do"); %>
	
</body>
</html>