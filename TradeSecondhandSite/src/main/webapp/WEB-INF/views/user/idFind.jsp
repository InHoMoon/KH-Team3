<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 이름 입력창에 포커스주가
	$("input").eq(0).focus()
	
	// 이메일 입력창에 엔터키 입력 시 submit
	$("input").eq(1).keydown(function(e) {
		if( e.keyCode == 13 ) { // 엔터키
			$("#btnIdfind").click();
		}
	})
	
	// 아이디 찾기 버튼
	$("#btnIdfind").click(function() {
		
		if( $("#username").val() == "" ) {
			
			// 이름 미 입력시 아이디 찾기 버튼 클릭하면 알림문구 출력
			$("#er_name").css("display", "")
			$("#er_email").css("display", "none")
			
		} else if ( $("#useremail").val() == "" ) {
			
			// 이메일 미 입력시 아이디 찾기 버튼 클릭하면 알림문구 출력
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "")
		
		} else {
			
			$(this).parents("form").submit(); // 아이디 찾기 폼 제출
			
		}
		
	})
	
	// 취소 버튼
	$("#btnCancel").click(function() {
		$(location).attr('href', '/login') // LoginController으로 가기
	})
	
})
</script>

<h1 style="text-align: center;">아이디 찾기</h1>
<hr>

<form action="/idFind" method="post" class="form-horizontal">

	<div class="form-group">
		<label for="username" class="col-xs-2 col-xs-offset-2 control-label">이름</label>
		<div class="col-xs-4">
			<input type="text" id="username" name="username" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="useremail" class="col-xs-2 col-xs-offset-2 control-label">이메일</label>
		<div class="col-xs-4">
			<input type="text" id="useremail" name="useremail" class="form-control">
		</div>
	</div>
	
	<div class="text-center">
		<span class="error_box" id="er_name" style="display: none; color: red;">이름을 입력하세요</span>
		<span class="error_box" id="er_email" style="display: none; color: red;">이메일을 입력하세요</span>
	</div>	
	
	<div class="text-center">
		<button type="button" class="btn btn-primary" id="btnIdfind">아이디 찾기</button>
		<button type="button" class="btn btn-danger" id="btnCancel">취소</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
 