<%@page import="java.util.ArrayList"%>
<%@page import="org.apache.ibatis.session.SqlSession"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	      <!-- jstl 제어,대입문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      <!-- jstl 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	<!-- jstl 함수 -->    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판</title>
<style>
 body {

 font-family: a타이틀고딕2;
 }
 a {
 text-decoration: none;
 color: black;
 }
 a:hover {
 	text-decoration: none;
 	color :red;
 }
 a:active {
 	text-decoration: none;
 	color: black;
 }
 .button {
 	background-color: white;
 	border:  none;
 	font-family: a타이틀고딕3;
 	text-decoration: none;
 	padding: 10px 10px;
 	margin: 1px;
 }
 .button:hover {
 	border:  #AD7FB0 2px solid;
 	transition : 0.2s;
 	padding : 5px 5px;
 }
</style>
    <script src="http://code.jquery.com/jquery-3.2.1.slim.min.js" integrity="sha256-k2WSCIexGzOj3Euiig+TlR8gA0EmPjuc79OEeY5L45g=" crossorigin="anonymous"></script>
	<script>
	    $(document).ready(function(){
	        $("#write_content").click(function(){
	            var loginCheck = $("#loginCheck").val();
	            if(loginCheck==''){
	                alert("글을 작성하려면 로그인이 필요합니다.");	                
	            }
	            else{
	            	location.replace('insert');
	            }
	        })
	    });
	</script>
</head>
<body>
	<c:set var="list" value="${boardList.boardList }"/>
	<jsp:useBean id="date" class="java.util.Date"/>
	<div id="table">
	<table width="800" align="left" border="1" cellspacing="0" cellpadding="7">
<%-- 	<c:if test="${userVO ==null}"> --%>
<!--    <tr> -->
<!--       <td align="right" colspan="6"> -->
<!--          <a href="login">로그인</a> -->
<!--       </td> -->
<!--    </tr> -->
<%--    </c:if> --%>
<%--    <c:if test="${userVO !=null}"> --%>
<!--    <tr> -->
<!--       <td align="right" colspan="6"> -->
<%--          ${userVO}님 안녕하세요  --%>
<!--          <a href="logout" class="logout_btn">logout</a> -->
<!--       </td> -->
<!--    </tr> -->
<%--    </c:if> --%>
		<tr><th colspan="6"  style="background: #93A9D1; color: white;">게시판</th></tr>
