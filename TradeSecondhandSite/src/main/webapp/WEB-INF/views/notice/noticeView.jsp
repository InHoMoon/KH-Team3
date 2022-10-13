<%@page import="web.dto.Nfile"%>
<%@page import="web.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

 
<% Notice viewNotice = (Notice) request.getAttribute("viewNotice");%>
<% Nfile nFile = (Nfile) request.getAttribute("nFile"); %>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {

	//목록버튼
	$("#btnList").click(function() {
		$(location).attr('href', './list')
	})
	
	//수정버튼
	$("#btnUpdate").click(function() {
		$(location).attr('href', './update?nno=<%=viewNotice.getNno() %>')
	})
	
	//삭제버튼
	$("#btnDelete").click(function() {
		$(location).attr('href', './delete?nno=<%=viewNotice.getNno() %>')		
	})
})

</script>

<style type="text/css">

.noticepage {
	width: 1000px
}


#noticecontent {
	min-height:250px;
}
</style>

<div class="container noticepage">

<h3>공지사항</h3><br>
	<div class="col-xs-6">
		<button id="btnList" class="btn btn-default" >목록으로</button>
	</div>
	<div class="col-xs-6 text-right">
		<button id="btnPrePost" class="btn btn-default ">이전글</button>
		<button id="btnNextPost" class="btn btn-default ">다음글</button>		
	</div>
	
	<br><br>
<table class="table">
	<tr>
	<td colspan="4">글번호 : <%=viewNotice.getNno() %></td>	
	</tr>

	<tr>
	<td colspan="4" class="h3"><strong>[ <%=viewNotice.getNcategory() %> ]  <%=viewNotice.getNtitle() %></strong></td>
	</tr>
	
	<tr>
	<td>작성일자 : <%=viewNotice.getNwritedate() %></td>
	<td class="text-right">조회수 : <%=viewNotice.getNhit() %></td>
	</tr>

	
	<tr>
	<td colspan="4">
	<div>
		<%	if( nFile != null ) { %>  
			<img class="img-responsive center-block"  alt="" src="<%=request.getContextPath() %>/upload/<%=nFile.getNfilestoredname() %>" width="600px">
		<%	} %>
	</div><br>
	<%=viewNotice.getNcontent() %>
	</td>
	</tr>
</table>


<!-- 첨부파일 -->
<div>
<%	if( nFile != null ) { %> 첨부파일 : 
	<a href="<%=request.getContextPath() %>/upload/<%=nFile.getNfilestoredname() %>"
	download="<%=nFile.getNfileoriginname() %>">
	<%=nFile.getNfileoriginname() %>
	</a>
<%	} %>
</div>


<%-- 관리자 로그인상태 --%>
<% if(session.getAttribute("login") != null && session.getAttribute("userid").equals("id1"))  { %>
	<div class="text-right">
		<button id="btnUpdate" class="btn btn-info">글수정</button>
		<button id="btnDelete" class="btn btn-danger">글삭제</button>
	</div>
<% } %>

<br>
</div>

<br><br><br>
 <%@ include file="../layout/footer.jsp" %>