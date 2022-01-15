<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title><spring:message code="message.user.login.title"/></title>
</head>
<body>

	<h1><spring:message code="message.user.login.title"/></h1>

	<a href="login.me?lang=en"><spring:message code="message.user.login.language.en"/></a>&nbsp;&nbsp;
	<a href="login.me?lang=ko"><spring:message code="message.user.login.language.ko"/></a>
	
	<hr>
	<form action="login.me" method="post">
		<table border="1" cellpadding="0" cellspacing="0" style="margin:0 auto;">
			<tr>
				<td bgcolor="orange"><spring:message code="message.user.login.id"/></td>
				<%-- <td><input type="text" name="id" value="${ userVO.id }"></td> --%>
				<td><input type="text" name="id" value="${ usr.id }"></td>
			</tr>
			<tr>
				<td bgcolor="orange"><spring:message code="message.user.login.password"/></td>
				<%-- <td><input type="password" name="password" value="${ userVO.password }"></td> --%>
				<td><input type="password" name="password" value="${ usr.password }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<!-- submit 시 정보를 가지고 action의 login.met + post 이 컨트롤러에 전달 -->
					<input type="submit" value="<spring:message code="message.user.login.loginBtn"/>">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>