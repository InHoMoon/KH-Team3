<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<!-- 다음 주소 검색 js 설치 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


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

	// 전화번호 공백
	$("#userphone").blur(function() {
		if( $(this).val() == "" ) {
			$("#required_phone").css("display", "")
		} else {
			$("#required_phone").css("display", "none")
		}
	})

	// 주소(addr1) 공백
	$("#useraddr1").blur(function() {
		if( $(this).val() == "" ) {
			$("#required_addr").css("display", "")
		} else {
			$("#required_addr").css("display", "none")
		}
	})

	// 주소(addr2) 공백
	$("#useraddr2").blur(function() {
		if( $(this).val() == "" ) {
			$("#required_addr").css("display", "")
		} else {
			$("#required_addr").css("display", "none")
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


<!-- 아이디, 닉네임 중복확인 ajax   --- 수정 필요 -->
<script type="text/javascript">
$(document).ready(function() {
	$("#btnCheckId").click(function() {
		
		//새창을 열어서 페이지를 오픈 후 -> 회원아이디정보를 가지고 중복체크
		//1. 아이디가 없으면 알림창과 진행x
		if( $("#userid").val() == "" || $("#userid").val() == "" < 0) {
			alert("아이디를 입력해주세요")
			$("#userid").focus();
		} else {
			//2. 회원정보아이디를 가지고 있는 지 체크하려면 DB에 접근해야한다.
			//자바스크립트로 어떻게 DB에 접근할까? => 파라미터로 id값을 가져가서 jsp페이지에서 진행하면 된다.
			window.open("/check/id?userid="+$("#userid").val(),"","width=500, height=300");
		}
		
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


<!-- 카카오 주소 검색 기능 -->
<script type="text/javascript">
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
            document.getElementById("useraddr1").value = data.zonecode;
            document.getElementById("useraddr2").value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.getElementById("useraddr3").focus();
        }
    }).open();
}
</script>


<!-- 프로필 사진 -->
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
						, "width": 300
						, "height": 300
					})
			)
		}

		// 선택된 파일을 DataURL 형식으로 읽어들이기
		reader.readAsDataURL( files[0] );
			
	})

})
</script>


<!-- button -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 입력창에 포커스주기
	$("input").eq(0).focus()
	
	// 회원가입 버튼
	$("#btnJoin").click(function() {
		
		if( $("#userid").val() == "" ) {
			alert("아이디를 입력하세요");
			$("input").eq(0).focus()
			
		} else if ( $("#userpw").val() == "" ) {
			alert("비밀번호를 입력하세요");
			$("input").eq(1).focus()

		} else if ( $("#userpwck").val() == "" ) {
			alert("비밀번호를 확인하세요");
			$("input").eq(2).focus()
		
		} else if ( $("#username").val() == "" ) {
			alert("이름을 입력하세요");
			$("input").eq(3).focus()
			
		} else if ( $("#useremail").val() == "" ) {
			alert("이메일을 입력하세요");
			$("input").eq(4).focus()
		
		} else if ( $("#userphone").val() == "" ) {
			alert("전화번호를 입력하세요");
			$("input").eq(5).focus()
			
		} else if ( $("#useraddr1").val() == "" ) {
			alert("주소를 입력하세요");
			$("input").eq(6).focus()
			
		} else if ( $("#useraddr2").val() == "" ) {
			alert("주소를 입력하세요");
			$("input").eq(7).focus()
			
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

<h1 style="text-align: center;">회원가입</h1>
<hr>

<form action="/join" method="post" enctype="multipart/form-data" class="form-horizontal">

	<!-- 중복확인 구현 필요 -->
	<div class="form-group">
		<label for="userid" class="col-xs-2 col-xs-offset-2 control-label">아이디</label>
		<div class="col-xs-4">
			<input type="text" id="userid" name="userid" class="form-control" engnum>
			<input type="hidden" name="decide_id" id="decide_id">
			<span class="required_box" id="required_id" style="display: none; color: red;">필수 입력 사항입니다</span>
		</div>
		<div class="col-xs-2">
			<button type="button" class="btn btn-default" id="btnCheckId">중복확인</button>
		</div>
		<div id="result"></div>
	</div>

	<div class="form-group">
		<label for="userpw" class="col-xs-2 col-xs-offset-2 control-label">비밀번호</label>
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

	<div class="form-group">
		<label for="username" class="col-xs-2 col-xs-offset-2 control-label">이름</label>
		<div class="col-xs-4">
			<input type="text" id="username" name="username" class="form-control" engkor>
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

	<div class="form-group">
		<label for="userphone" class="col-xs-2 col-xs-offset-2 control-label">전화번호</label>
		<div class="col-xs-4">
			<input type="text" id="userphone" name="userphone" class="form-control" maxlength="13" placeholder="'-' 제외하고 입력">
			<span class="required_box" id="required_phone" style="display: none; color: red;">필수 입력 사항입니다</span>
		</div>
	</div>

	<div class="form-group">
		<label for="useraddr1" class="col-xs-2 col-xs-offset-2 control-label">주소</label>
		<div class="col-xs-4">
			<input type="text" id="useraddr1" name="useraddr1" class="form-control" placeholder="우편번호">
		</div>
		<div class="col-xs-4">
			<input type="button" class="btn btn-default" onclick="DaumPostcode()" value="우편번호 찾기">
		</div>
		<div class="clearfix"></div>
		<div class="col-xs-4 col-xs-offset-4">
			<input type="text" id="useraddr2" name="useraddr2" class="form-control" placeholder="주소">
		</div>
		<div class="clearfix"></div>
		<div class="col-xs-4 col-xs-offset-4">
			<input type="text" id="useraddr3" name="useraddr3" class="form-control" placeholder="상세주소 (선택입력)">
			<span class="required_box" id="required_addr" style="display: none; color: red;">필수 입력 사항입니다</span>
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
		<label for="userbirth" class="col-xs-2 col-xs-offset-2 control-label">생년월일</label>
		<div class="col-xs-4">
			<input type="text" id="userbirth" name="userbirth" class="form-control" maxlength="10" placeholder="선택입력 ('-' 제외하고 8자리 입력)  ex) 1995-01-01">
		</div>
	</div>

	<!-- 중복확인 구현 필요 -->
	<div class="form-group">
		<label for="usernick" class="col-xs-2 col-xs-offset-2 control-label">닉네임</label>
		<div class="col-xs-4">
			<input type="text" id="usernick" name="usernick" class="form-control" placeholder="선택입력">
		</div>
		<div class="col-xs-2">
			<button type="button" class="btn btn-default" id="btnCheckNick">중복확인</button>
		</div>
	</div>
	
	<div class="form-group">
		<label for="file" class="col-xs-2 col-xs-offset-2 control-label">프로필 사진</label>
		<input type="file" name="file" id="upload">
		<div id="preview"></div>
	</div>

	<div class="text-center">
		<button type="button" class="btn btn-default" id="btnJoin">회원가입</button>
		<button type="button" class="btn btn-default" id="btnCancel">취소</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
