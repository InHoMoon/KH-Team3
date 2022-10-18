
<%@page import="web.dto.Ncomment"%>
<%@page import="java.util.List"%>
<%@page import="web.dto.Nfile"%>
<%@page import="web.dto.Notice"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 
<% Notice viewNotice = (Notice) request.getAttribute("viewNotice");%>
<% Nfile nFile = (Nfile) request.getAttribute("nFile"); %>


<%@ include file="../layout/header.jsp" %>



<script type="text/javascript">
$(document).ready(function() {

	//목록버튼
	$("#btnList").click(function() {
		history.go(-1)
		//$(location).attr('href', './list')
	})
	
	//수정버튼
	$("#btnUpdate").click(function() {
		$(location).attr('href', './update?nno=<%=viewNotice.getNno() %>')
	})
	
	//삭제버튼
	$("#btnDelete").click(function() {
		$(location).attr('href', './delete?nno=<%=viewNotice.getNno() %>')		
	})
})

</script>




<style type="text/css">

.noticepage {
	max-width: 1000px;
	min-width: 500px;
}


#noticecontent {
	min-height:250px;
}

</style>







<div class="container noticepage">




<h1>공지사항</h1><br>


<!-- ------ 게시글 본문 ---------- -->

	<div class="col-xs-6">
		<button id="btnList" class="btn" style="background-color:#fad703">목록으로</button>
	</div>
<!-- 	<div class="col-xs-6 text-right">
		<button id="btnPrePost" class="btn btn-default ">이전글</button>
		<button id="btnNextPost" class="btn btn-default ">다음글</button>		
	</div> -->
	
	<br><br>
<table class="table">
	<tr>
	<td colspan="4">글번호 : <%=viewNotice.getNno() %></td>	
	</tr>

	<tr>
	<td colspan="4" class="h3"><strong>[ <%=viewNotice.getNcategory() %> ]  <%=viewNotice.getNtitle() %></strong></td>
	</tr>
	
	<tr>
	<td>작성일자 : <%=viewNotice.getNwritedate() %></td>
	<td class="text-right">조회수 : <%=viewNotice.getNhit() %></td>
	</tr>

	
	<tr>
	<td colspan="4">
	<div id="noticecontent" style="border-bottom: 1px solid #ddd">
	<div>
		<%	if( nFile != null ) { %>  
			<img class="img-responsive center-block"  alt="" src="<%=request.getContextPath() %>/upload/<%=nFile.getNfilestoredname() %>" width="600px">
		<%	} %>
	</div><br>
	<%=viewNotice.getNcontent() %>
	</div>
	</td>
	</tr>
</table>


<!-- 첨부파일 -->
<div>
<%	if( nFile != null ) { %> 첨부파일 : 
	<a href="<%=request.getContextPath() %>/upload/<%=nFile.getNfilestoredname() %>"
	download="<%=nFile.getNfileoriginname() %>">
	<%=nFile.getNfileoriginname() %>
	</a>
<%	} %>
</div>


<!-- ------ 관리자 글수정/글삭제 버튼 ---------- -->
<%-- ------ 관리자 로그인상태 일때만 가능--------  --%>
<% if(session.getAttribute("login") != null && session.getAttribute("userid").equals("id1"))  { %>
	<div class="text-right">
		<button id="btnUpdate" class="btn" style="background-color:#104138; color: white;">글수정</button>
		<button id="btnDelete" class="btn" style="background-color:#e5e3e3">글삭제</button>
	</div>
<% } %>
<br>

<!-- ------ 댓글 부분---------- -->

<!-- 댓글 작성 -->
<script type="text/javascript">
$(document).ready(function(){
	
	
	$("#btnReply").click(function() {
		console.log("#btnReply 클릭")
		
		
		
		if( $("#ncmtcomment").val() == "" ) {
				alert('댓글을 입력해주세요!');

				$("input").eq(0).focus()
				
			}  else {
				
			var ncmtcomment = $("#ncmtcomment").val(); //댓글 내용
			var nno = "<%= viewNotice.getNno() %>"; //게시물 번호
			var userid = "<%=session.getAttribute("userid") %>"; //댓글 작성자 아이디
			
			var param={ "ncmtcomment": ncmtcomment, "nno": nno, "userid": userid};
		        //var param="ncmtcomment="+ncmtcomment+"&nno="+nno;
		
			$.ajax({
				type: "post"	//요청 메소드
				, url: "/ncmt/write"	//요청 URL
				, data: param
				, dataType: "html"	//응답 데이터의 형식
				, success: function( data ) {
					console.log("AJAX 성공")
					
					//응답 데이터 반영
					$("#listReply").html( data )
					
					//입력칸 초기화
					$("#ncmtcomment").val("")
					
				}
				, error: function() {
					console.log("AJAX 실패")
				}
			})
		}		
	})
 
})
</script>


<%-- 댓글 작성 창 (로그인 할때만 보임) --%>
<div class="form-inline">

		<textarea class="form-control" id="ncmtcomment" 
		style="resize: none; margin-right: 12px;" cols="100"
		placeholder="댓글을 작성해주세요"></textarea>
	<% if(session.getAttribute("login") != null )  { %>
		<button class="btn" type="button" id="btnReply" style="background-color:#104138; color: white;">댓글쓰기</button>
	<% } else {%>
		<p style="color: tomato;">* 로그인 후 댓글 작성이 가능합니다.</p>
	<% } %>
</div>
<br>


<% List<Ncomment> ncmtList = (List) request.getAttribute("ncmtList"); %>

<script type="text/javascript">
$(document).ready(function(){
	
	    $.ajax({
	    	
	        type: "get" //get방식으로 자료를 전달한다
	        , url: "/ncmt/list"	//요청 URL
			, data:  "nno="+<%= viewNotice.getNno() %>
			, dataType: "html"	//응답 데이터의 형식
	        , success: function(result){ //자료를 보내는것이 성 공했을때 출력되는 메시지
	        	console.log("AJAX 성공")
	            //result : responseText 응답텍스트(html)
	            $("#listReply").html(result);
	        }
	    });

})

</script>


<!-- 댓글 목록 영역 -->
<div id="listReply"></div>
 

</div>




<br><br><br>
 <%@ include file="../layout/footer.jsp" %>