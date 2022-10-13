<%@page import="web.dto.Trade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<%	List<Trade> tradeList = (List) request.getAttribute("tradeList"); %>

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
	
})
</script>

<h1>거래글 목록</h1>
<hr>
<div>
<form action="/trade/list" method="post" name="search" >
	<table class="pull-right">
		<tr>
			<td><select class="form-control" name="searchField">
					<option value="0">선택</option>
					<option value="title">제목</option>
					<option value="userid">아이디</option>
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

<%	for(int i=0; i<tradeList.size(); i++) { %>
<tr>
	<td><%=tradeList.get(i).getTradeno() %></td>
	<td><%=tradeList.get(i).getSaleState() %></td>
	<td>
		<a href="./view?tradeno=<%=tradeList.get(i).getTradeno() %>">
			<%=tradeList.get(i).getTitle() %>
		</a>
	</td>
	<td><%=tradeList.get(i).getUserid() %></td>
	<td><%=tradeList.get(i).getHit() %></td>
	<td><%=tradeList.get(i).getInsertDate() %></td>
</tr>
<%	} %>
</table>

<% if(session.getAttribute("login") != null){ %>
<div id="btnBox" class="pull-right"> 
	<button id="btnWrite" class="btn btn-primary">글쓰기</button>
</div>
<div class="clearfix"></div>
<%} %>

<%@ include file="../layout/paging.jsp" %>

<%@ include file="../layout/footer.jsp" %>



















