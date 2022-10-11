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
<td class="info text-center">제목</td><td ><%=viewTrade.getTitle() %></td>
<td class="info text-center">작성일</td><td><%=viewTrade.getInsertDate() %></td>
</tr>

<tr>
<td class="info text-center">카테고리</td><td><%=viewTrade.getCategory() %></td>
<td class="info text-center">아이디</td><td><%=viewTrade.getUserid() %></td>
</tr>

<tr>
<td class="info text-center">제품 상태</td><td><%=viewTrade.getProductState() %></td>
<td class="info text-center">가격</td><td><%=viewTrade.getPrice() %></td>
</tr>

<tr>
<td class="info text-center">판매 상태</td><td><%=viewTrade.getSaleState() %></td>
<td class="info text-center">조회수</td><td><%=viewTrade.getHit() %></td>
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













