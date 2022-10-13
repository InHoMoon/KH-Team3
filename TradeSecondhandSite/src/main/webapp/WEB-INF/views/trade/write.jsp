<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<!-- 스마트에디터 2 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>

<!-- CKEditor 5 -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/ckeditor.js"></script> -->
<!-- <script src="https://cdn.ckeditor.com/ckeditor5/34.0.0/classic/translations/ko.js"></script> 한글 사용 -->



<script type="text/javascript">
$(document).ready(function(){
	
	//작성버튼
	$("#btnWrite").click(function() {
		
		//작성된 내용을 textarea에 적용
		updateContents()

		$("form").submit();
	})
	
	//취소버튼
	$("#btnCancel").click(function() {
		history.go(-1)
	})
	
	
	
function updateContents() {
		
		//스마트 에디터에 작성된 내용을 #content에 반영
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
		
	}
})


</script>


<!-- <style> -->
<!-- /*   .ck-editor__editable { height: 500px; } */ -->
<!-- </style> -->



<h1>거래글 작성</h1>

<form action="./write" method="post" enctype="multipart/form-data">

	<!-- 판매상태 정보 전달 -->
	<input type="hidden" name="saleState" value="판매중">
	
	<table  class="table table-bordered">
		<tr>
			<td class="text-center active">제목</td>
			<td colspan="3"><input type="text" name="title" style="width: 100%;" placeholder="제목을 입력하세요" ></td>
			<td>
				<select class="form-control text-center" name="category"  id="category">
					<option>카테고리 선택</option>
					<option>가전·TV</option>
					<option>컴퓨터·태블릿·모바일</option>
					<option>자동차 용품</option>
					<option>가구</option>
					<option>식품</option>
					<option>패션·잡화·뷰티</option>
				</select>
			</td>
			<td>
				<select class="form-control text-center " name="productState" >
					<option>상품 상태 선택</option>
					<option>미개봉</option>
					<option>거의 새 것</option>
					<option>사용감 있음</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td class="text-center active">아이디</td>
			<td class="text-center"><%=session.getAttribute("userid") %></td>
			<td class="text-center active">전화번호</td>
			<td class="text-center"><input type="text" name="userphone" value="<%=session.getAttribute("userphone") %>"></td>
			<td class="text-center active">판매가격</td>
			<td class="text-right"><input type="number" name="price" style="width: 90%;" placeholder="가격을 입력하세요" > 원</td>
		</tr>
		<tr>
			<td colspan="6"><textarea id="content" name="content" style="width: 100%;" placeholder="내용을 입력하세요"></textarea></td>
		</tr>
	</table>
	
대표 상품 사진 <input type="file" name="file" accept="image/*" >

</form>


<div class="text-center">
	<button id="btnWrite" class="btn btn-primary">작성</button>
	<button id="btnCancel" class="btn btn-danger">취소</button>
</div>


<!-- CKEditor -->
<!-- <script type="text/javascript"> -->
<!-- // var myEditor; -->
<!-- // ClassicEditor -->
<!-- // 	.create( document.querySelector( '#content' ), { -->
<!-- // 		language: 'ko', -->
<!-- // 		ckfinder: { -->
<!-- // 	        uploadUrl: '/trade/write' // 내가 지정한 업로드 url (post로 요청감) -->
<!-- // 		}, -->
<!-- // 		alignment: { -->
<!-- //             options: [ 'left', 'center', 'right' ] -->
<!-- //         } -->
<!-- // 	} ) -->
<!-- // 	.then( editor => { -->
<!-- //         console.log( 'Editor was initialized', editor ); -->
<!-- //         myEditor = editor; -->
<!-- //     } ) -->
<!-- // 	.catch( error => { -->
<!-- // 	    console.error( error ); -->
<!-- // 	} ); -->
<!-- </script> -->



<script type="text/javascript">
	var oEditors = [];
	nhn.husky.EZCreator.createInIFrame({ 
	oAppRef: oEditors,
 	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id 적기 
 	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
 	fCreator: "createSEditor2" 
}) 
</script>

<%@ include file="../layout/footer.jsp" %>