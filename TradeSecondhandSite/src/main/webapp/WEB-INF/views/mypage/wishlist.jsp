<%@page import="web.dto.WishList"%>
<%@page import="util.Paging"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ include file="../layout/header.jsp"%>

<%	List<WishList> wishList = (List) request.getAttribute("wishList"); %>

<script type="text/javascript">
$(document).ready(function(){
	$("#check-all").click(function(){
		if($("#check-all").is(":checked")) $("input[name=checkbox]").prop("checked", true);
	
		else $("input[name=checkbox]").prop("checked", false);
	});
	
	$("input[name=checkbox]").click(function(){
		var total = $("input[name=checkbox]").length;
		var checked = $("input[name=checkbox]:checked").length;
		
		if(total != checked) $("#check-all").prop("checked", false);
		else $("#check-all").prop("checked", true);
	});
});
</script>

<style type="text/css">
.wishList {
	display: flex;
	flex-wrap: wrap;
}

ul {
	list-style: none;
	margin: 0px;
	padding: 0px;
}

section {
	float: left;
	
	width: 18%;
	height: 280px;
	margin: 10px;
}
</style>

<h1 style="display: inline-block;">관심 상품</h1>

<article>
	<input type="checkbox" id="check-all">
	<button class="delbtn" type="button">삭제</button>
</article>

<hr>
<%	if( wishList.size() != 0 ) { %>
<article class="wishList">
<%	for(int i=0; i<wishList.size(); i++ ) { %>
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
<%		} %>
</article>
<%	} else { %>
	<br><br>
	<div class="text-center">관심상품이 없습니다.</div>
<%	} %>

<%@ include file="../layout/footer.jsp"%>