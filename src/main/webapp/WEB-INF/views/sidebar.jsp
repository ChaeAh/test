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
	  
	  <script src="jquery-3.3.1.js"></script>
	  <style>
		    #items{
		      cursor: pointer;
		    }ㄱ

</style>
	  <script>
		    $(document).ready(function(){
				var url = decodeURIComponent(window.location.search.substring(1));
// 				alert(decodeURIComponent);
		    	var urlSub = url.split('&');
		    	var sParameter;
		    	var sParameterName=[];
		    	var sParameterVal=[];
		    	for(i = 0; i<urlSub.length; i++){
		    		sParameter = urlSub[i].split('=');
		    		sParameterName.push(sParameter[0]);
		    		sParameterVal.push(sParameter[1]);
		    	}
 		     	
		    	if(sParameterName.length > 3){
// 		    		alert(sParameterName[2] + " " + sParameterVal[2]);		    		
					$("#gesi").attr("src", "contentView?contentType="+sParameterVal[0]+"&contentSubType="+sParameterVal[1]+"&idx="+sParameterVal[2]);
		    	}
		    	
		    	
// 		    	else{
// 		    		$("#gesi").attr("src", "list?contentType="+sParameterVal[0]+"&contentSubType="+sParameterVal[1]);
// 		    	}
		    	
// 		    	else{		    		
// 			    	alert(sParameterName + " " + sParameterVal);
// 		    	}
		    	
			  //html로 값 넘어올때 request 하기 위한 함수
// 		      $.fn.getUrlParameter = function(sParam){
// 		        var sPageURL = decodeURIComponent(window.location.search.substring(1)),
// 		        sURLVariables = sPageURL.split('&'),
// 		        sParameterName,
// 		        i;
// 		        for(i = 0; i<sURLVariables.length; i++){
// 		          sParameterName = sURLVariables[i].split('=');
// 		          if(sParameterName[0] === sParam){
// 		            return sParameterName[1] === undefined? true:sParameterName[1];
// 		          }
// 		        }
// 		      };
// 		      var idx=$("#idx").val();
// 		      alert($.fn.getUrlParameter());
// 		      var contentType = $("#contentType").val();
// 		      var currentPage = $("#currentPage").val();
//         	  alert(contentType + " " + currentPage);
// 		      $("#gesi").attr("src", "list?currentPage="+currentPage+"&contentType="+contentType);
		
// 		      $(".items").each(function(index, item){
// 				  $(item).addClass("item"+index)
// 			  });
// 		      $(".items").each(function(index, item){
// 		        $(".item" + index).click(function(){
// 		          $(this).off();
// 		          var type = $(this)attr("name");
// 		          alert(type);
// 		          $("#gesi").attr("src", "list?currentPage=1&contentType=" + type);
// 		        });
// 		      });
		    	
		    });
	  </script>
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
<%-- 					<div id="snackbar">${userVO}님 환영합니다</div> --%>
				</c:if>
		      </ul>
		    </div>
		  </div>
		</nav>
		
		<!-- Page Content -->
		<div class="container">
		
		  <!-- Page Heading/Breadcrumbs -->
		  <h1 class="mt-4 mb-3">${contentType}
<!-- 		    <small>Subheading</small> -->
		  </h1>
		<c:if test="${userVO != null}">
			<div align="right" style="margin-top: -30px"><a href="memberinfo" >${userVO}님 안녕하세요.</a></div>
		</c:if>
		
		<ol class="breadcrumb">
		  <li class="breadcrumb-item">
		    <a href="index">Home</a>
		  </li>
