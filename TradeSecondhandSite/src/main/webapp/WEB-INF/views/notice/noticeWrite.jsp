<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<!-- 스마트 에디터2 설치 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
	$("#selectoption").change(function() {
		console.log("값변경테스트: " + $(this).val());
		$("#ncategory").val($(this).val());
	})
	
	
	//작성버튼
	$("#btnWrite").click(function() {
		console.log("작성 버튼 클릭");
		
		//작성된 내용을 <textarea>에 적용하기
		updateContents();
		
		//폼 제출
		$("form").submit();
		
		//** submit 전에 에디터 작성내용이 반영되도록 작성할 것
		
	})
	
	//취소버튼
	$("#btnCancel").click(function() {
		history.go(-1)
	})
	
	
})



function updateContents() {
	
	//스마트 에디터에 작성된 내용을 #ncontent에 반영한다
	oEditors.getById["ncontent"].exec("UPDATE_CONTENTS_FIELD", [])
	
}
</script>


 
<h1>글쓰기</h1>
<hr>
<br>
 
 
<form action="./write" method="post" enctype="multipart/form-data">


<input type="checkbox" id="ntop" name="ntop" value="1">
<label for="ntop">이 게시물을 상단에 고정</label>

<table class="table table-bordered">
<tr> 
	<td class="info">분류</td>
	<td><input type="hidden" name="ncategory" id="ncategory"/>
	<select id="selectoption">
		<option value="">선택하세요</option>
		<option value="공지">공지</option>
		<option value="이벤트">이벤트</option>
	</select>
	</td> 
</tr>
<tr> <td class="info">제목</td><td><input type="text" name="ntitle" style="width:100%"></td> </tr>
<tr> <td class="info" colspan="2">본문</td></tr>
<tr> <td colspan="2"><textarea id="ncontent" name="ncontent" style="width:100%"></textarea></td></tr>
</table>

첨부파일 <input type="file" name="file">

</form>
 
 
<div class="text-right">
	<button id="btnWrite" class="btn btn-primary">작성</button>
	<button id="btnCancel" class="btn btn-danger">취소</button>
</div>



<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ncontent",	//에디터가 적용될 <textarea>의 id 적기
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"	
})
</script>




<%@ include file="../layout/footer.jsp" %>