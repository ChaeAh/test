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
  <script src="http://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g=" crossorigin="anonymous"></script>
  <script type="text/javascript" src="http://kenwheeler.github.io/slick/slick/slick.min.js"></script>
</head>

<body>
  <style>
    /*custom*/
    #totMenu{
      list-style: none;
    }
    /*회원메뉴*/
    .header-info{
      margin-top: -10px;
      width: 100%;
      float: right;
    }
    .header-info ul{
      float: right;
      list-style: none;
    }
    .header-info ul li{
      display: inline;
      padding: 4px;
      font-size: 12px;
    }
    .header-info ul li a{
        font-size: 12px;
        color: black;
    }
    #snackbar {
  visibility: hidden;
  min-width: 250px;
  margin-left: -125px;
  background-color: #333;
  color: #fff;
  text-align: center;
  border-radius: 2px;
  padding: 16px;
  position: fixed;
  z-index: 1;
  left: 50%;
  bottom: 30px;
  font-size: 17px;
}

#snackbar.show {
  visibility: visible;
  -webkit-animation: fadein 0.5s, fadeout 0.5s 2.5s;
  animation: fadein 0.5s, fadeout 0.5s 2.5s;
}

@-webkit-keyframes fadein {
  from {bottom: 0; opacity: 0;} 
  to {bottom: 30px; opacity: 1;}
}

@keyframes fadein {
  from {bottom: 0; opacity: 0;}
  to {bottom: 30px; opacity: 1;}
}

@-webkit-keyframes fadeout {
  from {bottom: 30px; opacity: 1;} 
  to {bottom: 0; opacity: 0;}
}

@keyframes fadeout {
  from {bottom: 30px; opacity: 1;}
  to {bottom: 0; opacity: 0;}
}


  </style>
<script src="http://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g=" crossorigin="anonymous"></script>
  <script>
$(document).ready(function(){
   var snackbar = document.getElementById("snackbar");
	snackbar.className = "show";
	setTimeout(function(){ snackbar.className = snackbar.className.replace("show", ""); }, 3000);
});

