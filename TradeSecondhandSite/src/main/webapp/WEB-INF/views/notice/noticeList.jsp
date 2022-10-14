
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

.noticepage {
width: 1000px
}

.table {

padding-top: 10px;

}

th, td {
	text-align: center;
}

.table>tbody>tr>td {
	vertical-align: middle;
	height: 70px;
    font-size: initial;
}

.table>tbody>tr>th {
	vertical-align: middle;
}


a {
	color: black;
	text-decoration: none;
}

.form-control {
	width: 20%
}




.img-wrapper {
    position: relative;
    width: 60px;
    height: 60px;
}
.img-wrapper img {
    position: absolute;
    top: 0;
    left: 0;
    transform: translate(50, 50);
    width: 100%;
    height: 100%;
    object-fit: cover;
    margin: auto;
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

<div class="container noticepage">

<h1><a href="/notice/list">공지사항</a></h1>
<hr>

	<div class="pull-left">
		<%--- 검색 시 검색어 관련 안내문 출력 --%>
		<% if( keyWord !=null ) { %>
			<div>
			[<%= keyWord %>] <%= searchWord %>의 검색 결과
			</div>
		<% } %>
	</div>
	<div class="pull-right">
		 <form action="./list" method="post" class="form-inline">
		 <input type="hidden" name="keyWord" id="keyWord"/>
			<select id="selectoption" class="form-control">
				<option value="">선택하세요</option>
				<option value="공지">공지</option>
				<option value="이벤트">이벤트</option>
			</select>
		 <input type="text" name="searchWord" class="form-control">
		 <button id="btnSearch"type="button" class="btn" style="background-color:#fad703">검색</button>
		 </form>
 </div>


<br><br><br>

<table class="table table-striped table-hover table-condensed">

<tr class="active" style="border-bottom: 1px solid; border-top: 2px solid;">
	<th style="width: 10%">NO</th>
	<th style="width: 10%">분류</th>
	<th style="width: 8%"></th>
	<th style="width: 47%">제목</th>
	<th style="width: 10%">조회수</th>
	<th style="width: 20%">작성일</th>
</tr>


<% for(int i=0; i<noticeList.size(); i++ ) { %>

	<tr id="noticetr">	
		<%	if( noticeList.get(i).getNtop() == 1 ) { %>  
			<td><span class="label label-success">공지</span></td>
		<%	} else {%>
			<td><%= noticeList.get(i).getNno() %></td>
		<%	} %>
		<td id="nlist"><%= noticeList.get(i).getNcategory() %></td>
		<td >
			<%	if( noticeList.get(i).getNfileoriginname() != null ) { %>  
			<div class="img-wrapper">
				<img  class="img-responsive img-rounded"  alt="" 
				src="<%=request.getContextPath() %>/upload/<%=noticeList.get(i).getNfilestoredname() %>"  
				>
			</div>
			<%	} %>
		</td>
		<td  style="text-align: left;">
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
<% if(session.getAttribute("login") != null && session.getAttribute("userid").equals("id1"))  { %>
<div id="btnBox" class="pull-right">
	<button id="btnWrite" class="btn" onclick="location.href='/notice/write'" >글쓰기</button><br>
</div>
<% } %>


<div class="clearfix"></div>

<% if( (Paging) request.getAttribute("paging") !=null ) { %>
<%@ include file="../layout/paging.jsp" %>
<% } %>


</div>

 <%@ include file="../layout/footer.jsp" %>
