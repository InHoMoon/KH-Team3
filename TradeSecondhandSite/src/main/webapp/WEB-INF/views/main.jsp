<%@page import="web.dto.Trade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layout/header.jsp" %>

<% List<Trade> newlist = (List) request.getAttribute("newlist"); %>
<% int newPostCnt = (int) request.getAttribute("newPostCnt"); %>

<style type="text/css">

.centered {

		display: block;
        margin-left: auto;
        margin-right: auto;
}


#mainSearchbtn {
	width: 60px; 
	height: 46px; 
	background-color:#fad703;
	color: #104138;

}

</style>

<script type="text/javascript">
$(document).ready(function() {
	
	$("#mainSearchbtn").click(function() {
			
			if( $("#searchText").val() == "" ) {
				$("#search_keyword").css("display", "")

				$("input").eq(0).focus()
				
			}  else {
				$(this).parents("form").submit(); // 로그인 폼 제출
			}
			
		})
	
})
</script>
<div class="text-center"><span  id="search_keyword"  style="color:tomato; display: none;" >&nbsp; 검색어를 입력해주세요!</span></div>
<div>
	<form action="/trade/list" method="post" name="search">		
	        <input  class="form-control" type="hidden" name="searchField" value="title">
            <div class="input-group col-xs-6 centered"  >
	           <input type="text" class="form-control input-lg" placeholder="찾으시는 물건을 입력해주세요 :D" name="searchText" id="searchText">
               <div class="input-group-btn">
                  <button type="button" class="btn btn-default" id="mainSearchbtn"><span class="glyphicon glyphicon-search"></span></button>
               </div>
            </div>
    </form>
</div>


<div class="text-center" style="padding: 20px;">
	오늘 하루 <sapn style="color: red;"><%= newPostCnt %></sapn>개의 중고거래 글이 새로 등록되었어요!
</div>

<%@ include file="./mainSlide.jsp" %>
<br><br>

<div>
<hr>
	<!-- 최신 글목록 영역 (왼)  -->
	<div>
		<div class="col-md-6">
			<div>
			<span style="font-size: 25px;">최신글 </span>
			<a href="./trade/list">더보기</a>
			</div>
		<table class="table table-striped table-hover table-condensed">
		<tr>
			<th style="width: 10%">NO</th>
			<th style="width: 15%">구분</th>
			<th style="width: 45%">제목</th>
			<th style="width: 10%">가격</th>
			<th style="width: 20%">작성일</th>
		</tr>
		
		<% for( int i=0; i<newlist.size(); i++ ) { %>
		<tr>
			<td><%= newlist.get(i).getTradeno() %></td>
			<td><%= newlist.get(i).getCategory() %></td>
			<td  style="text-align: left; padding-left: 20px;">
				<a href="./trade/view?tradeno=<%= newlist.get(i).getTradeno() %>">
						<%= newlist.get(i).getTitle() %>
				</a>
			</td>
			<td><%= newlist.get(i).getPrice() %></td>
			<td><%= newlist.get(i).getInsertDate() %></td>
		</tr>
		<% } %>
		</table>
		
	<!-- 최신 글목록 영역 (왼)  -->		
		</div class="col-md-4">
			
		    	<div class="col-md-6">
		     		<img  class="img-responsive" src="/resources/image/sitepic.jpg" alt=""  >
			    <div>
			        <h3>마중마켓</h3>
			       	<p>마중마켓은. 마음에 쏙 드는 중고거래를 제공하는 온라인 중고거래 플랫폼입니다.
			       	마중마켓에서 다양한 중고거래 상품을 만나보실 수 있습니다.</p>
			    </div>
		   		</div>


		</div>


</div>

 <%@ include file="./layout/footer.jsp" %>