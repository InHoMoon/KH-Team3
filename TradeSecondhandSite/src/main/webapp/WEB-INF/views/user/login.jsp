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
		
		if( $("#userid").val() == "" ) {
			
			// 아이디 미 입력시 로그인버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "")
			$("#er_pw").css("display", "none")
			
		} else if ( $("#userpw").val() == "" ) {
			
			// 비밀번호 미 입력시 로그인버튼 클릭하면 알림문구 출력
			$("#er_id").css("display", "none")
			$("#er_pw").css("display", "")
		
		} else {
			
			$(this).parents("form").submit(); // 로그인 폼 제출
			
		}
		
	})
	
	// 아이디 찾기 버튼
	$("#btnIdfind").click(function() {
		$(location).attr('href', '/idFind') // IdFindController으로 가기
	})
	
	// 비밀번호 찾기 버튼
	$("#btnPwfind").click(function() {
		$(location).attr('href', '/pwFind') // PwFindController으로 가기		
	})
	
	// 회원가입 버튼
	$("#btnJoin").click(function() {
		$(location).attr('href', '/join') // JoinController로 가기
	})
	
})
</script>

<script type="text/javascript">
$(document).ready(function() {
	
	// 저장된 쿠키값을 가져와서 id칸에 넣어준다. 없으면 공백으로 들어감.
	var key = getCookie("key")
	$("#userid").val(key)
	
	// 그 전에 id를 저장해서 처음 페이지 로딩 시, 입력 칸에 저장된 id가 표시된 상태라면,
	if( $("#userid").val() != "" ) {
		$("#saveid").attr("checked", true) // id 저장하기를 체크 상태로 두기
	}
	
	$("#saveid").change(function() { // 체크박스에 변화가 있다면,
		if( $("#saveid").is(":checked") ) { // id 저장하기 체크했을 때,
			setCookie("key", $("#userid").val(), 7) // 7일 동안 쿠키 보관
		} else { // id 저장하기 체크 해제 시,
			deleteCookie("key")
		}
	})
	
	// id 저장하기를 체크한 상태에서 id를 입력하는 경우, 이럴 때도 쿠키 저장
	$("#userid").keyup(function() { // id입력칸에 id를 입력할 때,
		if( $("#saveid").is(":checked") ) { // id 저장하기 체크한 상태라면
			setCookie("key", $("#userid").val(), 7) // 7일 동안 쿠키 보관
		}
	})
	
})

// 쿠키 저장하기 
// setCookie => saveid함수에서 넘겨준 시간이 현재시간과 비교해서 쿠키를 생성하고 지워주는 역할
function setCookie(cookieName, value, exdays) {
	var exdate = new Date()
	exdate.setDate(exdate.getDate() + exdays)
	var cookieValue = escape(value)
			+ ((exdays == null) ? "" : "; expires=" + exdate.toGMTString())
	document.cookie = cookieName + "=" + cookieValue
}

// 쿠키 삭제
function deleteCookie(cookieName) {
	var expireDate = new Date()
	expireDate.setDate(expireDate.getDate() - 1)
	document.cookie = cookieName + "= " + "; expires="
			+ expireDate.toGMTString()
}
    
// 쿠키 가져오기
function getCookie(cookieName) {
	cookieName = cookieName + '='
	var cookieData = document.cookie
	var start = cookieData.indexOf(cookieName)
	var cookieValue = ''
	if (start != -1) { // 쿠키가 존재하면
		start += cookieName.length
		var end = cookieData.indexOf(';', start)
		if (end == -1) // 쿠키 값의 마지막 위치 인덱스 번호 설정 
			end = cookieData.length
               console.log("end위치  : " + end)
		cookieValue = cookieData.substring(start, end)
	}
	return unescape(cookieValue)
}
</script>

<h1 style="text-align: center;">로그인</h1>
<hr>

<form action="/login" method="post" class="form-horizontal">

	<div class="form-group">
		<label for="userid" class="col-xs-2 col-xs-offset-3 control-label">아이디</label>
		<div class="col-xs-3">
			<input type="text" id="userid" name="userid" class="form-control">
		</div>
	</div>

	<div class="form-group">
		<label for="userpw" class="col-xs-2 col-xs-offset-3 control-label">비밀번호</label>
		<div class="col-xs-3">
			<input type="password" id="userpw" name="userpw" class="form-control">
		</div>
	</div>
	
	<div class="text-center">
		<input type="checkbox" id="saveid" name="saveid"><label for="saveid">아이디 저장</label>
		<input type="checkbox" id="autologin" name="autologin"><label for="autologin">자동로그인</label>
	</div>

	<div class="clearfix"></div>
	
	<div class="text-center">
		<span class="error_box" id="er_id" style="display: none; color: red;">아이디를 입력하세요</span>
		<span class="error_box" id="er_pw" style="display: none; color: red;">비밀번호를 입력하세요</span>
	</div>	
		
	<div class="clearfix"></div>

	<div class="text-center">
		<button type="button" class="btn btn-default btn-lg col-xs-4 col-xs-offset-4" id="btnLogin">로그인</button>
	</div>
	
	<div class="clearfix"></div>

	<div class="text-center">
		<button type="button" class="btn btn-default" id="btnIdfind">아이디 찾기</button>
		<button type="button" class="btn btn-default" id="btnPwfind">비밀번호 찾기</button>
		<button type="button" class="btn btn-default" id="btnJoin">회원가입</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
 