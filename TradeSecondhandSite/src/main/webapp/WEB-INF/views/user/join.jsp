<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<!-- 필수입력항목 빈칸 : blur() -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 빈칸
	$("#userid").blur(function() {
		if( $(this).val() == "" ) {
			$("#er_idck").css("display", "")
			$("#er_id").css("display", "none")
			$("#ok_id").css("display", "none")
			
		} else {
			$("#er_idck").css("display", "none")
		}
	})
	
	// 비밀번호 빈칸
	$("#userpw").blur(function() {
		if( $(this).val() == "" ) {
			$("#info_pw").css("display", "none")
			
			$("#er_pwlength").css("display", "")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			
			$("#ok_pw").css("display", "none")
			
		} else {
			$("#er_pwlength").css("display", "none")
		}
	})

	// 비밀번호 확인 빈칸
	$("#userpwck").blur(function() {
		if( $(this).val() == "" ) {
			$("#er_pwsame").css("display", "")
			$("#ok_pwck").css("display", "none")
			
		} else {
			$("#er_pwsame").css("display", "none")
		}
	})
	
	// 이름 빈칸
	$("#username").blur(function() {
		if( $(this).val() == "" ) {
			$("#blank_name").css("display", "")
		} else {
			$("#blank_name").css("display", "none")
		}
	})

	// 이메일 빈칸
	$("#useremail").blur(function() {
		if( $(this).val() == "" ) {
			$("#blank_email").css("display", "")
		} else {
			$("#blank_email").css("display", "none")
		}
	})

	// 전화번호 빈칸
	$("#userphone").blur(function() {
		if( $(this).val() == "" ) {
			$("#blank_phone").css("display", "")
		} else {
			$("#blank_phone").css("display", "none")
		}
	})

	// 주소 빈칸
	$("#useraddr1").blur(function() {
		if( $("#useraddr1").val() == "" || $("#useraddr2").val() == "" ) {
			$("#blank_addr").css("display", "")
		} else {
			$("#blank_addr").css("display", "none")
		}
	})

	$("#useraddr2").blur(function() {
		if( $("#useraddr1").val() == "" || $("#useraddr2").val() == "" ) {
			$("#blank_addr").css("display", "")
			
		} else {
			$("#blank_addr").css("display", "none")
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
})

</script>


<!-- 비밀번호 유효성 검사, 비밀번호 확인 : keyup() -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#userpw").keyup(function() {
		
		var pw = $("#userpw").val()
		var pwck = $("#userpwck").val()
		var num = pw.search(/[0-9]/g)
		var eng = pw.search(/[a-z]/gi)
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi)

		// 6자리 미만일 경우
		if( pw.length < 6 ) {
			$("#info_pw").css("display", "none")

			$("#er_pwlength").css("display", "")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			
			$("#ok_pw").css("display", "none")
			
		// 공백이 존재할 경우
		} else if ( pw.search(/\s/) != -1 ) {			
			$("#info_pw").css("display", "none")

			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "")
			$("#er_pwtext").css("display", "none")
			
			$("#ok_pw").css("display", "none")
			 
		// 영어+숫자+특수문자 조합이 아닐 경우
		} else if ( num < 0 || eng < 0 || spe < 0 ) {			
			$("#info_pw").css("display", "none")

			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "")
			
			$("#ok_pw").css("display", "none")
		
		} else {
			$("#info_pw").css("display", "none")

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
			$("#er_pwsame").css("display", "")
			$("#ok_pwck").css("display", "none")
			
		// 비밀번호 확인 일치
		} else {
			$("#er_pwsame").css("display", "none")
			$("#ok_pwck").css("display", "")
		}
	})
})
</script>


<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/httpRequest.js"></script>

