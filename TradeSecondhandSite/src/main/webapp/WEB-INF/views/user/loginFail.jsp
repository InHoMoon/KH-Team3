<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 로그인 버튼
	$("#btnLogin").click(function() {
		$(location).attr('href', '/login') // loginController으로 가기
	})
	
})
</script>

<h1 style="color: red; text-align: center;">로그인 실패</h1>
<hr>

<h3 style="text-align: center;">ID와 PASSWORD를 다시 확인하세요</h3>

<div class="text-center">
	<button type="button" class="btn btn-default" id="btnLogin">로그인</button>
</div>

<%@ include file="../layout/footer.jsp" %>
 