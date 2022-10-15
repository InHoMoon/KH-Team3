<%@	page import="util.Paging"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%	Paging paging = (Paging) request.getAttribute("paging"); %>


<div class="text-center">
	<ul class="pagination">
	
		<%-- 첫 페이지로 이동 --%>
		<li><a href="./mypost">처음</a></li>


		<%-- 이전 페이징 리스트로 이동 --%>
		<li><a href="./mypost?curPage=<%=paging.getStartPage() - paging.getPageCount() %>">&laquo;</a></li>
	
	
		<%-- 이전 페이지로 이동 --%>
		<li><a href="./mypost?curPage=<%=paging.getCurPage() - 1 %>">&lt;</a></li>
		
	
	
		<%-- 페이징 번호 리스트 --%>
		<%	if(paging.getCurPage() <= 0) { %>
		<script>
			alert("첫 페이지 입니다");
			location.href = "./mypost?curPage=1";
		</script>
		<%	} %>
		
		<%	for(int i=paging.getStartPage(); i<=paging.getEndPage(); i++) { %>
		<%		if(i == paging.getCurPage()) { %>
		<li class="active"><a href="./mypost?curPage=<%=i %>"><%=i %></a></li>
		<%		} else { %>
		<li><a href="./mypost?curPage=<%=i %>"><%=i %></a></li>
		<%		} %>
		<%	} %>

		<%-- 다음 페이지로 이동 --%>
		<li><a href="./mypost?curPage=<%=paging.getCurPage() + 1 %>">&gt;</a></li>


		<%-- 다음 페이징 리스트로 이동 --%>
		<li><a href="./mypost?curPage=<%=paging.getStartPage() + paging.getPageCount() %>">&raquo;</a></li>
		
		
		<%-- 마지막 페이지 이동 --%>
		<li><a href="./mypost?curPage=<%=paging.getTotalPage() %>">마지막</a></li>
		
		<%	if(paging.getCurPage() > paging.getTotalPage()) { %>
		<script>
			alert("마지막 페이지 입니다");
			location.href = "./mypost?curPage=<%=paging.getTotalPage() %>";
		</script>
		<%	} %>
		
	</ul>
</div>