<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<!-- 필수입력항목 빈칸 : blur() -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 비밀번호 빈칸
	$("#userpw").blur(function() {
		if( $(this).val() == "" ) {
			$("#info_pw").css("display", "none")
			$("#blank_pw").css("display", "")
			
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			
			$("#ok_pw").css("display", "none")
			
		} else {
			$("#blank_pw").css("display", "none")
		}
	})

	// 비밀번호 확인 빈칸
	$("#userpwck").blur(function() {
		if( $(this).val() == "" ) {
			$("#blank_pwck").css("display", "")
			$("#er_pwsame").css("display", "none")
			$("#ok_pwck").css("display", "none")
			
		} else {
			$("#blank_pwck").css("display", "none")
		}
	})

})
</script>


<!-- 비밀번호 유효성 검사, 비밀번호 확인 : keyup() -->
<script type="text/javascript">
$(document).ready(function() {
	$("#userpw").keyup(function() {
		var pw = $("#userpw").val()
		var num = pw.search(/[0-9]/g)
		var eng = pw.search(/[a-z]/gi)
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi)

		// 공백이 존재할 경우
		if ( pw.search(/\s/) != -1 ) {			
			$("#info_pw").css("display", "none")
			$("#blank_pw").css("display", "none")

			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "")
			$("#er_pwtext").css("display", "none")
			
			$("#ok_pw").css("display", "none")
		 
		// 6자리 미만일 경우
		} else if( pw.length < 6 ) {
			$("#info_pw").css("display", "none")
			$("#blank_pw").css("display", "none")

			$("#er_pwlength").css("display", "")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			
			$("#ok_pw").css("display", "none")
			 
		// 영어+숫자+특수문자 조합이 아닐 경우
		} else if ( num < 0 || eng < 0 || spe < 0 ) {			
			$("#info_pw").css("display", "none")
			$("#blank_pw").css("display", "none")

			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "")
			
			$("#ok_pw").css("display", "none")
		
		} else {
			$("#info_pw").css("display", "none")
			$("#blank_pw").css("display", "none")

			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			
			$("#ok_pw").css("display", "")
		 }
	})
	
	// 비밀번호 == 비밀번호 확인
	$("#userpwck").keyup(function() {

		// 비밀번호 확인 불일치
		if( $("#userpw").val() != $("#userpwck").val()) {
			$("#blank_pwck").css("display", "none")
			$("#er_pwsame").css("display", "")
			$("#ok_pwck").css("display", "none")
			
		// 비밀번호 확인 일치
		} else {
			$("#blank_pwck").css("display", "none")
			$("#er_pwsame").css("display", "none")
			$("#ok_pwck").css("display", "")
		}
	})
})
</script>


<!-- button : click() -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 비밀번호 확인 입력창에 엔터키 입력 시 submit
	$("input").eq(1).keydown(function(e) {
		if( e.keyCode == 13 ) { // 엔터키
			$("#btnUpdatePw").click();
		}
	})
	
	// 비밀번호 수정 버튼
	$("#btnUpdatePw").click(function() {
		
		// 필수입력항목 빈칸
		for( i=0; i<2; i++ ) {
			
			if( $("input").eq(i).val() == "" ) {
				$(".info_box").eq(i).css("display", "none")
				$(".blank_box").eq(i).css("display", "")
				$(".er_box").eq(i).css("display", "none")
				$(".ok_box").eq(i).css("display", "none")
				
			} else {
				$(".blank_box").eq(i).css("display", "none")
			}
		}
		
		var pw = $("#userpw").val()
		var pwck = $("#userpwck").val()
		var num = pw.search(/[0-9]/g)
		var eng = pw.search(/[a-z]/gi)
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi)
		
		// 빈칸일 경우
		if( pw == "" || pwck == "" ) {
			return
			
		// 공백이 존재할 경우
		} else if ( pw.search(/\s/) != -1 ) {
			$("#info_pw").css("display", "none")
			
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "")
			$("#er_pwtext").css("display", "none")
			
			$("#blank_pw").css("display", "none")
			
			$("input").eq(0).focus()
		
		// 6자리 미만일 경우
		} else if( pw.length < 6 ) {
			$("#info_pw").css("display", "none")
			$("#blank_pw").css("display", "none")

			$("#er_pwlength").css("display", "")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			
			$("#ok_pw").css("display", "none")
			
			$("input").eq(0).focus()
			 
		// 영어+숫자+특수문자 조합이 아닐 경우
		} else if ( num < 0 || eng < 0 || spe < 0 ) {
			$("#info_pw").css("display", "none")
			
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "")
			
			$("#blank_pw").css("display", "none")
			
			$("input").eq(0).focus()
		
		// 비밀번호 확인 불일치
		} else if ( pw != pwck ) {
			$("#info_pwck").css("display", "none")
			$("#er_pwsame").css("display", "")
			$("#blank_pwck").css("display", "none")
			
			$("input").eq(1).focus()
		
		} else {
			
			$(this).parents("form").submit() // 비밀번호 수정 폼 제출
		}
		
	})
	
	// 취소 버튼
	$("#btnCancel").click(function() {
		$(location).attr('href', '/') // 메인으로 가기
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

.info_box {
	color: blue;
}

.ok_box {
	color: green;
}

.blank_box, .er_box {
	color: red;
}

.btn-updatePw {
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


<h1 style="text-align: center;">비밀번호 재설정</h1>
<hr>

<form action="/update/pw" method="post" class="form-horizontal">

<fieldset id="loginform">

<div class="col-xs-10 col-xs-offset-1">
	
	<div class="form-group">
		<label for="userpw">새 비밀번호</label>
		<input type="password" class="form-control" id="userpw" name="userpw" placeholder="PASSWORD">
		
		<span class="info_box" id="info_pw" style="display: '';">영문, 숫자, 특수문자가 모두 포함된 6자리 이상의 조합</span>

		<span class="blank_box" id="blank_pw" style="display: none;">필수 입력 사항입니다</span>
		
		<span class="er_box" id="er_pwlength" style="display: none;">6자리 이상 입력해주세요</span>
		<span class="er_box" id="er_pwblank" style="display: none;">빈칸없이 입력해주세요</span>
		<span class="er_box" id="er_pwtext" style="display: none;">영문, 숫자, 특수문자를 혼합하여 입력해주세요</span>
		
		<span class="ok_box" id="ok_pw" style="display: none;">비밀번호 입력 완료</span>
	</div>

	<div class="form-group">
		<label for="userpwck">비밀번호 확인</label>
		<input type="password" class="form-control" id="userpwck" name="userpwck" placeholder="PASSWORD CHECK">
		
		<span class="blank_box" id="blank_pwck" style="display: none;">필수 입력 사항입니다</span>
		
		<span class="er_box" id="er_pwsame" style="display: none;">비밀번호가 일치하지 않습니다</span>
		
		<span class="ok_box" id="ok_pwck" style="display: none;">비밀번호 확인 완료</span>
	</div>
	
	<div class="form-group">
		<button type="button" class="btn btn-updatePw" id="btnUpdatePw">비밀번호 수정</button>
		<button type="button" class="btn btn-cancel" id="btnCancel">취소</button>
	</div>
	
</div>

</fieldset>		

</form>
	
<%@ include file="../layout/footer.jsp" %>
