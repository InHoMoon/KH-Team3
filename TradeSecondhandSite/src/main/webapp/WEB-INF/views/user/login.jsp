<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 입력창에 포커스주기
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
			$("#blank_id").css("display", "")
			$("#blank_pw").css("display", "none")
			
			$("input").eq(0).focus()
			
		} else if ( $("#userpw").val() == "" ) {
			$("#blank_id").css("display", "none")
			$("#blank_pw").css("display", "")
			
			$("input").eq(1).focus()
		
		} else {
			$(this).parents("form").submit(); // 로그인 폼 제출
		}
		
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

.btn-login {
	background-color: #fad703;
	color: #104138;
}

.btn-sign {
	background-color: #104138;  
	color: #fad703;
}

#findId, #findPw, #join  {
	font-size: 14px;
	color: #104138;
	display: inline-block;
}

#contour {
	padding: 10px;
	font-size: 14px;
	display: inline-block;
}
</style>


<h1 style="text-align: center;">로그인</h1>
<hr>

<form action="/login" method="post" class="form-horizontal">

<fieldset id="loginform">

<div class="col-xs-10 col-xs-offset-1">
	
	<div class="form-group">
		<label for="userid">아이디</label>
		<input type="text" class="form-control" id="userid" name="userid" placeholder="ID">
	</div>
	
	<div class="form-group">
		<label for="userpw">비밀번호</label>
		<input type="password" class="form-control" id="userpw" name="userpw" placeholder="PASSWORD">
	</div>

	<div class="form-group">	
		<div class="form-check">
			<input type="checkbox" class="form-check-input" id="saveid" name="saveid">
			<label class="form-check-label" for="saveid">아이디 저장</label>
		</div>
	</div>
	
	<div class="form-group">
		<span class="blank_box" id="blank_id" style="display: none;">아이디를 입력하세요</span>
		<span class="blank_box" id="blank_pw" style="display: none;">비밀번호를 입력하세요</span>
	</div>
	
	<div class="form-group">
		<button type="button" class="btn btn-login btn-lg btn-block" id="btnLogin">로그인</button>
	</div>
	
</div>

</fieldset>

<br>

<div class="text-center">
	<a href="/find/id" class="link" id="findId">아이디 찾기</a>
	<p id="contour"> | </p>
	<a href="/find/pw" class="link" id="findPw">비밀번호 찾기</a>
	<p id="contour"> | </p>
	<a href="/join" class="link" id="join">회원가입</a>
</div>

</form>

<!-- 아이디 저장 쿠키 -->
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


<%@ include file="../layout/footer.jsp" %>
 