<!--		    <li align="right" class="breadcrumb-item active">About</li> -->
		</ol>
		  
		  
		  <!-- Content Row -->
		  <div class="row">
		    <!-- Sidebar Column -->
		    <div class="col-lg-3 mb-4">
		      <div class="list-group main-menu" id="wrapper">
		        <a class="list-group-item items" href="sidebar?currentPage=1&contentType=공지">공지</a>
		        <hr style="margin:0px; border: 0; height: 2px; background: #ccc; "/>
		        <a class="list-group-item items" href="sidebar?currentPage=1&contentType=자유">자유게시판</a>
		        <hr style="margin:0px; border: 0; height: 2px; background: #ccc; "/>
		
		        <!-- Sidebar -->
		        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		          <li class="nav-item">
		            <a class="list-group-item dropdown-toggle" href="#" data-toggle="collapse" data-target="#collapse1" aria-expanded="true" aria-controls="collapse1">
		              <!-- icon -->
		              <!-- <i class="fas fa-fw fa-cog"></i> -->
		              인문 사회
		            </a>
		            <div id="collapse1" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		                <!-- <a href="" class="list-group-item main-menu">인문 사회</a> -->
		                <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=인문사회">전체</a>
		                <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=인문사회&contentSubType=언어문학">언어 문학</a>
		                <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=인문사회&contentSubType=인문">인문</a>
		                <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=인문사회&contentSubType=경영경제">경영 경제</a>
		                <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=인문사회&contentSubType=법학">법학</a>
		                <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=인문사회&contentSubType=사회과학">사회과학</a>
		            </div>
		          </li>
		        </ul>
		
		        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		          <li class="nav-item">
		            <a class="list-group-item dropdown-toggle" href="#" data-toggle="collapse" data-target="#collapse2" aria-expanded="true" aria-controls="collapse2">
		              <!-- icon -->
		              <!-- <i class="fas fa-fw fa-cog"></i> -->
		              자연과학
		            </a>
		            <div id="collapse2" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
		                <!-- <a href="" class="list-group-item main-menu">인문 사회</a> -->
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=자연과학">전체</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=자연과학&contentSubType=자연과학">농림 수산</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=자연과학&contentSubType=화학">화학</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=자연과학&contentSubType=생명과학">생명과학</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=자연과학&contentSubType=환경">환경</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=자연과학&contentSubType=수학">수학</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=자연과학&contentSubType=물리">물리</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=자연과학&contentSubType=전문지구">천문 지구</a>
		            </div>
		          </li>
		        </ul>
		        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
		          <li class="nav-item">
		            <a class="list-group-item dropdown-toggle" href="#" data-toggle="collapse" data-target="#collapse3" aria-expanded="true" aria-controls="collapse3">
		              <!-- icon -->
		              <!-- <i class="fas fa-fw fa-cog"></i> -->
		              공학
		            </a>
		            <div id="collapse3" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                  <!-- <a href="" class="list-group-item main-menu">인문 사회</a> -->
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학">전체</a>
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학&contentSubType=전자">전자</a>
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학&contentSubType=전기">전기</a>
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학&contentSubType=컴퓨터">컴퓨터</a>
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학&contentSubType=건축">건축</a>
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학&contentSubType=산업안전">산업안전</a>
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학&contentSubType=재료">재료</a>
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학&contentSubType=기계">기계</a>
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학&contentSubType=화학">화학</a>
	                  <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=공학&contentSubType=에너지">에너지</a>
	              </div>
	            </li>
	          </ul>
	
	         <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	         	<li class="nav-item">
	            	<a class="list-group-item dropdown-toggle" href="#" data-toggle="collapse" data-target="#collapse3" aria-expanded="true" aria-controls="collapse3">
	            	의학
	            	</a>
          			<div id="collapse3" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
          				<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=의학">전체</a>
	          			<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=의학&contentSubType=간호">간호</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=의학&contentSubType=보건">보건</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=의학&contentSubType=약학">약학</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=의학&contentSubType=의예">의예</a>
						<a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=의학&contentSubType=치예">치예</a>
					</div>
              	</li>
	          </ul>
	          
	          <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">
	              <li class="nav-item">
	                <a class="list-group-item dropdown-toggle" href="#" data-toggle="collapse" data-target="#collapse4" aria-expanded="true" aria-controls="collapse4">
	                  <!-- icon -->
	                  <!-- <i class="fas fa-fw fa-cog"></i> -->
	                  예체능
	                </a>
	                <div id="collapse4" class="collapse" aria-labelledby="headingTwo" data-parent="#accordionSidebar">
	                    <!-- <a href="" class="list-group-item main-menu">인문 사회</a> -->
	                    <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=예체능">전체</a>
	                    <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=예체능&contentSubType=무용">무용</a>
	                    <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=예체능&contentSubType=체육">체육</a>
	                    <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=예체능&contentSubType=연극">연극</a>
	                    <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=예체능&contentSubType=영화">영화</a>
	                    <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=예체능&contentSubType=응용예술">응용예술</a>
	                    <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=예체능&contentSubType=미술">미술</a>
	                    <a id="items" class="list-group-item items" href="sidebar?currentPage=1&contentType=예체능&contentSubType=info">음악</a>
	                </div>
	              </li>
	            </ul>		
		          <a href="?" class="list-group-item items" href="sidebar?currentPage=1&contentType=교육">교육</a>
		      </div>
		    </div>
		    
		
		    <!-- Content Column -->
		    <div class="col-lg-9 mb-4">
		        <iframe id="gesi" src="list?currentPage=${currentPage}&contentType=${contentType}&contentSubType=${contentSubType}&select=" width="100%" height="1000" frameborder="0" border="0" scrolling="yes" bgcolor=#EEEEEE bordercolor="#FF000000" marginwidth="0" marginheight="0" name="main_frame" id="main_frame">
		          </iframe>
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
		
		<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
		<script src="vendor/jquery/jquery.min.js"></script>
	</body>
</html>
