<%@page import="web.dto.Ncomment"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
    
 <% List<Ncomment> ncmtList = (List) request.getAttribute("ncmtList"); %>
    

<script type="text/javascript">

$(document).ready(function() {
	

	$(".ncmtdel").click(function() {
		console.log("댓글 삭제 클릭")
		
		//요청을 보낸 후 응답 데이터를 #listReply객체에 반영한다
		$("#listReply").load( $(this).attr("href") )
		
		
		//<a>태그의 페이지 이동(기본 동작) 막기
		return false; 
	})

})

</script>

<style type="text/css">

#ncmttable >tbody >tr >td {
	border-top : none;
}

</style>


<% if( ncmtList == null ) { %>
	등록된 댓글이 없습니다.
<% } %>


<div style="width: 800px;" >
	<table class="table" id="ncmttable">
		<% for(int i=0; i<ncmtList.size(); i++ ) { %>
				<tr>
					<td class="text-center col-md-2"  rowspan="2"><span style="background-color:#fad703">&nbsp;&nbsp;<%= ncmtList.get(i).getUserid() %>&nbsp;&nbsp;</span></td>
					<td style="color: #a8a8a8"><%= ncmtList.get(i).getNcmtwritedate() %></td>
					<td class="text-right"><% if (session.getAttribute("userid").equals(ncmtList.get(i).getUserid()) ) { %>
						<a class="ncmtdel"  style="color: #d9534f"
						href="/ncmt/delete?nno=<%= ncmtList.get(i).getNno() %>&ncmtid=<%= ncmtList.get(i).getNcmtid() %>">삭제</a>
					<% } %>
					</td>
				</tr>
				<tr style="border-bottom: 1px solid #ccc;">
					<td colspan="2"><%= ncmtList.get(i).getNcmtcontent() %></td>
				</tr>
		<% } %>
	</table>
</div>
