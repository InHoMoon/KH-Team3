<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<%-- 댓글 리스트 객체 받음 --%>   


<div>


	<table>
		<tr>
			<th>댓글번호</th>
			<th>아이디</th>
			<th>댓글내용</th>
			<th>작성일</th>
			<th>수정/삭제 버튼</th>
		</tr>
		
		<% for(int i=0; i<ncmtList.size(); i++ ) { %>
			<tr>
				<td><%= ncmtList.get(i).getNcmtid() %></td>
				<td><%= ncmtList.get(i).getUserno() %></td>
				<td><%= ncmtList.get(i).getNcmtcontent() %></td>
				<td><%= ncmtList.get(i).getNcmtwritedate %></td>
				<td><%= ncmtList.get(i).getNcategory() %></td>
				<td>버튼</td>
			</tr>
		<% } %>
	
	</table>

</div>





</body>
</html>