<!-- 아이디 중복확인 -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnCheckId").click(function() {
		
		if( $("#userid").val() == "" ) {
			
			$("#blank_id").css("display", "")
			$("#er_id").css("display", "none")
			$("#ok_id").css("display", "none")
			
			$("input").eq(0).focus()
			
		} else {
			console.log("#btnCheckId click")
			
			// $.ajax() 함수의 기본 구조
			$.ajax({
				type: "post" // 요청 메소드
				, url: "/check/id" // 요청 URL
				, data: { // 요청 파라미터
					userid: $("#userid").val()
				}
				, dataType: "json" // 응답 형식
				, success: function( data ) {
					console.log("AJAX 성공")
					console.log(data)
					
					if( data.checkId == true ) {
						
						$("#check_id").val("checked")
						
						$("#userid").attr("readonly", true)
						
						$("#er_idck").css("display", "none")
						$("#er_id").css("display", "none")
						$("#ok_id").css("display", "")
						
						$("#btnCheckId").css("display", "none")
						$("#btnChangeId").css("display", "")

					} else {
						
						$("#check_id").val("")
						
						$("#userid").val("")
						$("#userid").attr("readonly", false)
						
						$("#er_idck").css("display", "none")
						$("#er_id").css("display", "")
						$("#ok_id").css("display", "none")
						
						$("#btnCheckId").css("display", "")
						$("#btnChangeId").css("display", "none")
						
						$("#userid").focus()
						
					}
					
				}
				, error: function() {
					console.log("AJAX 실패")			
				}
			})
		}
	})
})
</script>


<!-- 전화번호, 생년월일 하이픈 자동입력 -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#userphone").keyup(function() {
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^02|^0505|^1[0-9]{3}|^0[0-9]{2})([0-9]+)?([0-9]{4})$/,"$1-$2-$3").replace("--", "-") );
	})

	$("#userbirth").keyup(function() {
		$(this).val( $(this).val().replace(/[^0-9]/g, "").replace(/(^1[0-9]{3}|^2[0-9]{3})([0-9]+)?([0-9]{2})$/,"$1-$2-$3").replace("--", "-") );
	})
	
})
</script>


<!-- 다음 주소 검색 js 설치 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>

<!-- 다음 주소 검색 기능 -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnPost").click(function DaumPostcode() {
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
	            document.getElementById("useraddr1").value = data.zonecode;
	            document.getElementById("useraddr2").value = addr;
	            // 커서를 상세주소 필드로 이동한다.
	            document.getElementById("useraddr3").focus();
	        }
	    }).open();
	})
	
})
</script>


<!-- 프로필 사진 이미지 확인, 썸네일 출력-->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#upload").change(function( e ) {
		console.log("#upload change")
		//---------------------------------------------------
		
		console.log("--- 이벤트 객체 ---")
		console.log( e )
		
		console.log("--- 이벤트 발생 DOM객체 ---")
		console.log( e.target )
		
		console.log("--- 선택된 파일들 ---")
		console.log( e.target.files )
		
		console.log("--- this ---")
		console.log( this )
		
		console.log("--- this.files ---")
		console.log( this.files )
		
		//---------------------------------------------------
		
		var files = e.target.files;
		
		// 이미지만 처리할 수 있도록 적용
		if( !files[0].type.includes( "image" ) ) {
			alert("이미지가 아닙니다")
			
			// 선택한 파일 해제하기
			e.target.value = null;
			
			// 이벤트 처리 중단시키기
			return false;
			
		}
		
		//---------------------------------------------------
		
		// FileReader 객체 생성
		var reader = new FileReader();
		
		// FileReader가 파일의 내용을 전부 읽어들여
		// 메모리에 로드 되었을 때 발생하는 이벤트 처리
		reader.onload = function( ev ) {
			console.log( ev.target.result )
			
			// 이미지를 새롭게 선택할 때마다 #preview의 이전 이미지를 지우고
			// 한 장만 유지되도록 한다
			$("#preview").html(
					$("<img>").attr({
						"src": ev.target.result
						, "width": 200
						, "height": 200
					})
			)
		}

		// 선택된 파일을 DataURL 형식으로 읽어들이기
		reader.readAsDataURL( files[0] );
			
	})

})
</script>


