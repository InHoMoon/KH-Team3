<%@page import="web.dto.TradeImg"%>
<%@page import="web.dto.Trade"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp" %>

<!-- 거래글 상세보기 조회결과 값  -->
<% Trade updateTrade = (Trade) request.getAttribute("updateTrade"); %>

<!-- 첨부파일 상세보기 조회 결과 값 -->
<% TradeImg tradeImg = (TradeImg) request.getAttribute("tradeImg"); %>


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
	
	//파일이 없을 경우
	if(<%=tradeImg != null %>) {
		$("#beforeImg").show();
		$("#afterImg").hide();
	}
	
	//파일이 있을 경우
	if(<%=tradeImg == null %>) {
		$("#beforeImg").hide();
		$("#afterImg").show();
	}
	
	//파일 삭제 버튼(X) 처리
	$("#delImg").click(function() {
		$("#beforeImg").toggle();
		$("#afterImg").toggle();
	})
	
	
	
function updateContents() {
		
		//스마트 에디터에 작성된 내용을 #content에 반영
		oEditors.getById["content"].exec("UPDATE_CONTENTS_FIELD", [])
		
	}
})


</script>

<style>
	.thema {
	background-color: #104138; 
	color: white;
	}
</style>


<!-- <style> -->
<!-- /*   .ck-editor__editable { height: 500px; } */ -->
<!-- </style> -->



<h1>거래글 수정</h1>

<form action="./update" method="post" enctype="multipart/form-data">
	
	<input type="hidden" name="tradeno" value="<%=updateTrade.getTradeno() %>">
	
	<input type="hidden" name="saleState" value="판매중">
	
	<table  class="table table-bordered">
		<tr>
			<td class="text-center thema">제목</td>
			<td colspan="3"><input type="text" name="title" style="width: 100%;" placeholder="제목을 입력하세요" value="<%=updateTrade.getTitle() %>"></td>
			<td>
				<select class="form-control text-center" name="category"  id="category" >
					<option><%=updateTrade.getCategory() %></option>
					<option disabled>=======================</option>
					<option>가전·TV</option>
					<option>컴퓨터·태블릿·모바일</option>
					<option>자동차 용품</option>
					<option>가구</option>
					<option>식품</option>
					<option>패션·잡화·뷰티</option>
				</select>
			</td>
			<td>
				<select class="form-control text-center" name="productState" >
					<option><%=updateTrade.getProductState() %></option>
					<option disabled>=================</option>
					<option>미개봉</option>
					<option>거의 새 것</option>
					<option>사용감 있음</option>
				</select>
			</td>
			<td>
				<select class="form-control text-center" name="saleState" >
					<option><%=updateTrade.getSaleState() %></option>
					<option disabled>=================</option>
					<option>판매중</option>
					<option>예약중</option>
					<option>판매완료</option>
				</select>
			</td>
		</tr>
		
		<tr>
			<td class="text-center thema">아이디</td>
			<td class="text-center"  colspan="2"><%=session.getAttribute("userid") %></td>
			<td class="text-center thema">전화번호</td>
			<td class="text-center"><input type="text" name="userphone" value="<%=updateTrade.getUserphone() %>"></td>
			<td class="text-center thema">판매가격</td>
			<td class="text-right" ><input type="number" name="price"  placeholder="가격을 입력하세요"  value="<%=updateTrade.getPrice() %>"> 원</td>
		</tr>
		<tr>
			<td colspan="7"><textarea id="content" name="content" style="width: 100%;"  placeholder="내용을 입력하세요" ><%=updateTrade.getContent() %></textarea></td>
		</tr>
	</table>
<div id="beforeImg">
	<%	if( tradeImg != null ) { %>
	<a href="<%=request.getContextPath() %>/upload/<%=tradeImg.getStoredName() %>"
	 download="<%=tradeImg.getOriginName() %>">
		<%=tradeImg.getOriginName() %>
	</a>
	<span id="delImg" style="color: red; font-weight: bold; cursor: pointer;">X</span>
	<%	} %>
</div>

<div id="afterImg">
	새 대표 상품 이미지 <input type="file" name="file" accept="image/*">
</div>

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