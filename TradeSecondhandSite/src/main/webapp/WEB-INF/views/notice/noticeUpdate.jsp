<%@page import="web.dto.Nfile"%>
<%@page import="web.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>


<% Notice updateNotice = (Notice) request.getAttribute("updateNotice");%>
<% Nfile nFile = (Nfile) request.getAttribute("nFile"); %>


<!-- 스마트 에디터2 설치 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
	$("#selectoption").change(function() {
		console.log("값변경테스트: " + $(this).val());
		$("#ncategory").val($(this).val());
	})
	
	
	//수정버튼
	$("#btnUpdate").click(function() {
		
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
	
	
	//파일이 없을 경우
	if(<%=nFile != null %>) {
		$("#beforeFile").show();
		$("#afterFile").hide();
	}
	
	//파일이 있을 경우
	if(<%=nFile == null %>) {
		$("#beforeFile").hide();
		$("#afterFile").show();
	}
	
	//파일 삭제 버튼(X) 처리
	$("#delFile").click(function() {
		$("#beforeFile").toggle();
		$("#afterFile").toggle();
	})
})



function updateContents() {
	
	//스마트 에디터에 작성된 내용을 #ncontent에 반영한다
	oEditors.getById["ncontent"].exec("UPDATE_CONTENTS_FIELD", [])
}
</script>


 
<h1>글수정</h1>
<hr>
<br>
 
 
<form action="./update" method="post" enctype="multipart/form-data">

<input type="hidden" name="nno" value="<%=updateNotice.getNno() %>">


<input type="checkbox" id="ntop" name="ntop" value="1">
<label for="ntop">이 게시물을 상단에 고정</label>

<table class="table table-bordered">
<tr> 
	<td class="info">분류</td>
	<td><input type="text" name="ncategory" id="ncategory" />
	<select id="selectoption" >
		<option value="">선택하세요</option>
		<option value="공지">공지</option>
		<option value="이벤트">이벤트</option>
	</select>
	</td> 
</tr>
<tr> <td class="info">제목</td><td><input type="text" name="ntitle" style="width:100%" value="<%=updateNotice.getNtitle() %>"></td> </tr>
<tr> <td class="info" colspan="2">본문</td></tr>
<tr> <td colspan="2"><textarea id="ncontent" name="ncontent" style="width:100%"><%=updateNotice.getNcontent() %></textarea></td></tr>
</table>

<!-- 첨부파일 -->

<div>

<div id="beforeFile">
	<%	if( nFile != null ) { %>
	<a href="<%=request.getContextPath() %>/upload/<%=nFile.getNfilestoredname() %>"
	 download="<%=nFile.getNfileoriginname() %>">
		<%=nFile.getNfileoriginname() %>
	</a>
	<span id="delFile" style="color: red; font-weight: bold; cursor: pointer;">X</span>
	<img class="img-responsive"  alt="" src="<%=request.getContextPath() %>/upload/<%=nFile.getNfilestoredname() %>" width="200px">
	
	<%	} %>
</div>

<div id="afterFile">
	새 첨부파일 <input type="file" name="file">
</div>

</div>

</form>
 
 
<div class="text-center">
	<button id="btnUpdate" class="btn btn-primary">수정</button>
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