<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<h1>로그인 성공</h1>
<hr>

<h3>로그인 상태 : <%=session.getAttribute("login") %></h3>
<h3><%=session.getAttribute("userid") %>님, 로그인되었습니다</h3>

<a href="<%=request.getContextPath() %>/">메인화면</a>

<%@ include file="../layout/footer.jsp" %>
 