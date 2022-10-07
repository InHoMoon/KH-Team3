<%@page import="web.dto.Trade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	Trade viewTrade = (Trade) request.getAttribute("viewTrade"); %>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	//목록 버튼
	$("#btnList").click(function() {
		$(location).attr('href', './list')
	})

	//수정 버튼
	$("#btnUpdate").click(function() {
		$(location).attr('href', './update?boardno=<%=viewTrade.getTradeno() %>')
	})

	//삭제버튼
	$("#btnDelete").click(function() {
		$(location).attr('href', './delete?boardno=<%=viewTrade.getTradeno() %>')
	})

})
</script>

<h1>게시글 상세보기</h1>
<hr>

<table class="table table-bordered">

<tr>
<td class="info">글번호</td><td><%=viewTrade.getTradeno() %></td>
<td class="info">작성일</td><td><%=viewTrade.getInsertDate() %></td>
</tr>

<tr>
<td class="info">제목</td><td colspan="3"><%=viewTrade.getTitle() %></td>
</tr>

<tr>
<td class="info">아이디</td><td><%=viewTrade.getUserid() %></td>
<td class="info">닉네임</td><td></td>
</tr>

<tr>
<td class="info">조회수</td><td colspan="3"><%=viewTrade.getHit() %></td>
</tr>

<tr>
<td class="info" colspan="4">본문</td>
</tr>
<tr><td colspan="4"><%=viewTrade.getContent() %></td></tr>

</table>



<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
	<button id="btnUpdate" class="btn btn-info">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>

<%@ include file="../layout/footer.jsp" %>













