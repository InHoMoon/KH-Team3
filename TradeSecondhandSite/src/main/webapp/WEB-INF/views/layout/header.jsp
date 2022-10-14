<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> : : : 사이트 이름 : : :</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style>
@import url('https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@100;300;400;500&display=swap');
</style>

<style type="text/css">

#menubox {

 padding : 20px 30px
}

.navbar-nav > li {
  padding-left:10px;
  padding-right:10px;
 }

.navbar-default .navbar-nav>li>a {
color : white;
}
 

#navbar-nav > li > a {
	color : white;
}

#navbar-nav >li>a:hover,
#navbar-nav >li>a:focus  {
    color: #fad703;
    background-color: transparent;
    
}

ul {
font-size: 17px;
}

.navbar-btn > button > a {
	color: #104138;
	font-weight: 500;
}

 #body {
 
 padding-top: 120px;
 
 font-family: 'Noto Sans KR', sans-serif;
 
 }

</style>

</head>
<body id="body">


<nav class="navbar navbar-default navbar-fixed-top"  style="background: #104138;color : white;">
  <div class="container-fluid"  id="menubox">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/" style="color: #fad703">사이트 로고</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav" id="navbar-nav">
        <li><a href="/notice/list" id="notice">공지사항</a></li>
        <li><a href="/trade/list" id="trade">중고거래</a></li>
        <li><a href="/mypage">마이페이지</a></li>
      </ul>

		<div class="nav navbar-form navbar-btn navbar-right" >
	      	<button class="btn btn-link" ><a href="/mypage/wishlist" style="color: #fad703;"><span class="glyphicon glyphicon-heart"></span> 관심상품</a></button>
	      	<%-- 비로그인상태 --%>
			<% if(session.getAttribute("login") == null )  { %>
	      	<button class="btn btn-default"><a href="/login">로그인</a></button>
	      	<button class="btn btn-default"><a href="/join">회원가입</a></button>
			<% } %>
			<%-- 로그인상태 --%>
			<% if(session.getAttribute("login") != null && (boolean) session.getAttribute("login" ))  { %>
			<strong  style="padding-right: 7px;"><%=session.getAttribute("usernick") %>님,안녕하세요! </strong>
			<button class="btn btn-default" onclick="location.href='/logout'">로그아웃</button><br>
			<% } %>
      </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>  





<div class="container" style="min-height: 600px">    