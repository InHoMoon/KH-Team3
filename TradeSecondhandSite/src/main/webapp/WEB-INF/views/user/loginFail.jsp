<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	// 돌아가기 버튼
	$("#btnReturn").click(function() {
		$(location).attr('href', '/login') // loginController으로 가기
	})
	
})
</script>


<style type="text/css">
#failform {
	width: 500px;
	
	margin: 0 auto;
	padding: 30px;
	
}

.btn-return {
	background-color: salmon;  
	color: #104138;
}
</style>


<fieldset id="failform">

	<h1 style="color: red; text-align: center;">로그인 실패</h1>
	<hr>
	
	<h3 style="text-align: center;">ID와 PASSWORD를 다시 확인하세요</h3>
	<br>
	
	<div class="text-center">
		<button type="button" class="btn btn-return" id="btnReturn">돌아가기</button>
	</div>

</fieldset>

<%@ include file="../layout/footer.jsp" %>
 