<!-- button : click() -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 입력창에 포커스주기
	$("input").eq(0).focus()
	
	// 아이디 변경
	$("#btnChangeId").click(function() {
		
		$("#check_id").val("")

		$("#userid").val("")
		$("#userid").attr("readonly", false)
		
		$("#ok_id").css("display", "none")
		
		$("#btnCheckId").css("display", "")
		$("#btnChangeId").css("display", "none")
		
		$("#userid").focus()
		
	})
	
	// 회원가입 버튼
	$("#btnJoin").click(function() {
		
		var pw = $("#userpw").val()
		var pwck = $("#userpwck").val()
		var num = pw.search(/[0-9]/g)
		var eng = pw.search(/[a-z]/gi)
		var spe = pw.search(/[`~!@@#$%^&*|₩₩₩'₩";:₩/?]/gi)
		
		
		if( $("#check_id").val() == "" ) {
			
			$("#er_idck").css("display", "")
			$("#er_id").css("display", "none")
			$("#ok_id").css("display", "none")
			
			$("#userid").focus()
			
		// 비밀번호
		// 6자리 미만일 경우
		} else if( pw.length < 6 ) {
			$("#info_pw").css("display", "none")

			$("#er_pwlength").css("display", "")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "none")
			
			$("#ok_pw").css("display", "none")
			
			$("#userpw").focus()
			 
		// 공백이 존재할 경우
		} else if ( pw.search(/\s/) != -1 ) {
			$("#info_pw").css("display", "none")
			
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "")
			$("#er_pwtext").css("display", "none")
			
			$("#userpw").focus()
		
		// 영어+숫자+특수문자 조합이 아닐 경우
		} else if ( num < 0 || eng < 0 || spe < 0 ) {
			$("#info_pw").css("display", "none")
			
			$("#er_pwlength").css("display", "none")
			$("#er_pwblank").css("display", "none")
			$("#er_pwtext").css("display", "")
			
			$("#userpw").focus()
		
		// 비밀번호 확인 불일치
		} else if ( pw != pwck ) {
			
			$("#info_pwck").css("display", "none")
			$("#er_pwsame").css("display", "")
			
			$("#userpwck").focus()
			
		} else if ( $("#username").val() == "" ) {
			
			$("#blank_name").css("display", "")
			
			$("#name").focus()

		} else if ( $("#useremail").val() == "" ) {
			
			$("#blank_name").css("display", "")
			
			$("#useremail").focus()
			
		} else if ( $("#userphone").val() == "" ) {
			
			$("#blank_phone").css("display", "")
			
			$("#userphone").focus()
			
		} else if ( $("#useraddr1").val() == "" ) {
			
			$("#blank_addr").css("display", "")
			
			$("#useraddr1").focus()
			
		} else if ( $("#useraddr2").val() == "" ) {
			
			$("#blank_addr").css("display", "")
			
			$("#useraddr2").focus()
			
		} else {
			
			$(this).parents("form").submit() // 회원가입 폼 제출
		}
		
	})
	
	// 취소 버튼
	$("#btnCancel").click(function() {
		$(location).attr('href', '/') // 메인으로 가기
	})
	
})
</script>


<style type="text/css">
#joinform {
	width: 500px;
	
	margin: 0 auto;
	padding: 30px;
	
	border:1px solid #104138;
	border-radius: 10px;
	
	background: whitesmoke;
}

#userid {
	width: 270px;
	display: inline-block;
}

#useraddr1 {
	width: 240px;
	display: inline-block;
}

#btnCheckId, #btnChangeId, #btnPost {
	display: inline-block;
	float: right;
}

.info_box {
	color: blue;
}

.blank_box, .er_box {
	color: red;
}

.ok_box {
	color: green;
}

.btn-checkId, .btn-changeId , .btn-post {
	background-color: #fad703;  
	color: #104138;
}

.btn-join {
	background-color: #fad703;  
	color: #104138;
}

.btn-cancel {
	background-color: salmon;  
	color: #104138;
}
</style>


<h1 style="text-align: center;">회원가입</h1>
<hr>

<form action="/join" method="post" class="form-horizontal" enctype="multipart/form-data">

<fieldset id="joinform">

<div class="col-xs-10 col-xs-offset-1">

	<div class="form-group">
		<p>'*' 표시 항목은 필수 입력 항목입니다</p>
	</div>
	
	<div class="form-group">
		<label for="userid">아이디 *</label>
		<br>
		<input type="text" class="form-control" id="userid" name="userid" placeholder="ID">
		<button type="button" class="btn btn-checkId" id="btnCheckId">중복확인</button>
		<button type="button" class="btn btn-changeId" id="btnChangeId" style="display: none;">아이디변경</button>
		<br>
		<span class="er_box" id="er_idck" style="display: none;">아이디 중복확인 하세요</span>
		<span class="er_box" id="er_id" style="display: none;">이미 등록된 아이디입니다</span>
		
		<span class="ok_box" id="ok_id" style="display: none;">사용가능한 아이디입니다</span>

		<input type="hidden" id="check_id" name="check_id" value="">
	</div>
	
	<div class="form-group">
		<label for="userpw">비밀번호 *</label>
		<input type="password" class="form-control" id="userpw" name="userpw" placeholder="PASSWORD">
		
		<span class="info_box" id="info_pw" style="display: '';">영문, 숫자, 특수문자가 모두 포함된 6자리 이상의 조합</span>

		<span class="er_box" id="er_pwlength" style="display: none;">6자리 이상 입력해주세요</span>
		<span class="er_box" id="er_pwblank" style="display: none;">빈칸없이 입력해주세요</span>
		<span class="er_box" id="er_pwtext" style="display: none;">영문, 숫자, 특수문자를 혼합하여 입력해주세요</span>
		
		<span class="ok_box" id="ok_pw" style="display: none;">비밀번호 입력 완료</span>
	</div>

	<div class="form-group">
		<label for="userpwck">비밀번호 확인 *</label>
		<input type="password" class="form-control" id="userpwck" name="userpwck" placeholder="PASSWORD CHECK">
		
		<span class="er_box" id="er_pwsame" style="display: none;">비밀번호가 일치하지 않습니다</span>
		
		<span class="ok_box" id="ok_pwck" style="display: none;">비밀번호 확인 완료</span>
	</div>
	
	<div class="form-group">
		<label for="username">이름 *</label>
		<input type="text" class="form-control" id="username" name="username" placeholder="NAME">
		<span class="blank_box" id="blank_name" style="display: none;">필수 입력 사항입니다</span>
	</div>
	
	<div class="form-group">
		<label for="useremail">이메일 *</label>
		<input type="email" class="form-control" id="useremail" name="useremail" placeholder="ex) email@gmail.com">
		<span class="blank_box" id="blank_email" style="display: none;">필수 입력 사항입니다</span>
	</div>		
	
	<div class="form-group">
		<label for="userphone">전화번호 *</label>
		<input type="text" class="form-control" id="userphone" name="userphone" placeholder="'-' 제외하고 입력" minlength="9" maxlength="13" numberOnly>
		<span class="blank_box" id="blank_phone" style="display: none;">필수 입력 사항입니다</span>
	</div>		
	
	<div class="form-group">
		<label for="useraddr1">주소 *</label>
		<br>
		<input type="text" class="form-control" id="useraddr1" name="useraddr1" placeholder="우편번호" numberOnly>
		<button type="button" class="btn btn-post" id="btnPost" onclick="DaumPostcode()" value="우편번호 찾기">우편번호 찾기</button>
		<br>
		<input type="text" class="form-control" id="useraddr2" name="useraddr2" placeholder="주소">
		<input type="text" class="form-control" id="useraddr3" name="useraddr3" placeholder="상세주소 (선택입력)">
		<span class="blank_box" id="blank_addr" style="display: none;">필수 입력 사항입니다</span>
	</div>
	
	<div class="form-group">
		<label for="usergender">성별</label>
		<select class="form-control" id="usergender" name="usergender">
		    <option value="">선택하세요</option>
		    <option value="M">남성</option>
		    <option value="F">여성</option>
		</select>
	</div>
	
	<div class="form-group">
		<label for="userbirth">생년월일</label>
		<input type="text" class="form-control" id="userbirth" name="userbirth" placeholder="'-' 제외하고 8자리 입력    ex) 1995-01-01" maxlength="10" numberOnly>
	</div>		

	<div class="form-group">
		<label for="usernick">닉네임</label>
		<input type="text" class="form-control" id="usernick" name="usernick" placeholder="NICK">
	</div>		

	<div class="form-group">
		<label for="upload">프로필 사진</label>
		<input type="file" id="upload" name="upload">
		<br>
		<div id="preview" class="text-center"></div>
	</div>
	
	<div class="form-group text-center">
		<button type="button" class="btn btn-join btn-lg btn-inline-block" id="btnJoin">회원가입</button>
		<button type="button" class="btn btn-cancel btn-lg btn-inline-block" id="btnCancel">취소</button>
	</div>

</div>

</fieldset>

</form>

<%@ include file="../layout/footer.jsp" %>
