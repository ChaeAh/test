<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	      <!-- jstl 제어,대입문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      <!-- jstl 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	<!-- jstl 함수 -->  
<!DOCTYPE html>
<html lang="en">

<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Modern Business - Start Bootstrap Template</title>

  <!-- Bootstrap core CSS -->
  <link href="vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="css/modern-business.css" rel="stylesheet">

</head>

<body>

  <!-- Navigation -->
  <nav class="navbar fixed-top navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="index">커뮤니티</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
	         <li class="nav-item">
	           <a class="nav-link" href="about">소개</a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link" href="#" style="pointer-events: none; cursor: default;"> | </a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link" href="sidebar?currentPage=1&contentType=공지">공지사항</a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link" href="#" style="pointer-events: none; cursor: default;"> | </a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link" href="sidebar?currentPage=1&contentType=자유">자유게시판</a>
	         </li>
	         <li class="nav-item">
	           <a class="nav-link" href="#" style="pointer-events: none; cursor: default;"> | </a>
	         </li>
	         <li class="nav-item dropdown">
	           <a class="nav-link collapsed dropdown-toggle" href="#" id="navbarDropdownPortfolio" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
	             전공별 게시판
	           </a>
	           <div class="dropdown-menu dropdown-menu-right" aria-labelledby="navbarDropdownPortfolio">
	             <a class="dropdown-item" href="sidebar?currentPage=1&contentType=인문사회">인문사회</a>
	             <a class="dropdown-item" href="sidebar?currentPage=1&contentType=자연과학">자연과학</a>
	             <a class="dropdown-item" href="sidebar?currentPage=1&contentType=공학">공학</a>
	             <a class="dropdown-item" href="sidebar?currentPage=1&contentType=의학">의학</a>
	             <a class="dropdown-item" href="sidebar?currentPage=1&contentType=예체능">예체능</a>
	             <a class="dropdown-item" href="sidebar?currentPage=1&contentType=교육">교육</a>
	           </div>
	         </li>
	       	<li class="nav-item">
		  		<a class="nav-link" href="#" style="pointer-events: none; cursor: default;"> | </a>
		  	</li>
				<!-- 로그인시 안보이게, 회원정보, 로그아웃 보이게 -->
			<c:if test="${userVO == null}">
		        <li class="nav-item">
		          <a class="nav-link login" href="login">로그인</a>
<!-- 			          <a class="nav-link" href="#" style="pointer-events: none; cursor: default;"> | </a> -->
<!-- 			          <a class="nav-link newmember" href="register">회원가입</a> -->
		        </li>		    
         	</c:if>

			<c:if test="${userVO != null}">
				<li class="nav-item">
		  			<a class="nav-link logout" href="logout" >${userVO}님 접속 [로그아웃]</a>
			<!-- 			          <a class="nav-link" href="#" style="pointer-events: none; cursor: default;"> | </a> -->
			<!-- 			          <a class="nav-link memberinfo" href="userinfo">회원정보</a> -->
		 		</li>
<%-- 				<div id="snackbar">${userVO}님 환영합니다</div> --%>
			</c:if>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Page Content -->
  <div class="container">
    <h1 class="mt-4 mb-3">페이지 소개
    </h1>
    <ol class="breadcrumb">
      <li class="breadcrumb-item">
        <a href="index.html">Home</a>
      </li>
      <li class="breadcrumb-item active">About</li>
    </ol>
  	
  	<hr>
  	
  	<!-- 개발도구 소개 -->
    <!-- Features Section -->
    <div class="row">
      <div class="col-lg-6">
        <h1 class="mt-4 mb-3">페이지 개발도구</h1>
        <h2>사용 도구</h2>
        <ul>
          <li>
            <strong>Front-End</strong>
          </li>
          <ul>Bootstrap v4</ul>
          <ul>jQuery 3</ul>
        </ul>
        <ul>
          <li>
            <strong>Back-End</strong>
          </li>
          <ul>SPRING 3.1.1</ul>
          <ul>JDK 1.6</ul>
          <ul>Oracle DataBase 12.0.1.1</ul>
          <ul>mybatis 3.2.8</ul>
          <ul>Pivotal tc Server v4.0</ul>
          <ul>maven 2.5.1</ul>
        </ul>
        <ul>
          <li>
            <strong>Plug-in</strong>
          </li>
          <ul>naver API smart editer 2</ul>
        </ul>
      </div>
      <div class="col-lg-6">
      <br/><br/>
        <img class="img-fluid rounded" src="images/develop_Icon.png"/>
      </div>
    </div>
    <!-- /.row -->
  
	<hr>

    <!-- Page Heading/Breadcrumbs -->
    <h1 class="mt-4 mb-3">팀원소개