</script>
  <!-- Navigation -->
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
				<div id="snackbar">${userVO}님 환영합니다</div>
			</c:if>
        </ul>
      </div>
    </div>
  </nav>

  <!-- 메인 배너 -->
  <header>
    <div id="carouselExampleIndicators" class="carousel slide" data-ride="carousel">
      <ol class="carousel-indicators">
        <li data-target="#carouselExampleIndicators" data-slide-to="0" class="active"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="1"></li>
        <li data-target="#carouselExampleIndicators" data-slide-to="2"></li>
      </ol>
      <div class="carousel-inner" role="listbox">
        <!-- Slide One - Set the background image for this slide in the line below -->
        <div class="carousel-item active" style="background-image: url('images/main1.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>First Slide</h3>
            <p>This is a description for the first slide.</p>
          </div>
        </div>
        <!-- Slide Two - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('images/main2.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Second Slide</h3>
            <p>This is a description for the second slide.</p>
          </div>
        </div>
        <!-- Slide Three - Set the background image for this slide in the line below -->
        <div class="carousel-item" style="background-image: url('images/main3.jpg')">
          <div class="carousel-caption d-none d-md-block">
            <h3>Third Slide</h3>
            <p>This is a description for the third slide.</p>
          </div>
        </div>
      </div>
      <a class="carousel-control-prev" href="#carouselExampleIndicators" role="button" data-slide="prev">
        <span class="carousel-control-prev-icon" aria-hidden="true"></span>
        <span class="sr-only">Previous</span>
      </a>
      <a class="carousel-control-next" href="#carouselExampleIndicators" role="button" data-slide="next">
        <span class="carousel-control-next-icon" aria-hidden="true"></span>
        <span class="sr-only">Next</span>
      </a>
    </div>
  </header>
  
  <!-- Page Content -->  
  <div class="container">
    <div id="content3"  class="row">
      <div>
        <!-- 로그인 or 로그인폼-->
          <table align="right" width="400" height="250" style="margin-left: 50px; margin-right: 50px; margin-top: 30px">
<!--             <tr> -->
<!--               <th>ID : </th> -->
<!--               <th><input type="text" name="id"></th> -->
<!--               <th style="display: none">회원정보</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--               <th>PW : </th> -->
<!--               <th><input type="password" name="password"></th> -->
<!--               <th style="display: none">로그아웃</th> -->
<!--             </tr> -->
<!--             <tr> -->
<!--               <th><input type="submit"></th> -->
<!--             </tr> -->
			<c:if test="${userVO == null}">
			<tr>
				<td align="center" style="font-size:15px; color: gray" colspan="2">원할한 서비스 이용을 위해 로그인 해주세요.
				</td>
			</tr>
            <tr>
              	<td align="center" width="300px">
              		<button onclick="location.href='login'" style="width: 100%; list-style: none; border: 0; outline: 0; background-color: white;">
              			<div class="btn btn-success" style="width: 100%;">로그인</div>
              		</button>
   				</td>
            </tr>
            <tr>
              <td align="right"><a href="register">회원가입</a></td>
            </tr>
            </c:if>
            <c:if test="${userVO != null}">
            <tr>
            	<td align="center">
					<!-- <div align="right" style="margin-top: -30px"> --><a href="memberinfo" >${userVO}님 안녕하세요.</a><!-- </div> -->
				</td>
			</tr>
			</c:if>
          </table>
      </div>
      
      <jsp:useBean id="date" class="java.util.Date"/>
      
      <div id="mBoard">
        <div class="notice on">
            <h3><a href="#none">공지사항</a></h3>
            <c:set var="infoList" value="${infoList.boardList }"/>
           <%--  <c:if test="${vo.sub_type == '공지' }"> --%>
            <ul>
            <c:forEach var="vo" items="${infoList}">
        
            	<li>
            	 <a href="sidebar?contentType=${vo.type}&contentSubType=${vo.sub_type}&idx=${vo.idx}" >${vo.subject }</a><span class="date">    
            		<c:if test="${date.year == vo.writeDate.year && date.month ==vo.writeDate.month && date.date == vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="HH:mm:ss"/>
					</c:if>
					<c:if test="${date.year != vo.writeDate.year || date.month !=vo.writeDate.month|| date.date !=vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd(E)"/>
					</c:if>
					</span>
            	</li>
            </c:forEach>
            </ul>
        <%--     </c:if> --%>
            <a href="#" class="ir more"><span>공지사항 더보기</span></a>
        </div>
        
        <div class="tender">
            <h3><a href="#none">자유게시판</a></h3>
               <c:set var="freeList" value="${freeList.boardList }"/>
            <ul>
          <c:forEach var="vo" items="${freeList}">
          
            	<li>
            	 <a href="sidebar?contentType=${vo.type}&contentSubType=${vo.sub_type}&idx=${vo.idx}" >${vo.subject }</a><span class="date">
            		<c:if test="${date.year == vo.writeDate.year && date.month ==vo.writeDate.month && date.date == vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="HH:mm:ss"/>
					</c:if>
					<c:if test="${date.year != vo.writeDate.year || date.month !=vo.writeDate.month|| date.date !=vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd(E)"/>
					</c:if>
            	 </span>
            	</li>
            </c:forEach> 
        </ul>
            <a href="#" class="ir more"><span>자유게시판 더보기</span></a>
        </div>            
  
        <div class="report" >
            <h3><a href="#none">전공게시판</a></h3>
            <ul>		
                <c:set var="majorList" value="${majorList.boardList }"/>
          <c:forEach var="vo" items="${majorList}">
            	<li>
            	 <a href="sidebar?contentType=${vo.type}&contentSubType=${vo.sub_type}&idx=${vo.idx}" >[${vo.type}]${vo.subject }</a><span class="date">
             		<c:if test="${date.year == vo.writeDate.year && date.month ==vo.writeDate.month && date.date == vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="HH:mm:ss"/>
					</c:if>
					<c:if test="${date.year != vo.writeDate.year || date.month !=vo.writeDate.month|| date.date !=vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd(E)"/>
					</c:if>
            	 </span>
            	</li>
            </c:forEach> 
              <!--   <li>
                    <a href="#" >인천관광공사, 트립어드바이저와 업무협약 체결</a><span class="date">2018.05.15</span>
                </li> -->
            </ul>
            
        </div>
        
        <div class="recruit">
            <h3><a href="#none">HIT</a></h3>
                <ul>
			       <c:set var="hitList" value="${hitList.boardList }"/>
			          <c:forEach var="vo" items="${hitList}">
			            	<li>
			            	 <a href="sidebar?contentType=${vo.type}&contentSubType=${vo.sub_type}&idx=${vo.idx}" >[${vo.type}]${vo.subject }</a><span class="date">
	            				<c:if test="${date.year == vo.writeDate.year && date.month ==vo.writeDate.month && date.date == vo.writeDate.date }">
									<fmt:formatDate value="${vo.writeDate }" pattern="HH:mm:ss"/>
								</c:if>
								<c:if test="${date.year != vo.writeDate.year || date.month !=vo.writeDate.month|| date.date !=vo.writeDate.date }">
									<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd(E)"/>
								</c:if>
			            	 </span>
			            	</li>
			            </c:forEach> 
                </ul>
        </div>
        
        <div class="form">
		  <h3><a href="#none">best글</a></h3>
		  <ul>    
		 <c:set var="likeBoard" value="${likeBoard }"/>
          <c:forEach var="vo" items="${likeBoard}">
            	<li>
            	 <a href="sidebar?contentType=${vo.type}&contentSubType=${vo.sub_type}&idx=${vo.idx}" >[${vo.type}]${vo.subject }</a><span class="date">
             		<c:if test="${date.year == vo.writeDate.year && date.month ==vo.writeDate.month && date.date == vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="HH:mm:ss"/>
					</c:if>
					<c:if test="${date.year != vo.writeDate.year || date.month !=vo.writeDate.month|| date.date !=vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd(E)"/>
					</c:if>
            	 </span>
            	</li>
            </c:forEach> 
		  </ul>
		</div>
    </div><!--게시글 미리보기-->
    
    <script type="text/javascript">
    //<![CDATA[
      $(window).ready(function(){
        $("#mBoard>div>h3>a").click(function(){
          $("#mBoard>div").removeClass('on');
          $(this).parent().parent().addClass('on');
        });
      });
    //]]>
    </script><!--게시글 탭바-->


	
    <!-- 바로가기 버튼 -->  
    <div class="container">
<!--       <hr class="star-dark mb-5"> -->
      <h2 class="text-center text-uppercase text-secondary mb-5" style="margin-top:3rem">전공 게시판 바로가기</h2>
      <div class="row">
        <div class="col-md-6 col-lg-4">
          <a class="portfolio-item d-block mx-auto" href="sidebar?currentPage=1&contentType=인문사회">
            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                <i class="fas fa-search-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" alt="인문사회" src="img/portfolio/cabin.png">
            <p align="center">인문사회</p>
          </a>
        </div>
        <div class="col-md-6 col-lg-4">
          <a class="portfolio-item d-block mx-auto" href="sidebar?currentPage=1&contentType=자연과학">
            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                <i class="fas fa-search-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" alt="자연과학" src="img/portfolio/cake.png">
            <p align="center">자연과학</p>
          </a>
        </div>
        <div class="col-md-6 col-lg-4">
          <a class="portfolio-item d-block mx-auto" href="sidebar?currentPage=1&contentType=공학">
            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                <i class="fas fa-search-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" alt="공학" src="img/portfolio/circus.png">
            <p align="center">공학</p>
          </a>
        </div>
        <div class="col-md-6 col-lg-4">
          <a class="portfolio-item d-block mx-auto" href="sidebar?currentPage=1&contentType=의학">
            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                <i class="fas fa-search-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" alt="의학" src="img/portfolio/game.png">
            <p align="center">의학</p>
          </a>
        </div>
        <div class="col-md-6 col-lg-4">
          <a class="portfolio-item d-block mx-auto" href="sidebar?currentPage=1&contentType=예체능">
            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                <i class="fas fa-search-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" alt="예체능" src="img/portfolio/safe.png">
            <p align="center">예체능</p>
          </a>
        </div>
        <div class="col-md-6 col-lg-4">
          <a class="portfolio-item d-block mx-auto" href="sidebar?currentPage=1&contentType=교육">
            <div class="portfolio-item-caption d-flex position-absolute h-100 w-100">
              <div class="portfolio-item-caption-content my-auto w-100 text-center text-white">
                <i class="fas fa-search-plus fa-3x"></i>
              </div>
            </div>
            <img class="img-fluid" alt="교육" src="img/portfolio/submarine.png">
            <p align="center">교육</p>
          </a>
        </div>
      </div>
    </div>
  
    
    
  </div>
  <!-- /.container -->
  </div>

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

</html>
</body>
