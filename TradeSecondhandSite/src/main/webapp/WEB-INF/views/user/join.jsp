<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">

// 이메일 도메인 select
$(document).ready(function() {
	$("#email_select").change(function() {
		if( $(this).val() == "1" ) { // 직접입력의 경우
			$("#email_domain").val("")
			$("#email_domain").attr("disabled", false)
		} else { // 선택입력의 경우
			$("#email_domain").val( $(this).val() )
			$("#email_domain").attr("disabled", true)
		}
	})
})

// 전화번호 select
$(document).ready(function() {
	$("#phone_select").change(function() {
		if( $(this).val() == "1" ) { // 직접입력의 경우
			$("#phone1").val("")
			$("#phone1").attr("disabled", false)
		} else { // 선택입력의 경우
			$("#phone1").val( $(this).val() )
			$("#phone1").attr("disabled", true)			
		}
	})
})

</script>

<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 입력창에 포커스주가
	$("input").eq(0).focus()
	
	// 회원가입 버튼
	$("#btnJoin").click(function() {
		
		if( $("#userid").val() == "" ) {
			
			// 아이디 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "")
			$("#er_pw").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "none")
			
			$("input").eq(0).focus()
			
		} else if ( $("#userpw").val() == "" ) {
			
			// 비밀번호 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "none")
			
			$("input").eq(1).focus()
		
		} else if ( $("#username").val() == "" ) {
		
			// 이름 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_name").css("display", "")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "none")
		
			$("input").eq(3).focus()
			
		} else if ( $("#email_id").val() == "" || $("#email_domain").val() == "" ) {
		
			// 이메일 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "")
			$("#er_phone").css("display", "none")
		
		} else if ( $("#phone1").val() == "" || $("#phone2").val() == "" || $("#phone3").val() == "" ) {
		
			// 전화번호 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "")
		
		} else {
			
			$("#email_domain").removeAttr("disabled") // select disabled 삭제
			$("#phone1").removeAttr("disabled") // select disabled 삭제
			
			$(this).parents("form").submit() // 회원가입 폼 제출
			
		}
		
	})
	
	// 취소 버튼
	$("#btnCancel").click(function() {
		$(location).attr('href', '/') // 메인으로 가기
	})
	
})
</script>

<script type="text/javascript">