<!--       <small>Subheading</small> -->
    </h1>
	
<%-- 	<c:if test="${userVO != null}"> --%>
<%-- 		<div align="right" style="margin-top: -30px"><a href="memberinfo" >${userVO}님 안녕하세요.</a></div> --%>
<%-- 	</c:if> --%>
    <!-- Intro Content -->
<!--     <div class="row"> -->
<!--       <div class="col-lg-6"> -->
<!--         <img class="img-fluid rounded mb-4" src="http://placehold.it/750x450" alt=""> -->
<!--       </div> -->
<!--       <div class="col-lg-6"> -->
<!--         <h2>About Modern Business</h2> -->
<!--         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Sed voluptate nihil eum consectetur similique? Consectetur, quod, incidunt, harum nisi dolores delectus reprehenderit voluptatem perferendis dicta dolorem non blanditiis ex fugiat.</p> -->
<!--         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Saepe, magni, aperiam vitae illum voluptatum aut sequi impedit non velit ab ea pariatur sint quidem corporis eveniet. Odit, temporibus reprehenderit dolorum!</p> -->
<!--         <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Et, consequuntur, modi mollitia corporis ipsa voluptate corrupti eum ratione ex ea praesentium quibusdam? Aut, in eum facere corrupti necessitatibus perspiciatis quis?</p> -->
<!--       </div> -->
<!--     </div> -->
    <!-- /.row -->

    <!-- Team Members -->
    <h2> </h2>

    <div class="row">
		<div class="col-lg-4 mb-4">
	       <div class="card h-100 text-center">
	         <img class="card-img-top" width="750" src="img/portfolio/jeon.jpg" alt="전영진">
	         <div class="card-body">
	           <h4 class="card-title">전영진</h4>
	           <h6 class="card-subtitle mb-2 text-muted">페이지 구현</h6>
	           <p class="card-text">.</p>
	         </div>
	         <div class="card-footer">
	           <a href="#">bigship100@naver.com</a>
	         </div>
	       </div>
	     </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100 text-center">
          <img class="card-img-top" src="http://placehold.it/750x450" alt="">
          <div class="card-body">
            <h4 class="card-title">Team Member</h4>
            <h6 class="card-subtitle mb-2 text-muted">Position</h6>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
          </div>
          <div class="card-footer">
            <a href="#">name@example.com</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100 text-center">
          <img class="card-img-top" src="http://placehold.it/750x450" alt="">
          <div class="card-body">
            <h4 class="card-title">Team Member</h4>
            <h6 class="card-subtitle mb-2 text-muted">Position</h6>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
          </div>
          <div class="card-footer">
            <a href="#">name@example.com</a>
          </div>
        </div>
      </div>
      <div class="col-lg-4 mb-4">
        <div class="card h-100 text-center">
          <img class="card-img-top" src="http://placehold.it/750x450" alt="">
          <div class="card-body">
            <h4 class="card-title">Team Member</h4>
            <h6 class="card-subtitle mb-2 text-muted">Position</h6>
            <p class="card-text">Lorem ipsum dolor sit amet, consectetur adipisicing elit. Possimus aut mollitia eum ipsum fugiat odio officiis odit.</p>
          </div>
          <div class="card-footer">
            <a href="#">name@example.com</a>
          </div>
        </div>
      </div>
    </div>
    <!-- /.row -->

    <!-- Our Customers -->
    <h2>Project</h2>
    <div class="row">
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
      <div class="col-lg-2 col-sm-4 mb-4">
        <img class="img-fluid" src="http://placehold.it/500x300" alt="">
      </div>
    </div>
    <!-- /.row -->
	
	
	
	
  </div>
  <!-- /.container -->

  <!-- Footer -->
  <footer class="py-5 bg-dark">
    <div class="container">
      <p class="m-0 text-center text-white">Copyright &copy; 빛과 소금 2019</p>
    </div>
    <!-- /.container -->
  </footer>

  <!-- Bootstrap core JavaScript -->
  <script src="vendor/jquery/jquery.min.js"></script>
  <script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

</body>

</html>
