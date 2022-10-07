<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<h1>회원가입 성공</h1>
<hr>

<h3><%=session.getAttribute("userid") %>님, 가입을 축하합니다</h3>

<a href="<%=request.getContextPath() %>/login">로그인 하러가기</a>

</body>
</html>