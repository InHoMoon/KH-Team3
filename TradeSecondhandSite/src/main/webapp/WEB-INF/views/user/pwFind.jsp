<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<!-- button -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 입력창에 포커스주가
	$("input").eq(0).focus()
	
	// 이메일 입력창에 엔터키 입력 시 submit
	$("input").eq(2).keydown(function(e) {
		if( e.keyCode == 13 ) { // 엔터키
			$("#btnPwfind").click();
		}
	})
	
	// 비밀번호 찾기 버튼
	$("#btnPwfind").click(function() {
		
		if( $("#userid").val() == "" ) {
			alert("아이디를 입력하세요");
			$("input").eq(0).focus()
		
		} else if ( $("#username").val() == "" ) {
			alert("이름을 입력하세요");
			$("input").eq(1).focus()
			
		} else if ( $("#useremail").val() == "" ) {
			alert("이메일을 입력하세요");
			$("input").eq(2).focus()
		
		} else {
			$(this).parents("form").submit() // 비밀번호 찾기 폼 제출
		}
		
	})
	
	// 취소 버튼
	$("#btnCancel").click(function() {
		$(location).attr('href', '/login') // LoginController으로 가기
	})
	
})
</script>


<!-- 필수입력항목 공백시 경고문구 출력 -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 공백
	$("#userid").blur(function() {
		if( $(this).val() == "" ) {
			$("#required_id").css("display", "")
		} else {
			$("#required_id").css("display", "none")
		}
	})
	
	// 이름 공백
	$("#username").blur(function() {
		if( $(this).val() == "" ) {
			$("#required_name").css("display", "")
		} else {
			$("#required_name").css("display", "none")
		}
	})

	// 이메일 공백
	$("#useremail").blur(function() {
		if( $(this).val() == "" ) {
			$("#required_email").css("display", "")
		} else {
			$("#required_email").css("display", "none")
		}
	})
	
})
</script>

<h1 style="text-align: center;">비밀번호 찾기</h1>
<hr>

<form action="/pwFind" method="post" class="form-horizontal">

	<div class="form-group">
		<label for="userid" class="col-xs-2 col-xs-offset-2 control-label">아이디</label>
		<div class="col-xs-4">
			<input type="text" id="userid" name="userid" class="form-control">
			<span class="required_box" id="required_id" style="display: none; color: red;">필수 입력 사항입니다</span>
		</div>
	</div>

	<div class="form-group">
		<label for="username" class="col-xs-2 col-xs-offset-2 control-label">이름</label>
		<div class="col-xs-4">
			<input type="text" id="username" name="username" class="form-control">
			<span class="required_box" id="required_name" style="display: none; color: red;">필수 입력 사항입니다</span>
		</div>
	</div>

	<div class="form-group">
		<label for="useremail" class="col-xs-2 col-xs-offset-2 control-label">이메일</label>
		<div class="col-xs-4">
			<input type="email" id="useremail" name="useremail" class="form-control">
			<span class="required_box" id="required_email" style="display: none; color: red;">필수 입력 사항입니다</span>
		</div>	
	</div>
	
	<div class="text-center">
		<button type="button" class="btn btn-default" id="btnPwfind">비밀번호 찾기</button>
		<button type="button" class="btn btn-default" id="btnCancel">취소</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
 