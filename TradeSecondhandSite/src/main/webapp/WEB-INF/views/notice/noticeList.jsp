<%@page import="web.dto.NoticeImage"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<% List<NoticeImage> noticeList = (List) request.getAttribute("noticeList"); %>
<%-- List<Notice> noticeList = (List) request.getAttribute("noticeList"); --%>
<% String keyWord = (String) request.getAttribute("keyWord"); %>    
<% String searchWord = (String) request.getAttribute("searchWord"); %>    

<style type="text/css">
th, td {
	text-align: center;
}

.table>tbody>tr>td {
	vertical-align: middle;
}

.table>tbody>tr>th {
	vertical-align: middle;
}

/* td:nth-child(2) {
	text-align: justify;
} */

a {
	color: black;
	text-decoration: none;
}

.form-control {
	width: 20%
}
</style>


<script type="text/javascript">
$(document).ready(function() {
	
	
	//글쓰기 버튼
	$("#btnWrite").click(function() {
		location.href = "./write"
	})
	
	//셀렉트 옵션값을 인풋 텍스트로 넣기
	$("#selectoption").change(function() {
		console.log("값변경테스트: " + $(this).val());
		$("#keyWord").val($(this).val());
	})
	
	
	//검색 폼 제출 버튼
	$("#btnSearch").click(function() {
		$("form").submit();
	})
	
	
})
</script>


<h1><a href="/notice/list">공지사항</a></h1>
<hr>
<br><br>

<%--- 검색 시 검색어 관련 안내문 출력 --%>
<% if( keyWord !=null ) { %>
	<div>
	[<%= keyWord %>] <%= searchWord %>의 검색 결과
	</div>
<% } %>


<table class="table table-striped table-hover table-condensed">

<tr>
	<th style="width: 10%">NO</th>
	<th style="width: 15%">분류</th>
	<th style="width: 10%">사진</th>
	<th style="width: 30%">제목</th>
	<th style="width: 10%">조회수</th>
	<th style="width: 20%">작성일</th>
</tr>


<% for(int i=0; i<noticeList.size(); i++ ) { %>

	<tr style="height : 20px;">
	
		<%	if( noticeList.get(i).getNtop() == 1 ) { %>  
			<td><span class="label label-success">공지</span></td>
		<%	} else {%>
			<td><%= noticeList.get(i).getNno() %></td>
		<%	} %>
		<td id="nlist"><%= noticeList.get(i).getNcategory() %></td>
		<td>
			<%	if( noticeList.get(i).getNfileoriginname() != null ) { %>  
				<img object-fit="contain" class="img-responsive img-rounded"  alt="" 
				src="<%=request.getContextPath() %>/upload/<%=noticeList.get(i).getNfilestoredname() %>"  
				style="height: 50px">
			<%	} %>
		</td>
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

<% if( (Paging) request.getAttribute("paging") !=null ) { %>
<%@ include file="../layout/paging.jsp" %>
<% } %>

 <div>
	 <form action="./list" method="post" class="form-inline">
	 <input type="hidden" name="keyWord" id="keyWord"/>
		<select id="selectoption" class="form-control">
			<option value="">선택하세요</option>
			<option value="공지">공지</option>
			<option value="이벤트">이벤트</option>
		</select>
	 <input type="text" name="searchWord" class="form-control">
	 <button id="btnSearch"type="button" class="btn btn-primary">검색</button>
	 </form>
 </div>


 <%@ include file="../layout/footer.jsp" %>
