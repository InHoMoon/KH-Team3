<%@page import="web.dto.Notice"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<% List<Notice> noticeList = (List) request.getAttribute("noticeList"); %>


<style type="text/css">
th, td {
	text-align: center;
}

/* td:nth-child(2) {
	text-align: justify;
} */

a {
	color: black;
	text-decoration: none;
}
</style>


<script type="text/javascript">
$(document).ready(function() {
	
	$("#btnWrite").click(function() {
		location.href = "./write"
	})
	
	$("#btnSearch").click(function() {
		$("form").submit();
	})
})
</script>


<h1><a href="/33/notice/list">공지사항</a></h1>
<hr>
<br><br>


<table class="table table-striped table-hover table-condensed">

<tr>
	<th style="width: 10%">NO</th>
	<th style="width: 15%">분류</th>
	<th style="width: 45%">제목</th>
	<th style="width: 10%">조회수</th>
	<th style="width: 20%">작성일</th>
</tr>


<% for(int i=0; i<noticeList.size(); i++ ) { %>

<tr>
	<td><%= noticeList.get(i).getNno() %></td>
	<td><%= noticeList.get(i).getNcategory() %></td>
	<td  style="text-align: left; padding-left: 20px;">
		<a href="./view?nno=<%= noticeList.get(i).getNno() %>">
				<%= noticeList.get(i).getNtitle() %>
		</a>
	</td>
	<td><%= noticeList.get(i).getNhit() %></td>
	<td><%= noticeList.get(i).getNwritedate() %></td>

</tr>
<% } %>
</table>


<%-- 관리자 로그인상태 --%>

<div id="btnBox" class="pull-right">
	<button id="btnWrite" class="btn" onclick="location.href='/notice/write'" >글쓰기</button><br>
</div>


<div class="clearfix"></div>


<%@ include file="../layout/paging.jsp" %>

 <div>
 <form action="./list" method="post" >
 <input type="text" name="keyWord" >
 <input type="text" name="searchWord" >
 <button id="btnSearch"type="button">검색</button>
 </form>
 
 </div>


 <%@ include file="../layout/footer.jsp" %>
