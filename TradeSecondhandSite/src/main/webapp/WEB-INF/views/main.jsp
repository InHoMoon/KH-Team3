<%@page import="web.dto.Trade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layout/header.jsp" %>

<% List<Trade> newlist = (List) request.getAttribute("newlist"); %>

<style type="text/css">

.centered {

		display: block;
        margin-left: auto;
        margin-right: auto;
}

</style>





<hr>

<div>
	<form class="navbar-form" role="search" >
            <div class="input-group col-xs-6 centered"  >
               <input type="text" class="form-control input-lg" placeholder="Search"">
               <div class="input-group-btn">
                  <button type="submit" class="btn btn-default" style=" width: 60px; height: 46px;"><span class="glyphicon glyphicon-search"></span></button>
               </div>
            </div>
    </form>
</div>

<br><br>

<%@ include file="./mainSlide.jsp" %>
<br><br>

<div>

<hr>
	
	<div>
		<div class="col-md-6">
		<span>최신글</span>
		<button class="btn btn-link" ><a href="./trade/list">더보기</a></button>
		
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
		
		</div class="col-md-4">
		<div>사이트 설명</div>
	</div>


</div>

 <%@ include file="./layout/footer.jsp" %>