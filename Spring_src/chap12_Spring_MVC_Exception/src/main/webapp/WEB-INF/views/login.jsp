<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>

<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>로그인 폼</title>
</head>
<body>
	<h1>로그인</h1>
	<hr>
	<form action="login.me" method="post">
		<table border="1" cellpadding="0" cellspacing="0" style="margin:0 auto;">
			<tr>
				<td bgcolor="orange">아이디</td>
				<%-- <td><input type="text" name="id" value="${ userVO.id }"></td> --%>
				<td><input type="text" name="id" value="${ usr.id }"></td>
			</tr>
			<tr>
				<td bgcolor="orange">비밀번호</td>
				<%-- <td><input type="password" name="password" value="${ userVO.password }"></td> --%>
				<td><input type="password" name="password" value="${ usr.password }"></td>
			</tr>
			<tr>
				<td colspan="2" align="center">
					<!-- submit 시 정보를 가지고 action의 login.met + post 이 컨트롤러에 전달 -->
					<input type="submit" value="로그인">
				</td>
			</tr>
		</table>
	</form>
</body>
</html>