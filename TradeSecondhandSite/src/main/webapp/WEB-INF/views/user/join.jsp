<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
// 숫자만 입력 가능
$(document).ready(function(){
	$("input:text[numberOnly]").keyup(function() {
		$(this).val( $(this).val().replace(/[^0-9]/g,"") )
	})
});

// 영어+숫자만 입력 가능 
$(document).ready(function() {
	$("input:text[engnum]").keyup(function() {
		$(this).val( $(this).val().replace(/[^a-z0-9_.]/gi,"") )
	})
})

// 영어+한글만 입력 가능 
$(document).ready(function() {
	$("input:text[engkor]").keyup(function() {
		$(this).val( $(this).val().replace(/[^ㄱ-힣a-z]/gi,"") )
	})
})

// 영어+숫자+특수문자만 입력 가능 
$(document).ready(function() {
	$("input:text[engkor]").keyup(function() {
		$(this).val( $(this).val().replace(/[^ㄱ-힣a-z]/gi,"") )
	})
})

</script>

<script type="text/javascript">
// 비밀번호 유효성 검사
$(document).ready(function() {
	$("#userpw").keyup(function() {
		
		 var pw = $("#userpw").val()
		 var num = pw.search(/[0-9]/g)
		 var eng = pw.search(/[a-z]/gi)
		 var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi)
		 
		 if( pw.length < 6 ) {
			 
			// 6자리 미만일 경우 알림문구 출력
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			
		 } else if ( pw.search(/\s/) != -1 ) {
			 
			// 공백이 존재할 경우 알림문구 출력
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "")
			$("#er_pwtext").css("display", "none")
			 
		 } else if ( num < 0 || eng < 0 || spe < 0 ) {
			 
			// 영어+숫자+특수문자 조합이 아닐 경우 알림문구 출력
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "")
			 
		 } else {
			 
			$("#info_pw").css("display", "none")
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			 
		 }
		
	})
	
	// 비밀번호 == 비밀번호 확인 검사
	$("#userpwck").keyup(function() {
		if( $("#userpw").val() != $("#userpwck").val()) {
			
			// 비밀번호 확인 불일치시 알림문구 출력
			$("#er_pwsame").css("display", "")
			$("#ok_pwck").css("display", "none")
			
		} else {
			
			// 비밀번호 확인 일치시 알림문구 출력
			$("#er_pwsame").css("display", "none")
			$("#ok_pwck").css("display", "")
			
		}
	})
})
</script>

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

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<script type="text/javascript">
// 카카오 우편번호 검색
function DaumPostcode() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수
            var extraAddr = ''; // 참고항목 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
            	// 법정동명이 있을 경우 추가한다. (법정리는 제외)
                // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraAddr += data.bname;
                }
                // 건물명이 있고, 공동주택일 경우 추가한다.
                if(data.buildingName !== '' && data.apartment === 'Y'){
                    extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                if(extraAddr !== ''){
                    extraAddr = ' (' + extraAddr + ')';
                }
                
                addr = data.roadAddress + extraAddr;
                
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }


            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.getElementById('addrnum').value = data.zonecode;
            document.getElementById("addr").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("detailAddr").focus();
        }
    }).open();
}
</script>







