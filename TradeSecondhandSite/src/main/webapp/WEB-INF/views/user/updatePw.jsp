<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 비밀번호 공백
	$("#userpw").blur(function() {
		if( $(this).val() == "" ) {
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			$("#required_pw").css("display", "")
		} else {
			$("#required_pw").css("display", "none")
		}
	})

	// 비밀번호 확인 공백
	$("#userpwck").blur(function() {
		if( $(this).val() == "" ) {
			$("#er_pwsame").css("display", "none")
			$("#ok_pwck").css("display", "none")
			$("#required_pwck").css("display", "")
		} else {
			$("#required_pwck").css("display", "none")
		}
	})

})
</script>

<!-- 필수입력항목 공백시 경고문구 출력 -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 비밀번호 공백
	$("#userpw").blur(function() {
		if( $(this).val() == "" ) {
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			$("#required_pw").css("display", "")
		} else {
			$("#required_pw").css("display", "none")
		}
	})

	// 비밀번호 확인 공백
	$("#userpwck").blur(function() {
		if( $(this).val() == "" ) {
			$("#er_pwsame").css("display", "none")
			$("#ok_pwck").css("display", "none")
			$("#required_pwck").css("display", "")
		} else {
			$("#required_pwck").css("display", "none")
		}
	})

})
</script>


<!-- 지정 문자 입력 기능 -->
<script type="text/javascript">

// 숫자만 입력 가능
$(document).ready(function(){
	$("input:text[numberOnly]").keyup(function() {
		$(this).val( $(this).val().replace(/[^0-9]/g,"") )
	})
});

// 영어+숫자 입력 가능 
$(document).ready(function() {
	$("input:text[engnum]").keyup(function() {
		$(this).val( $(this).val().replace(/[^a-z0-9_.]/gi,"") )
	})
})

// 영어+한글 입력 가능 
$(document).ready(function() {
	$("input:text[engkor]").keyup(function() {
		$(this).val( $(this).val().replace(/[^ㄱ-힣a-z]/gi,"") )
	})
})

// 영어+숫자+특수문자 입력 가능 --- 수정 필요
$(document).ready(function() {
	$("input:text[engkor]").keyup(function() {
		$(this).val( $(this).val().replace(/[^ㄱ-힣a-z]/gi,"") )
	})
})

</script>


<!-- 비밀번호 유효성 검사, 비밀번호 확인 -->
<script type="text/javascript">
$(document).ready(function() {
	$("#userpw").keyup(function() {
		 var pw = $("#userpw").val()
		 var num = pw.search(/[0-9]/g)
		 var eng = pw.search(/[a-z]/gi)
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi)
		 
		// 6자리 미만일 경우
		 if( pw.length < 6 ) {
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			$("#required_pw").css("display", "none")
			
		// 공백이 존재할 경우
		 } else if ( pw.search(/\s/) != -1 ) {
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "")
			$("#er_pwtext").css("display", "none")
			$("#required_pw").css("display", "none")
			 
		// 영어+숫자+특수문자 조합이 아닐 경우
		 } else if ( num < 0 || eng < 0 || spe < 0 ) {
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "")
			$("#required_pw").css("display", "none")
			 
		 } else {
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			$("#required_pw").css("display", "none")
		 }
	})
	
	// 비밀번호 == 비밀번호 확인
	$("#userpwck").keyup(function() {

		// 비밀번호 확인 불일치
		if( $("#userpw").val() != $("#userpwck").val()) {
			$("#er_pwsame").css("display", "")
			$("#ok_pwck").css("display", "none")
			$("#required_pwck").css("display", "none")
			
		// 비밀번호 확인 일치
		} else {
			$("#er_pwsame").css("display", "none")
			$("#ok_pwck").css("display", "")
			$("#required_pwck").css("display", "none")
		}
	})
})
</script>


<!-- button -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 새비밀번호 입력창에 포커스주기
	$("input").eq(0).focus()
	
	// 비밀번호 확인 입력창에 엔터키 입력 시 submit
	$("input").eq(1).keydown(function(e) {
		if( e.keyCode == 13 ) { // 엔터키
			$("#btnUpdate").click();
		}
	})
	
	// 비밀번호 수정 버튼
	$("#btnUpdate").click(function() {
		
		if ( $("#userpw").val() == "" ) {
			alert("비밀번호를 입력하세요");
			$("input").eq(0).focus()

		} else if ( $("#userpwck").val() == "" ) {
			alert("비밀번호를 확인하세요");
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

<h1 style="text-align: center;">비밀번호 재설정</h1>
<hr>

<form action="/pw/update" method="post" class="form-horizontal">

	<div class="form-group">
		<label for="userpw" class="col-xs-2 col-xs-offset-2 control-label">새 비밀번호</label>
		<div class="col-xs-4">
			<input type="password" id="userpw" name="userpw" class="form-control">
			
			<span class="info_box" id="info_pw" style="display: ''; color: blue;">영문, 숫자, 특수문자가 모두 포함된 6자리 이상의 조합</span>
			
			<span class="error_box" id="er_pwlength" style="display: none; color: red;">6자리 이상 입력해주세요</span>
			<span class="error_box" id="er_pwblank" style="display: none; color: red;">빈칸없이 입력해주세요</span>
			<span class="error_box" id="er_pwtext" style="display: none; color: red;">영문, 숫자, 특수문자를 혼합하여 입력해주세요</span>
			
			<span class="required_box" id="required_pw" style="display: none; color: red;">필수 입력 사항입니다</span>
		</div>
	</div>

	<div class="form-group">
		<label for="userpwck" class="col-xs-2 col-xs-offset-2 control-label">비밀번호 확인</label>
		<div class="col-xs-4">
			<input type="password" id="userpwck" name="userpwck" class="form-control">
			
			<span class="error_box" id="er_pwsame" style="display: none; color: red;">비밀번호가 일치하지 않습니다</span>
			<span class="info_box" id="ok_pwck" style="display: none; color: green;">비밀번호 확인 완료</span>
			
			<span class="required_box" id="required_pwck" style="display: none; color: red;">필수 입력 사항입니다</span>
		</div>
	</div>

	<div class="text-center">
		<button type="button" class="btn btn-default" id="btnUpdate">비밀번호 수정</button>
		<button type="button" class="btn btn-default" id="btnCancel">취소</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
