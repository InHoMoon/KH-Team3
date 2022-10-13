<%@page import="web.dto.Trade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<%	List<Trade> searchList = (List) request.getAttribute("searchList"); %>

<style type="text/css">
th, td {
	text-align: center;
}
td:nth-child(2) {
	text-align: justify;
}
</style>

<script type="text/javascript">
$(document).ready(function(){
	$("#btnWrite").click(function(){
		location.href="./write"
	})
	
	
	//목록 버튼
	$("#btnList").click(function() {
		$(location).attr('href', './list')
	})
})


</script>

<h1>게시글 목록</h1>
<hr>
<div>
<form action="/trade/list" method="post" name="search" >
	<table class="pull-right">
		<tr>
			<td><select class="form-control" name="searchField">
					<option value="0">선택</option>
					<option value="title">제목</option>
					<option value="userid">작성자</option>
			</select></td>
			<td><input type="text" class="form-control"
				placeholder="검색어 입력" name="searchText" maxlength="100"></td>
			<td><button type="submit" class="btn btn-success">검색</button></td>
		</tr>
	</table>
	</form>
</div>

<table class="table table-striped table-hover table-condensed">
<tr>
	<th style="width: 15%">글번호</th>
	<th style="width: 15%">판매 상태</th>
	<th style="width: 30%">제목</th>
	<th style="width: 15%">아이디</th>
	<th style="width: 10%">조회수</th>
	<th style="width: 25%">작성일</th>
</tr>

<%	for(int i=0; i<searchList.size(); i++) { %>
<tr>
	<td><%=searchList.get(i).getTradeno() %></td>
	<td><%=searchList.get(i).getSaleState() %></td>
	<td>
		<a href="./view?tradeno=<%=searchList.get(i).getTradeno() %>">
			<%=searchList.get(i).getTitle() %>
		</a>
	</td>
	<td><%=searchList.get(i).getUserid() %></td>
	<td><%=searchList.get(i).getHit() %></td>
	<td><%=searchList.get(i).getInsertDate() %></td>
</tr>
<%	} %>
</table>

<div id="btnBox" class="pull-right">
<% if(session.getAttribute("login") != null){ %>
	<button id="btnWrite" class="btn btn-primary">글쓰기</button>
<%} %>
<button id="btnList" class="btn btn-primary">목록</button>
</div>
<div class="clearfix"></div>

<%-- <%@ include file="../layout/searchpaging.jsp" %> --%>

<%@ include file="../layout/footer.jsp" %>



















