<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>TradeSecondHandSite</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<!-- 스마트에디터 2 -->
<script type="text/javascript" src="/resources/se2/js/service/HuskyEZCreator.js"></script>


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


</head>
<body>

<h1>게시글 작성</h1>

<form action="./write" method="post" enctype="multipart/form-data">
	<table  class="table table-bordered">
		<tr>
			<td class="text-center">제목</td>
			<td colspan="2"><input type="text" name="title" style="width: 100%;" placeholder="제목을 입력하세요" ></td>
			<td>
				<select class="form-control" name="productState" >
					<option>상품 상태</option>
					<option>미개봉</option>
					<option>거의 새 것</option>
					<option>사용감 있음</option>
				</select>
			</td>
		</tr>
		<tr>
			<td class="text-center">아이디</td>
			<td><%=session.getAttribute("userid") %></td>
			<td class="text-center">판매가격</td>
			<td class="text-right"><input type="number" name="price" placeholder="가격을 입력하세요" ></td>
		</tr>
		<tr>
			<td colspan="4"><textarea id="content" name="content" style="width: 100%;" placeholder="내용을 입력하세요"></textarea></td>
		</tr>
	</table>
</form>

<div class="text-center">
	<button id="btnWrite" class="btn btn-primary">작성</button>
	<button id="btnCancel" class="btn btn-danger">취소</button>
</div>


<script type="text/javascript">
var oEditors = [];
nhn.husky.EZCreator.createInIFrame({
	oAppRef: oEditors,
	elPlaceHolder: "content", //에디터가 적용될 <textarea>의 id 적기
	sSkinURI: "/resources/se2/SmartEditor2Skin.html",
	fCreator: "createSEditor2"
})
</script>

</body>
</html>