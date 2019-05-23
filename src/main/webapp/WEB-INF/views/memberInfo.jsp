<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	      <!-- jstl 제어,대입문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      <!-- jstl 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	<!-- jstl 함수 -->   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
 body {
 font-family: a타이틀고딕2;
 }
 .button {
 	border-color#9BB7D4;
 	border:1.5px solid;
 	background: white;
 	font-weight: bold;
 	padding : 8px 8px;
 	font-family: a타이틀고딕2;
 }
</style>
</head>
<body>
<form action="" method="post">
<table width="500" border="3" align="center" cellspacing="0" cellpadding="5">
   <tr><th colspan="6" style="background: #93A9D1; color: white;">회원정보</th></tr>
   <tr>
   		<td>
   			아이디 : ${user.id}
     	</td>
   </tr>
   <tr>
   		<td>
   			이름 : ${user.name}
     	</td>
   </tr>
   <tr>
   		<td>
   		비밀번호 : 
   			<input type="text" name="member_pw" value="">
   			<input type="hidden"  value="돌아가기">
     	</td>
   </tr>
   <tr>
   		<td>
  			<input id="member_change" type="button" class="button" value="여지"/>
  			<input id="member_back" type="button" class="button" value="돌아가기" onclick="location.href='index'">
     	</td>
   </tr>
   </table>
</form>
</body>
</html>