<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 입력창에 포커스주기
	$("input").eq(0).focus()
	
	// 회원가입 버튼
	$("#btnJoin").click(function() {
		
		if( $("#userid").val() == "" ) {
			
			// 아이디 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "")
			$("#er_pw").css("display", "none")
			$("#er_pwck").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "none")
			
			$("input").eq(0).focus()
			
		} else if ( $("#userpw").val() == "" ) {
			
			// 비밀번호 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "")
			$("#er_pwck").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "none")
			
			$("input").eq(1).focus()

		} else if ( $("#userpwck").val() == "" ) {
			
			// 비밀번호 확인 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_pwck").css("display", "")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "none")
			
			$("input").eq(2).focus()
		
		} else if ( $("#username").val() == "" ) {
		
			// 이름 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_pwck").css("display", "none")
			$("#er_name").css("display", "")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "none")
		
			$("input").eq(3).focus()
			
		} else if ( $("#email_id").val() == "" ) {
		
			// 이메일(email_id) 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_pwck").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "")
			$("#er_phone").css("display", "none")
			
			$("input").eq(4).focus()
		
		} else if ( $("#email_domain").val() == "" ) {
		
			// 이메일(email_domain) 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_pwck").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "")
			$("#er_phone").css("display", "none")
			
			$("select").eq(0).focus()
		
		} else if ( $("#phone1").val() == "" ) {
		
			// 전화번호(phone1) 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_pwck").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "")
		
			$("select").eq(1).focus()
			
		} else if ( $("#phone2").val() == "" ) {
		
			// 전화번호(phone2) 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_pwck").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "")
		
			$("input").eq(7).focus()
			
		} else if ( $("#phone3").val() == "" ) {
		
			// 전화번호(phone3) 미 입력시 회원가입 버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "none")
			$("#er_pwck").css("display", "none")
			$("#er_name").css("display", "none")
			$("#er_email").css("display", "none")
			$("#er_phone").css("display", "")
		
			$("input").eq(8).focus()
			
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

<!-- 아이디, 닉네임 중복확인 -->
<!-- 프로필 사진 등록 -->
<!-- css -->

<h1 style="text-align: center;">회원가입</h1>
<hr>

<form action="/join" method="post" class="form-horizontal">

	<!-- 중복확인 구현 필요 -->
	<div class="form-group">
		<label for="userid" class="col-xs-2 col-xs-offset-2 control-label">아이디</label>
		<div class="col-xs-4">
			<input type="text" id="userid" name="userid" class="form-control" engnum>
			
			<span class="error_box" id="er_id" style="display: none; color: red;">아이디를 입력하세요</span>
		</div>
		<div class="col-xs-2">
			<button type="button" class="btn btn-default" id="btnId">중복확인</button>
		</div>
	</div>

	<div class="form-group">
		<label for="userpw" class="col-xs-2 col-xs-offset-2 control-label">비밀번호</label>
		<div class="col-xs-4">
			<input type="password" id="userpw" name="userpw" class="form-control">
			
			<span class="info_box" id="info_pw" style="display: ''; color: blue;">영문, 숫자, 특수문자가 모두 포함된 6자리 이상</span>
			<span class="error_box" id="er_pwlength" style="display: none; color: red;">6자리 이상 입력해주세요</span>
			<span class="error_box" id="er_pwblank" style="display: none; color: red;">빈칸없이 입력해주세요</span>
			<span class="error_box" id="er_pwtext" style="display: none; color: red;">영문, 숫자, 특수문자를 혼합하여 입력해주세요</span>
		</div>
	</div>

	<div class="form-group">
		<label for="userpwchk" class="col-xs-2 col-xs-offset-2 control-label">비밀번호 확인</label>
		<div class="col-xs-4">
			<input type="password" id="userpwck" name="userpwck" class="form-control">
			
			<span class="error_box" id="er_pwck" style="display: none; color: red;">비밀번호 확인을 입력하세요</span>
			<span class="error_box" id="er_pwsame" style="display: none; color: red;">비밀번호가 일치하지 않습니다</span>
			<span class="info_box" id="ok_pwck" style="display: none; color: green;">비밀번호 확인 완료</span>
		</div>
	</div>

	<div class="form-group">
		<label for="username" class="col-xs-2 col-xs-offset-2 control-label">이름</label>
		<span class="error_box" id="er_name" style="display: none; color: red;">이름을 입력하세요</span>
		<div class="col-xs-4">
			<input type="text" id="username" name="username" class="form-control" engkor>
		</div>
	</div>

	<div class="form-group">
		<label for="email_id" class="col-xs-2 col-xs-offset-2 control-label">이메일</label>
		<div class="col-xs-2">
			<input type="text" id="email_id" name="email_id" class="form-control" engnum>
			<span class="error_box" id="er_email" style="display: none; color: red;">이메일을 입력하세요</span>
		</div>	
		<div class="col-xs-2">
			<input type="text" id="email_domain" name="email_domain" class="form-control" engnum disabled>
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
			<input type="text" id="phone1" name="phone1" class="form-control" maxlength="3" numberOnly disabled>
		</div>
		<div class="col-xs-1">
			<input type="text" id="phone2" name="phone2" class="form-control" maxlength="4" numberOnly>
		</div>
		<div class="col-xs-1">
			<input type="text" id="phone3" name="phone3" class="form-control" maxlength="4" numberOnly>
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
			    <option value="">선택하세요</option>
			    <option value="M">남성</option>
			    <option value="F">여성</option>
			</select>
		</div>
	</div>

	<div class="form-group">
		<label for="year" class="col-xs-2 col-xs-offset-2 control-label">생년월일</label>
		<div class="col-xs-2">
			<input type="text" id="year" name="year" class="form-control" maxlength="4" placeholder="년(4자)" numberOnly>
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
			<input type="text" id="day" name="day" class="form-control" maxlength="2" placeholder="일" numberOnly>
		</div>
	</div>

	<div class="form-group">
		<label for="addrnum" class="col-xs-2 col-xs-offset-2 control-label">주소</label>
		<div class="col-xs-4">
			<input type="text" id="addrnum" name="addrnum" class="form-control" placeholder="우편번호">
		</div>
		<div class="col-xs-4">
			<input type="button" class="btn btn-default" onclick="DaumPostcode()" value="우편번호 찾기">
		</div>
		<div class="clearfix"></div>
		<div class="col-xs-4 col-xs-offset-4">
			<input type="text" id="addr" name="addr" class="form-control" placeholder="주소">
		</div>
		<div class="clearfix"></div>
		<div class="col-xs-4 col-xs-offset-4">
			<input type="text" id="detailAddr" name="detailAddr" class="form-control" placeholder="상세주소">
		</div>
	</div>

	<!-- 중복확인 구현 필요 -->
	<div class="form-group">
		<label for="usernick" class="col-xs-2 col-xs-offset-2 control-label">닉네임</label>
		<div class="col-xs-4">
			<input type="text" id="usernick" name="usernick" class="form-control">
		</div>
		<div class="col-xs-2">
			<button type="button" class="btn btn-default" id="btnNick">중복확인</button>
		</div>
	</div>
	
	<!-- 프로필 사진 구현 필요 -->
	
	






	<div class="text-center">
		<button type="button" class="btn btn-primary" id="btnJoin">회원가입</button>
		<button type="button" class="btn btn-danger" id="btnCancel">취소</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
