<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="./layout/header.jsp" %>


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
		<div>최신글</div>
		<div>사이트 설명</div>
	</div>


</div>


 <%@ include file="./layout/footer.jsp" %>