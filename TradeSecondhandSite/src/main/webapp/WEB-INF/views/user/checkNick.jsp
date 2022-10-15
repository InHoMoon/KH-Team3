<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 닉네임 중복확인 ajax -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/httpRequest.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnCheckNick").click(function() {
	
		if( $("#usernick").val() == "" ) {
			alert("닉네임을 입력하세요");
			$("#usernick").focus()
					
		} else {
			console.log("#btnCheckNick click")
						
			var param = "usernick=" + $("#usernick").val()
						
			// AJAX 요청 보내기
			sendRequest("POST", "/check/nick", param , callback)	
					
		}
			
	})
})

// AJAX 응답 처리 콜백
function callback() {
	if(httpRequest.readyState ==4) {
		if(httpRequest.status == 200) {
			onsole.log("정상적인 AJAX 요청/응답 완료")
				
			// 결과 처리 함수 호출하기
			printData();
				
		} else {
			console.log("AJAX 요청/응답 실패")			
		}
	}
}
	
// 응답 결과를 처리하는 함수
function printData() {
	console.log("printData called")
	
	// AJAX 응답 데이터
	var respText = httpRequest.responseText;
	console.log("--- respText ---")
	console.log( respText )
	
	// 언마샬링, JSON Text -> JS Data
	var jsData = JSON.parse( respText )
	console.log("--- jsData ---")
	console.log( jsData )
	
	// checkNick boolean 값 이용하여 중복확인
	//	-> true : 사용가능, false : 사용불가
	
	if( jsData.checkNick == true ) {
			
		console.log( "true" )
				
		$("#usernick").attr("readonly", true)
		$("#Check_NickOk").css("display", "")
		$("#Check_NickFail").css("display", "none")
				
		$("#btnCheckNick").css("display", "none")
		$("#btnChangeNick").css("display", "")
			
			
	} else if ( jsData.checkNick == false ) {
			
		console.log( "false" )
				
		$("#usernick").val("");
		$("#usernick").attr("readonly", false)
		$("#Check_NickOk").css("display", "none")
		$("#Check_NickFail").css("display", "")
				
		$("#btnCheckNick").css("display", "")
		$("#btnChangeNick").css("display", "none")
				
		$("#usernick").focus()
			
	}
	
}
</script>


</head>
<body>

</body>
</html>