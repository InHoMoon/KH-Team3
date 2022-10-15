<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<!-- 스마트 에디터2 설치 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>


<script type="text/javascript">
$(document).ready(function() {
	
	
	$("#ncategory").change(function() {
		ntitle.focus()
	})
	
	
	//작성버튼
	$("#btnWrite").click(function() {
		console.log("작성 버튼 클릭");
		
		//작성된 내용을 <textarea>에 적용하기
		updateContents();
		
		//폼 제출
		$("form").submit();
		
		//** submit 전에 에디터 작성내용이 반영되도록 작성할 것
		
	})
	
	//취소버튼
	$("#btnCancel").click(function() {
		history.go(-1)
	})
	
	$("#upload").change(function( e ) {
		console.log("#upload change")
 
		var files = e.target.files;
		
		//미리보기는 이미지만 처리할 수 있도록 적용
		if( !files[0].type.includes( "image") ) {
		
			
			//이벤트 처리 중단시키기
			return false;
			
		}
		
		//---------------------------
		
		//FileReader 객체 생성
		var reader = new FileReader();
		
		// FileTeader가 파일의 내용을 전부 읽어들여
		//메모리에 로드 되었을 때 발생하는 이벤트 처리
		reader.onload = function( ev ) {
			console.log( ev.target.result )
			console.log( this.result ) //ev.target.result와 같은 식
		
		
			//이미지를 새롭게 선택할 때마다 #preview의 이전 이미지를 지우고
			//한 장만 유지되도록 한다
			$("#preview").html(
				$("<img>").attr( {
					"src": ev.target.result
					,"width" : 200
				})
			)
		}
		
		//선택된 파일을 DataURL 형식으로 읽어들이기
		reader.readAsDataURL( files[0])
		
	})	
	
})



function updateContents() {
	
	//스마트 에디터에 작성된 내용을 #ncontent에 반영한다
	oEditors.getById["ncontent"].exec("UPDATE_CONTENTS_FIELD", [])
	
}

</script>

<style type="text/css">

.noticepage {
	max-width: 1000px;
	min-width: 500px;
}

</style>
 
 
<div class="container noticepage">
 
	<h1>글쓰기</h1>
	<hr>
	<br>
	 
	 
	<form action="./write" method="post" enctype="multipart/form-data">
	
		<input type="checkbox" id="ntop" name="ntop" value="1">
		<label for="ntop"> 이 게시물을 상단에 고정</label>
		
		<table class="table">
			<tr>
				<td class="col-xs-3">
					<select class="form-control text-center" name="ncategory" id="ncategory" required>
						<option>선택하세요</option>
						<option>공지</option>
						<option>이벤트</option>
					</select>
				</td> 
			<td><input class="form-control required " type="text" name="ntitle" id="ntitle" style="width:100%" placeholder="제목을 입력하세요" required></td>
			</tr>
			<tr> <td class="info" colspan="2" style="background-color:#f8f3e8">본문</td></tr>
			<tr> <td colspan="2"><textarea id="ncontent" name="ncontent" style="width:100%" required></textarea></td></tr>
		</table>
		
		첨부파일 <input type="file" name="file" id="upload">
		<div id="preview"></div>
		
	</form>
		 	 
	<div class="text-right">
		<button id="btnWrite" class="btn" style="background-color:#fad703">작성</button>
		<button id="btnCancel" class="btn" style="background-color:#e5e3e3">취소</button>
	</div>

</div>

<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "ncontent",	//에디터가 적용될 <textarea>의 id 적기
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"	
})
</script>





<%@ include file="../layout/footer.jsp" %>