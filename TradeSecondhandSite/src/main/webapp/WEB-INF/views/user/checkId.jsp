<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>


<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>


<!-- 아이디 중복확인 ajax -->
<script type="text/javascript" src="<%=request.getContextPath() %>/resources/js/httpRequest.js"></script>

<script type="text/javascript">
$(document).ready(function() {
	$("#btnCheckId").click(function() {

		if( $("#userid").val() == "" ) {
			alert("아이디를 입력하세요");
			$("#userid").focus()
			
		} else {
			console.log("#btnCheckId click")
			
			var param = "userid=" + $("#userid").val()
			
			// AJAX 요청 보내기
			sendRequest("POST", "/check/id", param , callback)	
			
		}
		
	})
})

// AJAX 응답 처리 콜백
function callback() {
	if(httpRequest.readyState ==4) {
		if(httpRequest.status == 200) {
			console.log("정상적인 AJAX 요청/응답 완료")
			
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
	
	// checkId boolean 값 이용하여 중복확인
	//	-> true : 사용가능, false : 사용불가
	
	if( jsData.checkId == true ) {
		
		console.log( "true" )
		
		$("#userid").attr("readonly", true)
		$("#Check_IdOk").css("display", "")
		$("#Check_IdFail").css("display", "none")
		
		$("#btnCheckId").css("display", "none")
		$("#btnChangeId").css("display", "")
		
		
	} else if ( jsData.checkId == false ) {
		
		console.log( "false" )
		
		$("#userid").val("");
		$("#userid").attr("readonly", false)
		$("#Check_IdOk").css("display", "none")
		$("#Check_IdFail").css("display", "")
		
		$("#btnCheckId").css("display", "")
		$("#btnChangeId").css("display", "none")
		
		$("#userid").focus()
		
	}
	
}
</script>


<div class="form-group">
	<label for="userid" class="col-xs-2 col-xs-offset-2 control-label">아이디</label>
	<div class="col-xs-4">
		<input type="text" id="userid" name="userid" class="form-control">
		<span class="required_box" id="required_id" style="display: none; color: red;">필수 입력 사항입니다</span>

		<span class="Check_box" id="Check_IdOk" style="display: none; color: green;">사용가능한 아이디입니다</span>
		<span class="Check_box" id="Check_IdFail" style="display: none; color: red;">이미 등록된 아이디입니다</span>

	</div>
	<div class="col-xs-2">
		<button type="button" class="btn btn-default" id="btnCheckId">중복확인</button>
		<button type="button" class="btn btn-default" id="btnChangeId" style="display: none;">아이디변경</button>
	</div>
</div>


</head>
<body>

</body>
</html>