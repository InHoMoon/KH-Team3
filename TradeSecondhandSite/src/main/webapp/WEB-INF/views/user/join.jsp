<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 입력창에 포커스주가
	$("input").eq(0).focus()
	
	// 회원가입 버튼
	$("#btnJoin").click(function() {
		$(this).parents("form").submit();
	})
	
	// 취소 버튼
	$("#btnCancel").click(function() {
		$(location).attr('href', '/') // 메인으로 가기
	})
	
})
</script>


<!-- 아이디, 닉네임 중복확인 -->
<!-- 비밀번호 유효성 검사 -->
<!-- 경고문구 출력 -->
<!-- 필수입력요소 -->
<!-- 성별, 생년월일, 주소 양식 수정 필요 -->
<!-- css -->

<h1 style="text-align: center; background: lightgray;">회원가입</h1>
<hr>

<form action="/join" method="post" class="form-horizontal">

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

	<div class="form-group">
		<label for="userpwchk" class="col-xs-2 col-xs-offset-2 control-label">비밀번호 확인</label>
		<div class="col-xs-5">
			<input type="password" id="userpwchk" name="userpwchk" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="username" class="col-xs-2 col-xs-offset-2 control-label">이름</label>
		<div class="col-xs-5">
			<input type="text" id="username" name="username" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="useremail" class="col-xs-2 col-xs-offset-2 control-label">이메일</label>
		<div class="col-xs-5">
			<input type="text" id="useremail" name="useremail" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="userphone" class="col-xs-2 col-xs-offset-2 control-label">전화번호</label>
		<div class="col-xs-5">
			<input type="text" id="userphone" name="userphone" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="usergender" class="col-xs-2 col-xs-offset-2 control-label">성별</label>
		<div class="col-xs-5">
			<input type="text" id="usergender" name="usergender" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="userbirth" class="col-xs-2 col-xs-offset-2 control-label">생년월일</label>
		<div class="col-xs-5">
			<input type="text" id="userbirth" name="userbirth" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="useraddr" class="col-xs-2 col-xs-offset-2 control-label">주소</label>
		<div class="col-xs-5">
			<input type="text" id="useraddr" name="useraddr" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="usernick" class="col-xs-2 col-xs-offset-2 control-label">닉네임</label>
		<div class="col-xs-5">
			<input type="text" id="usernick" name="usernick" class="form-control">
		</div>
	</div>

	<div class="text-center">
		<button type="button" class="btn btn-primary" id="btnJoin">회원가입</button>
		<button type="button" class="btn btn-danger" id="btnCancel">취소</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
