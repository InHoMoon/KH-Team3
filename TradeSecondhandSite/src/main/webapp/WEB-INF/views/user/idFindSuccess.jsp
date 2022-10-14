<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 로그인 버튼
	$("#btnLogin").click(function() {
		$(location).attr('href', '/login') // LoginController으로 가기
	})
	
	// 비밀번호 찾기 버튼
	$("#btnPwfind").click(function() {
		$(location).attr('href', '/pwFind') // PwFindController으로 가기
	})
	
})
</script>

<h1 style="text-align: center;">아이디 찾기 성공</h1>
<hr>

<h3 style="text-align: center;"><%=session.getAttribute("username") %>님의 아이디는 <strong style="color: blue;"><%=session.getAttribute("userid") %></strong>입니다</h3>

<div class="text-center">
	<button type="button" class="btn btn-default" id="btnLogin">로그인</button>
	<button type="button" class="btn btn-default" id="btnPwfind">비밀번호 찾기</button>
</div>

<%@ include file="../layout/footer.jsp" %>
