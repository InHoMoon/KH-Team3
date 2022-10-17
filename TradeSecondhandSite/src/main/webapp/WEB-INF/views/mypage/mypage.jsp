<%@page import="web.dto.Trade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<%	List<Trade> mypostList = (List) request.getAttribute("mypostList"); %>
<%	List<Trade> wishList = (List) request.getAttribute("wishList"); %>

<script type="text/javascript">
$(document).ready(function() {
	$(".updateInfo").click(function() {
		
		// 정보수정 - 수정페이지 연동하는 버튼입니다...수정하지 마세요......
		$(location).attr('href', '/update/user?userno=<%=session.getAttribute("userno") %>') 
		
	})
})

</script>

<style type="text/css">
ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

.wishList {
	display: flex;
	justify-content: space-evenly;
}

.my-info {
	display: flex;
	justify-content: center;
}

.my-update-info {
	font-size: 12px;
	font-weight: bold;
}

.updateInfo {
	float: right;
}

th {
	text-align: center;
}

.detail {
	float: right;
}
section {
	float: left;
	
	width: 18%;
	height: 280px;
	margin: 10px;
}

</style>

<!---------------------- 내 정보 --------------------------->

<h1>마이페이지</h1>
<hr>

<div class="my-info">
	<article class="col-md-3">	
	<img src="">
	</article>
	<article class="col-md-6">
		<div style="font-weight: bold; font-size: 25px;">내정보</div>
		<div style="font-size: 20px;">닉네임(아이디) : <%=session.getAttribute("usernick") %>(<%=session.getAttribute("userid") %>)</div>
		<div style="font-size: 20px;">회원등급 : <%=session.getAttribute("usergrade") %></div>
		<div style="font-size: 20px;">주소 : <%=session.getAttribute("useraddr2") %></div>
	</article><br>
</div>

<%	if (session.getAttribute("userid").equals("id1")) { %>
<div class="text-center"><h1>관리자 전용 페이지</h1></div>
<%	} %>
<button type="button" class="updateInfo my-update-info btn btn-default">정보수정</button><br><br>

<!--------------------- 내 게시글 -------------------------->

<h1 style="display: inline-block;">내 게시글</h1><br>
<a href="/mypage/mypost" class="detail">더보기 &gt;&gt;</a>

<table class="table table-striped table-condensed">
<tr>
	<th style="width: 5%">글번호</th>
	<th style="width: 10%">판매상태</th>
	<th style="width: 70%">제목</th>
	<th style="width: 5%">조회수</th>
	<th style="width: 10%">작성일</th>
</tr>	

<%	if(mypostList.size() != 0) { %>
	<% if(wishList.size() > 5) { %>
		<%	for(int i=0; i<5; i++) { %>
		<tr>
			<td class="text-center"><%=mypostList.get(i).getTradeno() %></td>
			<td class="text-center"><%=mypostList.get(i).getSaleState() %></td>
			<td>
				<a href="/trade/view?tradeno=<%=mypostList.get(i).getTradeno() %>">
				<%=mypostList.get(i).getTitle() %>
				</a>
			</td>
			<td class="text-center"><%=mypostList.get(i).getHit() %></td>
			<td class="text-center"><%=mypostList.get(i).getInsertDate() %></td>
		</tr>
		<%	} %>
	<%	} else { %>
		<%	for(int i=0; i<mypostList.size(); i++) { %>
		<tr>
			<td class="text-center"><%=mypostList.get(i).getTradeno() %></td>
			<td class="text-center"><%=mypostList.get(i).getSaleState() %></td>
			<td>
				<a href="/trade/view?tradeno=<%=mypostList.get(i).getTradeno() %>">
				<%=mypostList.get(i).getTitle() %>
				</a>
			</td>
			<td class="text-center"><%=mypostList.get(i).getHit() %></td>
			<td class="text-center"><%=mypostList.get(i).getInsertDate() %></td>
		</tr>
		<%	} %>
	<%	} %>
<%	} else { %>
	<tr>
		<td class="text-center" colspan="5"><br><br>게시글이 없습니다.</td>
	</tr>
<%	} %>
</table><br><br>

<!--------------------- 관심 상품 -------------------------->

<h1 style="display: inline-block;">관심 상품</h1><br>
<a href="/mypage/wishlist" class="detail">더보기 &gt;&gt;</a><br>

<%	if(wishList.size() != 0) { %>
	<article class="wishList">
	<% if(wishList.size() > 5) { %>
		<%	for(int i=0; i<5; i++) { %>
			<section>
			<input type="checkbox" name="checkbox">
			<div>
				<a href="#"><img src="#"></a>
			</div>
			<ul>
				<li>
					<a href="/trade/view?tradeno=<%=wishList.get(i).getTradeno() %>">
						<%=wishList.get(i).getSaleState() %>
						<%=wishList.get(i).getTitle() %>
					</a>
				</li>
				<li><%=wishList.get(i).getPrice() %>원</li>
			</ul>
			</section>
		<%	} %>
	<%	} else { %>
		<%	for(int i=0; i<wishList.size(); i++) { %>
			<section>
			<input type="checkbox" name="checkbox">
			<div>
				<a href="#"><img src="#"></a>
			</div>
			<ul>
				<li>
					<a href="/trade/view?tradeno=<%=wishList.get(i).getTradeno() %>">
						<%=wishList.get(i).getSaleState() %>
						<%=wishList.get(i).getTitle() %>
					</a>
				</li>
				<li><%=wishList.get(i).getPrice() %>원</li>
			</ul>
			</section>
		<%	} %>
	<%	} %>
	</article>
<%	} else { %>
	<hr><br><br>
	<div class="text-center">관심상품이 없습니다.</div>
<%	} %>
<%@ include file="../layout/footer.jsp"%>