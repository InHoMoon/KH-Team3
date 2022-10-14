<%@page import="web.dto.TradeCmt"%>
<%@page import="java.util.List"%>
<%@page import="web.dto.TradeImg"%>
<%@page import="web.dto.Trade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	Trade viewTrade = (Trade) request.getAttribute("viewTrade"); %>

<!-- 첨부파일 상세보기 조회 결과 값 -->
<% TradeImg tradeImg = (TradeImg) request.getAttribute("tradeImg"); %>

<% List<TradeCmt> cmtList = (List) request.getAttribute("cmtList"); %>

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
	
	//관심버튼
	$("#btnCalt").click(function() {
		$(location).attr('href', './cart?userid=<%=session.getAttribute("userid") %>')
	})
	
	//작성버튼
	$("#btnWrite").click(function() {
		
		$("form").submit();
	})
	
	


	
	

})
</script>




<h1>거래글 상세보기</h1>
<hr>


<table class="table table-bordered">

<tr>
<td class="active text-center">제목</td><td colspan="3"><%=viewTrade.getTitle() %></td>
<td class="active text-center">작성일</td><td><%=viewTrade.getInsertDate() %></td>
</tr>

<tr>
<td class="active text-center">카테고리</td><td colspan="3"><%=viewTrade.getCategory() %></td>
<td class="active text-center">제품 상태</td><td ><%=viewTrade.getProductState() %></td>
</tr>

<tr>
<td class="active text-center">판매 상태</td><td colspan="3"><%=viewTrade.getSaleState() %></td>
<td class="active text-center">가격</td><td><%=viewTrade.getPrice() %>원</td>
</tr>

<tr>
<td class="active text-center">아이디</td><td><%=viewTrade.getUserid() %></td>
<td class="active text-center">전화번호</td><td><%=viewTrade.getUserphone() %></td>
<td class="active text-center">조회수</td><td><%=viewTrade.getHit() %></td>
</tr>
<tr>
<td class="active" colspan="6">대표 사진</td>
</tr>
<tr>
<td colspan="6"><img alt="이미지가 없습니다" style="width: 100%; height: 300px;"  src="<%=request.getContextPath() %>/upload/<%=tradeImg.getStoredName() %>"></td>
</tr>

<tr>
<td class="active" colspan="6">본문</td>
</tr>
<tr>
	<td colspan="6">
		<%=viewTrade.getContent() %>
	</td>
</tr>

</table>





<div class="text-center">
	<button id="btnList" class="btn btn-primary">목록</button>
<%if(session.getAttribute("login") != null && session.getAttribute("userid").equals(viewTrade.getUserid()) ) {%>
	<button id="btnUpdate" class="btn btn-info">수정</button>
	<button id="btnDelete" class="btn btn-danger">삭제</button>
	<button id="btnCart" class="btn btn-warning">관심</button>
<%} %>
</div>

<br>
<br>

<table class="table ">
<% if(cmtList.size()==0){ %>
	<tr><th>댓글이 없습니다</th></tr>
<% }else if (cmtList.size()!=0) { %>
	<%	for(int i=0; i<cmtList.size(); i++) { %>
	<tr>
		<th style="width: 10%;">ID : <%= cmtList.get(i).getUserid() %>
		<th style="width: 65%;"><%= cmtList.get(i).getCmtContent() %></th>
		<th>작성일 : <%= cmtList.get(i).getCmtDate() %>
		<%} %>
	</tr>
	<%} %>
</table>


<form action='./cmtwrite' method="post">

	<input type="hidden" name="userid" value="<%=session.getAttribute("userid") %>">
	<input type="hidden" name="tradeno" value="<%=viewTrade.getTradeno() %>">
	
	<table class="table">
		<tr>
			<th style="text-align:left; width:90%;">
				<label for="cmt">댓글 : </label>
        		<textarea class="form-control" rows="3" id="cmt" name="cmt" placeholder="댓글을 입력하세요"></textarea>
        	</th>
			<th class="text-center" style="line-height:20px;">
				<button id="btnWrite" class="btn btn-primary" style="height: 100px;">작성</button>
			</th>
		</tr>
	</table>
</form>

<%@ include file="../layout/footer.jsp" %>













