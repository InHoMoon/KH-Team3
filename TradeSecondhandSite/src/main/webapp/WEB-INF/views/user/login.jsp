<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 입력창에 포커스주가
	$("input").eq(0).focus()
	
	// 패스워드 입력창에 엔터키 입력 시 submit
	$("input").eq(1).keydown(function(e) {
		if( e.keyCode == 13 ) { // 엔터키
			$("#btnLogin").click();
		}
	})
	
	// 로그인 버튼
	$("#btnLogin").click(function() {
		$(this).parents("form").submit();
	})
	
	
	//------------------------------------------------------------------------
	
	//--- 아이디 찾기, 비밀번호 찾기 개발 필요 ---
	
	// 취소 버튼
	$("#btnCancel").click(function() {
// 		history.go(-1) // 뒤로가기
		$(location).attr('href', '/') // 메인으로 가기
	})
	
	// 아이디 찾기 버튼
	$("#btnIdfind").click(function() {
		
	})
	
	
	// 비밀번호 찾기 버튼
	$("#btnPwfind").click(function() {
		
	})
	
	
	//------------------------------------------------------------------------
	
	
	// 회원가입 버튼
	$("#btnJoin").click(function() {
		$(location).attr('href', '/join') // JoinController로 가기
	})
	
	
})
</script>

<h1 style="text-align: center; background: lightgray;">로그인</h1>
<hr>

<form action="/login" method="post" class="form-horizontal">

	<div class="form-group">
		<label for="userid" class="col-xs-2 col-xs-offset-2 control-label">아이디</label>
		<div class="col-xs-5">
			<input type="text" id="userid" name="userid" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="userpw" class="col-xs-2 col-xs-offset-2 control-label">비밀번호</label>
		<div class="col-xs-5">
			<input type="password" id="userpw" name="userpw" class="form-control">
		</div>
	</div>
	
	<!-- checkbox value 수정 필요 -->
	<div class="text-center">
		<input type="checkbox" id="saveid" name="saveid" value="A"><label for="saveid">아이디 저장</label>
		<input type="checkbox" id="autologin" name="autologin" value="B"><label for="autologin">자동로그인</label>
	</div>

	<div class="text-center">
		<button type="button" class="btn btn-primary" id="btnLogin">로그인</button>
		<button type="button" class="btn btn-danger" id="btnCancel">취소</button>
	</div>

	<div class="text-center">
		<button type="button" class="btn btn-primary" id="btnIdfind">아이디 찾기</button>
		<button type="button" class="btn btn-info" id="btnPwfind">비밀번호 찾기</button>
		<button type="button" class="btn btn-danger" id="btnJoin">회원가입</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
 