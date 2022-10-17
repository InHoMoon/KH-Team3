<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 로그인 버튼
	$("#btnLogin").click(function() {
		$(location).attr('href', '/login') // LoginController으로 가기
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
</style>


<fieldset id="failform">

	<h1 style="text-align: center;">비밀번호 수정 성공</h1>
	<hr>
	
	<div class="text-center">
		<button type="button" class="btn btn-login" id="btnLogin">로그인</button>
	</div>

</fieldset>

<%@ include file="../layout/footer.jsp" %>
