<%@page import="util.Paging"%>
<%@page import="web.dto.Trade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<%	List<Trade> mypostList = (List) request.getAttribute("mypostList"); %>

<script type="text/javascript">
$(document).ready(function(){
	$("#check-all").click(function(){
		if($("#check-all").is(":checked")) $("input[name=checkbox]").prop("checked", true);
	
		else $("input[name=checkbox]").prop("checked", false);
	});
	
	$("input[name=checkbox]").click(function(){
		var total = $("input[name=checkbox]").length;
		var checked = $("input[name=checkbox]:checked").length;
		
		if(total != checked) $("#check-all").prop("checked", false);
		else $("#check-all").prop("checked", true);
	});
	
	$(document).ready(function() {
		$(".addbtn").click(function() {
			$(location).attr('href', '/trade/write')
		})
	})
});

</script>

<style type="text/css">
th {
	text-align: center;
}
	
article {
	display: flex;
	justify-content: flex-end;
	
	margin-right: 10px;
}

a {
	
}

</style>

	<h1>내 게시글</h1>

<table class="table table-striped table-condensed">
<tr>
	<th style="width: 3%"><input type="checkbox" id="check-all"></th>
	<th style="width: 7%">글번호</th>
	<th style="width: 10%">판매상태</th>
	<th style="width: 60%">제목</th>
	<th style="width: 10%">조회수</th>
	<th style="width: 10%">작성일</th>
</tr>
<%	for(int i=0; i<mypostList.size(); i++) { %>
<tr>
	<td class="text-center"><input type="checkbox" name="checkbox"></td>
	<td class="text-center"><%=mypostList.get(i).getTradeno() %></td>
	<td class="text-center"><%=mypostList.get(i).getSaleState() %>
	<td>
		<a href="/trade/view?tradeno=<%=mypostList.get(i).getTradeno() %>">
			<%=mypostList.get(i).getTitle() %>
		</a>
	</td>
	<td class="text-center"><%=mypostList.get(i).getHit() %></td>
	<td class="text-center"><%=mypostList.get(i).getInsertDate() %></td>
</tr>
<%	} %>
</table>

<article>
	<button class="delbtn" type="button">삭제</button>
	<button class="addbtn" type="button">글쓰기</button>
</article>


<%@ include file="./myPaging.jsp" %>
<%-- <%@ include file="../layout/paging.jsp" %> --%>

<%@ include file="../layout/footer.jsp"%>