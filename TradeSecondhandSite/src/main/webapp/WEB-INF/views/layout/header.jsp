<<<<<<< HEAD
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> : : : Seon : : :</title>

<!-- jQuery 2.2.4 -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
#header, #footer {
	text-align: center;
	background: #6ff;
}
</style>

</head>
<body>

<header id="header">
	<a href="/"><h1>Seon</h1></a>
</header>

<div class="container">
=======
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title> : : : 평화중고 : : :</title>

<!-- jQuery -->
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>


<!-- 부트스트랩 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<style type="text/css">
.navbar-nav > li {

  padding-left:10px;
  padding-right:10px;

 }

</style>

</head>
<body>


<nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/33">사이트 로고</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="/33/notice/list">공지사항</a></li>
        <li><a href="/33">중고거래</a></li>
        <li><a href="/33">마이페이지</a></li>
      </ul>

      <div class="nav navbar-form navbar-btn navbar-right" >
      	<button class="btn btn-link"><a href="./notice/list"><span class="glyphicon glyphicon-heart"></span> 관심상품</a></button>
      	<button class="btn btn-default"><a href="/33">로그인</a></button>
      	<button class="btn btn-default"><a href="/33">회원가입</a></button>
      </div>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>  



<%-- 로그인상태 --%>
<% if(session.getAttribute("login") != null && (boolean) session.getAttribute("login" ))  { %>
<strong><%=session.getAttribute("usernick") %>님,안녕하세요!</strong><br>
<button onclick="location.href='./member/logout'">로그아웃</button><br>
<% } %>



<div class="container">    
>>>>>>> refs/remotes/origin/master
