<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 아이디 찾기 버튼
	$("#btnFindId").click(function() {
		$(location).attr('href', '/find/id') // FindIdController으로 가기
	})
	
	// 메인화면 버튼
	$("#btnMain").click(function() {
		$(location).attr('href', '/') // 메인으로 가기
	})
	
})
</script>


<style type="text/css">
#failform {
	width: 500px;
	
	margin: 0 auto;
	padding: 30px;
	
}

.btn-findId {
	background-color: mediumaquamarine;  
	color: #104138;
}

.btn-main {
	background-color: salmon;  
	color: #104138;
}
</style>


<fieldset id="failform">

	<h1 style="color: red; text-align: center;">아이디 찾기 실패</h1>
	<hr>
	
	<h3 style="text-align: center;">이름과 EMAIL을 다시 확인하세요</h3>
	<br>
	
	<div class="text-center">
		<button type="button" class="btn btn-findId" id="btnFindId">아이디 찾기</button>
		<button type="button" class="btn btn-main" id="btnMain">메인화면</button>
	</div>

</fieldset>

<%@ include file="../layout/footer.jsp" %>
