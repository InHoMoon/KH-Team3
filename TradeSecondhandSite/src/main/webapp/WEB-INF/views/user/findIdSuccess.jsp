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
	$("#btnFindPw").click(function() {
		$(location).attr('href', '/find/pw') // FindPwController으로 가기
	})
	
})
</script>


<style type="text/css">
#failform {
	width: 500px;
	
	margin: 0 auto;
	padding: 30px;
	
}

.btn-login {
	background-color: #fad703;
	color: #104138;
}

.btn-findPw {
	background-color: mediumaquamarine;  
	color: #104138;
}
</style>


<fieldset id="failform">

	<h1 style="color: red; text-align: center;">아이디 찾기 성공</h1>
	<hr>
	
	<h3 style="text-align: center;"><%=session.getAttribute("username") %>님의 아이디는 <strong style="color: blue;"><%=session.getAttribute("userid") %></strong>입니다</h3>
	<br>
	
	<div class="text-center">
		<button type="button" class="btn btn-login" id="btnLogin">로그인</button>
		<button type="button" class="btn btn-findPw" id="btnFindPw">비밀번호 찾기</button>
	</div>

</fieldset>

<%@ include file="../layout/footer.jsp" %>
