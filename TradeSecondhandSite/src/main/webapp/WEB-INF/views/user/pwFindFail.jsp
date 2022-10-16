<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 찾기 버튼
	$("#btnIdfind").click(function() {
		$(location).attr('href', '/idFind') // IdFindController으로 가기
	})
	
	// 비밀번호 찾기 버튼
	$("#btnPwfind").click(function() {
		$(location).attr('href', '/pwFind') // PwFindController으로 가기
	})
	
	// 메인화면 버튼
	$("#btnMain").click(function() {
		$(location).attr('href', '/') // 메인으로 가기
	})
	
})
</script>

<h1 style="color: red; text-align: center;">비밀번호 찾기 실패</h1>
<hr>

<h3 style="text-align: center;">ID, 이름, EMAIL을 다시 확인하세요</h3>

<div class="text-center">
	<button type="button" class="btn btn-default" id="btnIdfind">아이디 찾기</button>
	<button type="button" class="btn btn-default" id="btnPwfind">비밀번호 찾기</button>
	<button type="button" class="btn btn-default" id="btnMain">메인화면</button>
</div>

<%@ include file="../layout/footer.jsp" %>