// 비밀번호 유효성 검사 --- 수정 필요
$(document).ready(function() {
	
	if( $("#userid").val() == "" )
	
}


</script>



<!-- 아이디, 닉네임 중복확인 -->
<!-- 비밀번호 유효성 검사 -->
<!-- 경고문구 출력 -->
<!-- 필수입력요소 -->
<!-- 주소 양식 수정 필요 -->
<!-- css -->

<h1 style="text-align: center;">회원가입</h1>
<hr>

<form action="/join" method="post" class="form-horizontal">

	<div class="form-group">
		<label for="userid" class="col-xs-2 col-xs-offset-2 control-label">아이디</label>
		<div class="col-xs-4">
			<input type="text" id="userid" name="userid" class="form-control">
			<span class="error_box" id="er_id" style="display: none; color: red;">아이디를 입력하세요</span>
		</div>
		<button type="button" class="btn btn-default" id="btnIdcheck">중복확인</button>
	</div>

	<div class="form-group">
		<label for="userpw" class="col-xs-2 col-xs-offset-2 control-label">비밀번호</label>
		<div class="col-xs-4">
			<input type="password" id="userpw" name="userpw" class="form-control">
			
			<span class="info_box" id="pw_info" style="display: ; color: blue;">영문, 숫자, 특수문자가 모두 포함된 8자리</span>
			<span class="error_box" id="er_pw" style="display: none; color: red;">비밀번호를 입력하세요</span>
		</div>
	</div>

	<div class="form-group">
		<label for="userpwchk" class="col-xs-2 col-xs-offset-2 control-label">비밀번호 확인</label>
		<div class="col-xs-4">
			<input type="password" id="userpwchk" name="userpwchk" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="username" class="col-xs-2 col-xs-offset-2 control-label">이름</label>
		<span class="error_box" id="er_name" style="display: none; color: red;">이름을 입력하세요</span>
		<div class="col-xs-4">
			<input type="text" id="username" name="username" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="email_id" class="col-xs-2 col-xs-offset-2 control-label">이메일</label>
		<div class="col-xs-2">
			<input type="text" id="email_id" name="email_id" class="form-control">
			<span class="error_box" id="er_email" style="display: none; color: red;">이메일을 입력하세요</span>
		</div>	
		<div class="col-xs-2">
			<input type="text" id="email_domain" name="email_domain" class="form-control" disabled>
		</div>
		<div class="col-xs-2">
			<select class="form-control" id="email_select" name="email_select">
			    <option value="">선택하세요</option>
			    <option value="naver.com">naver.com</option>
			    <option value="gmail.com">gmail.com</option>
			    <option value="hanmail.com">hanmail.com</option>
			    <option value="nate.com">nate.com</option>
			    <option value="1">직접입력</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label for="phone1" class="col-xs-2 col-xs-offset-2 control-label">전화번호</label>
			
		<div class="col-xs-1">
			<select class="form-control" id="phone_select" name="phone_select">
			    <option value="">선택하세요</option>
			    <option value="010">010</option>
			    <option value="011">011</option>
			    <option value="016">016</option>
			    <option value="017">017</option>
			    <option value="019">019</option>
			    <option value="1">직접입력</option>
			</select>
		</div>

		<div class="col-xs-1">
			<input type="text" id="phone1" name="phone1" class="form-control" maxlength="3" disabled>
		</div>
		<div class="col-xs-1">
			<input type="text" id="phone2" name="phone2" class="form-control" maxlength="4" >
		</div>
		<div class="col-xs-1">
			<input type="text" id="phone3" name="phone3" class="form-control" maxlength="4" >
		</div>

		<div class="clearfix"></div>

		<div class="text-center">
			<span class="error_box" id="er_phone" style="display: none; color: red;">전화번호를 입력하세요</span>
		</div>
	</div>

	<div class="form-group">
		<label for="usergender" class="col-xs-2 col-xs-offset-2 control-label">성별</label>
		<div class="col-xs-4">
			<select class="form-control" id="usergender" name="usergender">
			    <option value="M">남성</option>
			    <option value="F">여성</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label for="year" class="col-xs-2 col-xs-offset-2 control-label">생년월일</label>
		<div class="col-xs-2">
			<input type="text" id="year" name="year" class="form-control" maxlength="4" placeholder="년(4자)">
		</div>
		<div class="col-xs-1">
			<select class="form-control" id="month" name="month">
			    <option value="">선택하세요</option>
			    <option value="01">01</option>
			    <option value="02">02</option>
			    <option value="03">03</option>
			    <option value="04">04</option>
			    <option value="05">05</option>
			    <option value="06">06</option>
			    <option value="07">07</option>
			    <option value="08">08</option>
			    <option value="09">09</option>
			    <option value="10">10</option>
			    <option value="11">11</option>
			    <option value="12">12</option>
			</select>
		</div>
		<div class="col-xs-1">
			<input type="text" id="day" name="day" class="form-control" maxlength="2" placeholder="일">
		</div>
	</div>







	<!-- 주소 검색.... 구현 필요 -->
	<div class="form-group">
		<label for="useraddr" class="col-xs-2 col-xs-offset-2 control-label">주소</label>
		<div class="col-xs-4">
			<input type="text" id="useraddr" name="useraddr" class="form-control">
		</div>
	</div>

	<!-- 중복확인 구현 필요 -->
	<div class="form-group">
		<label for="usernick" class="col-xs-2 col-xs-offset-2 control-label">닉네임</label>
		<div class="col-xs-4">
			<input type="text" id="usernick" name="usernick" class="form-control">
		</div>
	</div>
	
	<!-- 프로필 사진 구현 필요 -->
	
	






	<div class="text-center">
		<button type="button" class="btn btn-primary" id="btnJoin">회원가입</button>
		<button type="button" class="btn btn-danger" id="btnCancel">취소</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