<%-- 		<tr><td colspan="6" align="right">${boardList.totalCount } ( ${boardList.currentPage} / ${boardList.totalPage })Page</td></tr> --%>
		<tr>
			 <td align="center" width="50">글번호</td>
			 <td  align="center" width="100">말머리</td>
			 <td  align="center">제목</td>
			 <td  align="center" width="100">작성자</td>
			 <td  align="center" width="50">조회수</td>
			 <td  align="center">작성일</td>
		</tr>
			<c:if test="${list.size() ==0 }">
				<tr>
					<td colspan="6" align="center">
						<marquee>테이블에 저장된 정보가 없습니다.</marquee>
					</td>
				</tr>
			</c:if>
			<c:if test="${list.size() !=0}">
				<c:forEach var="vo" items="${list}">
				<tr>
					<td align="center">${vo.idx }</td>
					<td align="center">${vo.sub_type }		
					</td>
					<c:set var="subject"  value="${fn:replace(vo.subject, '<', '&lt;') }"/>
					<c:set var="subject"  value="${fn:replace(subject, '>', '&gt;') }"/>
					<c:set var="subject"  value="${fn:replace(subject, rn, '</br>') }"/>
					<c:set var="subject"  value="${fn:trim(subject) }"/>
					<td align="center">
					
					<c:if test="${date.year == vo.writeDate.year && date.month ==vo.writeDate.month && date.date == vo.writeDate.date }">
						<img src="images/ic_new.gif"/>
					</c:if>
						<a href="increment?idx=${vo.idx}&currentPage=${boardList.currentPage}&recurrentPage=1&contentType=${contentType}&contentSubType=${contentSubType}" >
							${subject} (${vo.commentCount})
						</a>
						<c:if test="${vo.hit >=10 }">
							<img src="images/hot.gif"/>
						</c:if>
					</td>
					<c:set var="name"  value="${fn:replace(vo.name, '<', '&lt;') }"/>
					<c:set var="name"  value="${fn:replace(name, '>', '&gt;') }"/>
					<c:set var="name"  value="${fn:replace(name, rn, '</br>') }"/>
					<c:set var="name"  value="${fn:trim(name) }"/>
					<td align="center">${name}</td>
					<td align="center">${vo.hit }</td>
					<td align="center">
					<c:if test="${date.year == vo.writeDate.year && date.month ==vo.writeDate.month && date.date == vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="HH:mm:ss"/>
					</c:if>
					<c:if test="${date.year != vo.writeDate.year || date.month !=vo.writeDate.month|| date.date !=vo.writeDate.date }">
					<fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd(E)"/>
					</c:if>
					</td>
				</tr>
				</c:forEach>
			</c:if>
			
			<tr>
			<td align="center" colspan="6" >
			<c:if test="${boardList.startPage >1 }">
				<input type="button" class="button button2" title="처음 페이지로"  value="처음" onclick="location.href='?currentPage=1&contentType=${contentType }&contentSubType=${contentSubType }'"/> 
				<input type="button" class="button button2" title="이전 10페이지"  value="-10Page" onclick="location.href='?currentPage=${boardList.startPage-10}&contentType=${contentType }&contentSubType=${contentSubType }'"/>
			</c:if>

			<c:if test="${ boardList.currentPage >boardList.startPage}">
					<button class="button button2" value="이전" title="${i}번째 페이지로 이동합니다." 
						onclick="location.href='?currentPage=${boardList.currentPage -1}&contentType=${contentType }&contentSubType=${contentSubType }'">이전</button>
			</c:if>
			
			<c:if test="${ boardList.currentPage <boardList.startPage}">
					<button class="button button2" value="이전" title="이전페이지가 없습니다." 
						disabled="disabled">이전</button>
			</c:if>	

			<c:forEach var="i" begin="${boardList.startPage}" end="${boardList.endPage}" step="1">
				<c:if test="${i == boardList.currentPage}">
					<button class="button button2" style=" border: #AD7FB0 2px solid" disabled="disabled" title="현재 페이지입니다." value="${i}" >${i}</button>
				</c:if>
				<c:if test="${i != boardList.currentPage}">
					<button class="button button2" value="${i}" title="${i}번째 페이지로 이동합니다." 
						onclick="location.href='?currentPage=${i}&contentType=${contentType }&contentSubType=${contentSubType }'">${i}</button>
				</c:if>
			</c:forEach>
						
			<!-- currentPage가 totalPage보다 작으면  다음페이지가 있다. -->
				<c:if test="${ boardList.currentPage <boardList.totalPage}">
					<button class="button button2" value="다음" title="${i}번째 페이지로 이동합니다." 
						onclick="location.href='?currentPage=${boardList.currentPage +1}&contentType=${contentType }&contentSubType=${contentSubType }'">다음</button>
				</c:if>
				
			
			<!--  endPage가 totalPage보다 작으면 이전 10페이지가 있다. -->
			<c:if test="${boardList.endPage < boardList.totalPage }">
				<input type="button" class="button button2" title="+10Page"  value="+10Page" onclick="location.href='?currentPage=${boardList.endPage +1}&contentType=${contentType }&contentSubType=${contentSubType }'"/>
				<input type="button" class="button button2" title="마지막"  value="끝" onclick="location.href='?currentPage=${boardList.totalPage}&contentType=${contentType }&contentSubType=${contentSubType }'"/> 
			</c:if>
			
			</td>
	</tr>
	<tr>
		<input type="hidden" id="loginCheck" value="${userVO}">
		<input type="hidden" id="user_idx" value="${user_idx }">
<%-- 		<c:if test="${userVO eq ''}"> --%>
		<td  colspan="6" align="right"><input type="button" class="button" id="write_content" value="글쓰기" onclick=""/></td>
<%-- 		</c:if> --%>
	</tr>
	<tr>
		<td  colspan="6" align="center">
			<form action="list" method="post">
				<input type="hidden" name="contentType" value="${contentType}" >
				<input type="hidden" name="contentSubType" value="${contentSubType}" >
				<select name="select" id="select">
					<option >제목</option>
					<option >타입</option>
					<option >내용</option>
					<option >작성자</option>
				</select>
				<input type="text" name="search" id="search"/>
				<input type="submit" class="button" value="검색"/>
			</form>
		</td>
	</tr>
	</table>	
	</div>
</body>
</html>