
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>


<script type="text/javascript">
$(document).ready(function(){
	
	$("#btnReply").click(function() {
		console.log("#btnReply 클릭")
		
		var ncmtcomment = $("#ncmtcomment").val(); //댓글 내용
		var nno = "<%=viewNotice.getNno() %>"; //게시물 번호
		var userid = "<%=session.getAttribute("userid") %>"; //댓글 작성자 아이디
		var param={ "ncmtcomment": ncmtcomment, "nno": nno, " userid": userid};
	        //var param="ncmtcomment="+ncmtcomment+"&nno="+nno;

		
		$.ajax({
			type: "post"	//요청 메소드
			, url: "/ncmt/write"	//요청 URL
			, data: param
			
			, dataType: "html"	//응답 데이터의 형식
			, success: function( data ) {
				console.log("AJAX 성공")
				
				//응답 데이터 반영
				$("#result").html( data )
				
				//입력칸 초기화
				$("#ncmtcomment").val("")
				
				
			}
			, error: function() {
				console.log("AJAX 실패")
			}
		})
				
	})
 
})
</script>


<script type="text/javascript">
function listReply(){
    $.ajax({
        type: "get", //get방식으로 자료를 전달한다
        url: "/ncmt/list?nno=<%=viewNotice.getNno() %>", 
        success: function(result){ //자료를 보내는것이 성 공했을때 출력되는 메시지
            //result : responseText 응답텍스트(html)
            $("#listReply").html(result);
        }
    });
}
</script>


<%-- 댓글 작성 창 (로그인 할때만 보임) --%>

<div style="width:700px;">


<% if(session.getAttribute("login") != null )  { %>

	<p>로그인 아이디 : <%=session.getAttribute("userid") %></p>
	<p> 게시글 번호 : <%=viewNotice.getNno() %></p>
	<textarea rows="5" cols="80" id="ncmtcomment" placeholder="댓글을 작성하세요"></textarea>
	<br>
	<!-- 댓글쓰기 버튼을 누르면 id값인 btnReply값이 넘어가서 -->
	<!-- 위쪽에 있는 스크립트 구문이 실행되고 -->
	<!-- 내가 댓글을 작성한 값이 스크립트문을 거쳐서 컨트롤러로 맵핑되게 된다. -->
	<button type="button" id="btnReply">댓글쓰기</button>
	
<% } %>




<!-- 댓글 목록 -->
<!-- 댓글이 등록이 되면 listReply에 댓글이 쌓이게 된다 -->
<div id="listReply"></div>
<div id="result"></div>
