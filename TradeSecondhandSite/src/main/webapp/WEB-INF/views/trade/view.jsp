<%@page import="java.util.List"%>
<%@page import="web.dto.TradeImg"%>
<%@page import="web.dto.Trade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	Trade viewTrade = (Trade) request.getAttribute("viewTrade"); %>

<!-- 첨부파일 상세보기 조회 결과 값 -->
<% TradeImg tradeImg = (TradeImg) request.getAttribute("tradeImg"); %>

<%@ include file="../layout/header.jsp" %>

<script type="text/javascript">
$(document).ready(function() {
	
	//목록 버튼
	$("#btnList").click(function() {
		$(location).attr('href', './list')
	})

	//수정 버튼
	$("#btnUpdate").click(function() {
		$(location).attr('href', './update?tradeno=<%=viewTrade.getTradeno() %>')
	})

	//삭제버튼
	$("#btnDelete").click(function() {
		$(location).attr('href', './delete?tradeno=<%=viewTrade.getTradeno() %>')
	})
	
	

})
</script>

<h1>거래글 상세보기</h1>
<hr>

<table class="table table-bordered">

<tr>
<td class="active text-center">제목</td><td ><%=viewTrade.getTitle() %></td>
<td class="active text-center">작성일</td><td><%=viewTrade.getInsertDate() %></td>
</tr>

<tr>
<td class="active text-center">카테고리</td><td><%=viewTrade.getCategory() %></td>
<td class="active text-center">아이디</td><td><%=viewTrade.getUserid() %></td>
</tr>

<tr>
<td class="active text-center">제품 상태</td><td><%=viewTrade.getProductState() %></td>
<td class="active text-center">가격</td><td><%=viewTrade.getPrice() %>원</td>
</tr>

<tr>
<td class="active text-center">판매 상태</td><td><%=viewTrade.getSaleState() %></td>
<td class="active text-center">조회수</td><td><%=viewTrade.getHit() %></td>
</tr>

<tr>
<td class="active" colspan="4">본문</td>
</tr>
<tr>
	<td colspan="4">
		<img alt="대표 이미지 X" style="width: 50%; height: 300px;"  src="<%=request.getContextPath() %>/upload/<%=tradeImg.getStoredName() %>">
		<%=viewTrade.getContent() %>
	</td>
</tr>

</table>






<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
	<button id="btnUpdate" class="btn btn-info">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
</div>

<%@ include file="../layout/footer.jsp" %>













