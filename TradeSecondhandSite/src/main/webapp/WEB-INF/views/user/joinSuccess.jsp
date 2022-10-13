<%@page import="web.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<%	User user = (User) request.getAttribute("user"); %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 로그인 버튼
	$("#btnLogin").click(function() {
		$(location).attr('href', '/login') // loginController으로 가기
	})
	
})
</script>

<h1 style="text-align: center;">회원가입 성공</h1>
<hr>

<h3 style="text-align: center;"><%=user.getUserid() %>님, 가입을 축하합니다</h3>

<div class="text-center">
	<button type="button" class="btn btn-default" id="btnLogin">로그인</button>
</div>

<%@ include file="../layout/footer.jsp" %>
 