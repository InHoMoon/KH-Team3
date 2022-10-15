<%@page import="web.dto.Ufile"%>
<%@page import="web.dto.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<% User updateUser = (User) request.getAttribute("updateUser"); %>
<% Ufile ufile = (Ufile) request.getAttribute("ufile"); %>

<!-- 다음 주소 검색 js 설치 -->
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>


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


<!-- 성별 DB값 받아와서 selected -->
<script type="text/javascript">
$(document).ready(function() {
	
	$("#usergender").val("<%=updateUser.getUsergender() %>").prop("selected",true);
	
})
</script>


<!-- 프로필 사진 유무 확인 -->
<script type="text/javascript">
$(document).ready(function() {
	
	//파일이 없을 경우
	if(<%=ufile != null %>) {
		$("#beforeFile").show();
		$("#afterFile").hide();
	}
	
	//파일이 있을 경우
	if(<%=ufile == null %>) {
		$("#beforeFile").hide();
		$("#afterFile").show();
	}
	
	//파일 삭제 버튼(X) 처리
	$("#delFile").click(function() {
		$("#beforeFile").toggle();
		$("#afterFile").toggle();
	})

})
</script>


<!-- button -->
<script type="text/javascript">
$(document).ready(function() {
	
	// 비밀번호 입력창에 포커스주기
	$("input").eq(1).focus()
	
	// 회원수정 버튼
	$("#btnUpdate").click(function() {
		
		if ( $("#userpw").val() == "" ) {
			alert("비밀번호를 입력하세요");
			$("input").eq(1).focus()

		} else if ( $("#userpwck").val() == "" ) {
			alert("비밀번호를 확인하세요");
			$("input").eq(2).focus()
			
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
			$(this).parents("form").submit() // 회원수정 폼 제출
		}
		
	})
	
	// 취소 버튼
	$("#btnCancel").click(function() {
		$(location).attr('href', '/') // myfage로 가기 -------------수정필요
	})
	
})
</script>

<h1 style="text-align: center;">회원정보 수정</h1>
<hr>

<form action="/update/user" method="post" class="form-horizontal">

	<div class="form-group">
		<label for="userid" class="col-xs-2 col-xs-offset-2 control-label">아이디</label>
		<div class="col-xs-4">
			<input type="text" id="userid" name="userid" class="form-control" value="<%=updateUser.getUserid() %>" readonly>
		</div>
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
			<input type="text" id="username" name="username" class="form-control" value="<%=updateUser.getUsername() %>" readonly>
		</div>
	</div>

	<div class="form-group">
		<label for="useremail" class="col-xs-2 col-xs-offset-2 control-label">이메일</label>
		<div class="col-xs-4">
			<input type="email" id="useremail" name="useremail" class="form-control" value="<%=updateUser.getUseremail() %>">
			<span class="required_box" id="required_email" style="display: none; color: red;">필수 입력 사항입니다</span>
		</div>	
	</div>

	<div class="form-group">
		<label for="userphone" class="col-xs-2 col-xs-offset-2 control-label">전화번호</label>
		<div class="col-xs-4">
			<input type="text" id="userphone" name="userphone" class="form-control" value="<%=updateUser.getUserphone() %>" maxlength="13" placeholder="'-' 제외하고 입력">
			<span class="required_box" id="required_phone" style="display: none; color: red;">필수 입력 사항입니다</span>
		</div>
	</div>

	<div class="form-group">
		<label for="useraddr1" class="col-xs-2 col-xs-offset-2 control-label">주소</label>
		<div class="col-xs-4">
			<input type="text" id="useraddr1" name="useraddr1" class="form-control" value="<%=updateUser.getUseraddr1() %>" placeholder="우편번호">
		</div>
		<div class="col-xs-4">
			<input type="button" class="btn btn-default" onclick="DaumPostcode()" value="우편번호 찾기">
		</div>
		<div class="clearfix"></div>
		<div class="col-xs-4 col-xs-offset-4">
			<input type="text" id="useraddr2" name="useraddr2" class="form-control" value="<%=updateUser.getUseraddr2() %>" placeholder="주소">
		</div>
		<div class="clearfix"></div>
		<div class="col-xs-4 col-xs-offset-4">
			<input type="text" id="useraddr3" name="useraddr3" class="form-control" value="<%=updateUser.getUseraddr3() %>" placeholder="상세주소 (선택입력)">
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
			<input type="text" id="userbirth" name="userbirth" class="form-control" value="<%=updateUser.getUserbirth() %>" maxlength="10" placeholder="선택입력 ('-' 제외하고 8자리 입력)  ex) 1995-01-01">
		</div>
	</div>

	<div class="form-group">
		<label for="usernick" class="col-xs-2 col-xs-offset-2 control-label">닉네임</label>
		<div class="col-xs-4">
			<input type="text" id="usernick" name="usernick" class="form-control" value="<%=updateUser.getUsernick() %>" placeholder="선택입력">
		</div>
	</div>

	<!-- 첨부파일 -->
	<div>
		<div id="beforeFile">
			<%	if( ufile != null ) { %>
			<a href="<%=request.getContextPath() %>/upload/<%=ufile.getUfilestoredname() %>"
			 download="<%=ufile.getUfileoriginname() %>">
				<%=ufile.getUfileoriginname() %>
			</a>
			<span id="delFile" style="color: red; font-weight: bold; cursor: pointer;">X</span>
			<img class="img-responsive"  alt="" src="<%=request.getContextPath() %>/upload/<%=ufile.getUfilestoredname() %>" width="200px">
			
			<%	} %>
		</div>
		
		<div id="afterFile">
			새 첨부파일 <input type="file" name="file">
		</div>
	</div>

	<div class="text-center">
		<button type="button" class="btn btn-default" id="btnUpdate">수정</button>
		<button type="button" class="btn btn-default" id="btnCancel">취소</button>
	</div>

</form>

<%@ include file="../layout/footer.jsp" %>
