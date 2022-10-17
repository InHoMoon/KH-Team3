<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 입력창에 포커스주가
	$("input").eq(0).focus()
	
	// 이메일 입력창에 엔터키 입력 시 submit
	$("input").eq(2).keydown(function(e) {
		if( e.keyCode == 13 ) { // 엔터키
			$("#btnFindPw").click();
		}
	})
	
	// 비밀번호 찾기 버튼
	$("#btnFindPw").click(function() {
		
		if( $("#userid").val() == "" ) {
			$("#blank_id").css("display", "")
			$("#blank_name").css("display", "none")
			$("#blank_email").css("display", "none")
			
			$("input").eq(0).focus()
		
		} else if ( $("#username").val() == "" ) {
			$("#blank_id").css("display", "none")
			$("#blank_name").css("display", "")
			$("#blank_email").css("display", "none")
			
			$("input").eq(1).focus()
			
		} else if ( $("#useremail").val() == "" ) {
			$("#blank_id").css("display", "none")
			$("#blank_name").css("display", "none")
			$("#blank_email").css("display", "")
			
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


<style type="text/css">
#loginform {
	width: 500px;
	
	margin: 0 auto;
	padding: 30px;
	
	border:1px solid #104138;
	border-radius: 10px;
	
	background: whitesmoke;
}

.blank_box {
	color: red;
}

.btn-findPw {
	background-color: #fad703;  
	color: #104138;
	
	display: inline-block;
	float: left;
}

.btn-cancel {
	background-color: salmon;  
	color: #104138;

	display: inline-block;
	float: right;
}
</style>


<h1 style="text-align: center;">비밀번호 찾기</h1>
<hr>

<form action="/find/pw" method="post" class="form-horizontal">

<fieldset id="loginform">

<div class="col-xs-10 col-xs-offset-1">
	
	<div class="form-group">
		<label for="userid">아이디</label>
		<input type="text" class="form-control" id="userid" name="userid" placeholder="ID">
	</div>
	
	<div class="form-group">
		<label for="username">이름</label>
		<input type="text" class="form-control" id="username" name="username" placeholder="NAME">
	</div>
	
	<div class="form-group">
		<label for="useremail">이메일</label>
		<input type="email" class="form-control" id="useremail" name="useremail" placeholder="ex) email@gmail.com">
	</div>
	
	<div class="form-group">		
		<span class="blank_box" id="blank_id" style="display: none;">아이디를 입력하세요</span>
		<span class="blank_box" id="blank_name" style="display: none;">이름을 입력하세요</span>
		<span class="blank_box" id="blank_email" style="display: none;">이메일을 입력하세요</span>
	</div>

	<div class="form-group">
		<button type="button" class="btn btn-findPw" id="btnFindPw">비밀번호 찾기</button>
		<button type="button" class="btn btn-cancel" id="btnCancel">취소</button>
	</div>
	
</div>

</fieldset>		

</form>

<%@ include file="../layout/footer.jsp" %>
 