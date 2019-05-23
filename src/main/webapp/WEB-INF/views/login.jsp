<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인</title>
<style>
 *:focus { outline:none; }
 #login_btn {
   -moz-box-shadow:inset 0px 1px 0px 0px #f7c1e8;
   -webkit-box-shadow:inset 0px 1px 0px 0px #f7c1e8;
   box-shadow:inset 0px 1px 0px 0px #f7c1e8;
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #f2c6de), color-stop(1, #ffc4e3) );
   background:-moz-linear-gradient( center top, #f2c6de 5%, #ffc4e3 100% );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#f2c6de', endColorstr='#ffc4e3');
   background-color:#f2c6de;
   -webkit-border-top-left-radius:20px;
   -moz-border-radius-topleft:20px;
   border-top-left-radius:20px;
   -webkit-border-top-right-radius:20px;
   -moz-border-radius-topright:20px;
   border-top-right-radius:20px;
   -webkit-border-bottom-right-radius:20px;
   -moz-border-radius-bottomright:20px;
   border-bottom-right-radius:20px;
   -webkit-border-bottom-left-radius:20px;
   -moz-border-radius-bottomleft:20px;
   border-bottom-left-radius:20px;
   text-indent:-0.76px;
   border:1px solid #f08bd5;
   display:inline-block;
   color:#ffffff;
   font-family:Arial Black;
   font-size:15px;
   font-weight:bold;
   font-style:normal;
   height:25px;
   line-height:25px;
   width:70px;
   text-decoration:none;
   text-align:center;
   text-shadow:1px 1px 0px #ff008c;
}
#login_btn:hover {
   background:-webkit-gradient( linear, left top, left bottom, color-stop(0.05, #ffc4e3), color-stop(1, #f2c6de) );
   background:-moz-linear-gradient( center top, #ffc4e3 5%, #f2c6de 100% );
   filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#ffc4e3', endColorstr='#f2c6de');
   background-color:#ffc4e3;
}#login_btn:active {
   position:relative;
   top:1px;
}
 
 
 
 
table.viewtable1 {
    border-collapse: collapse;
    align-content :center;
    text-align: left;
    line-height: 1.5;
    border-top: 1px solid #ccc;
    border-bottom: 1px solid #ccc;
    margin: 20px 10px;
}
table.viewtable1 thead th {
    width: 150px;
    padding: 10px;
    font-weight: bold;
    vertical-align: top;
    color: #fff;
    background: #e7708d;
    margin: 20px 10px;
}

table.viewtable1 tbody th {
    padding: 5px;
}
table.viewtable1 td {
    padding: 5px;
     border: 2px solid Pink;
    vertical-align: top;
}
table.viewtable1 .even {
    background: #fdf3f5;
}
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function(){
///////////////////////////////////////////////////////////////////////////
		var url = decodeURIComponent(window.location.search.substring(1));
//			alert(decodeURIComponent);
    	var urlSub = url.split('&');
    	var sParameter;
    	var sParameterName=[];
    	var sParameterVal=[];
    	for(i = 0; i<urlSub.length; i++){
    		sParameter = urlSub[i].split('=');
    		sParameterName.push(sParameter[0]);
    		sParameterVal.push(sParameter[1]);
    	}
	     	
    	if(sParameterName.length == 3){
//	    		alert(sParameterName[2] + " " + sParameterVal[2]);		    		
			$("#gesi").attr("src", "contentView?contentType="+sParameterVal[0]+"&contentSubType="+sParameterVal[1]+"&idx="+sParameterVal[2]);
    	}
		///////////////////////////////////////////////////////////////////////////
		
		
		      $(".login_btn").click(function(){
		         if($(".in_id").val() ==""){
		            alert('아이디를 입력해주세용 ?')
		            $('.in_id').focus();
		            return false;
		         }
		         if($(".in_pw").val() ==""){
		            alert('비밀번호를 입력해주세용 ?')
		            $('.in_pw').focus();
		            return false;
		         }
		         return $('.loginForm').submit();
		      });   
		      var message = '${msg}'
		      
		      if(message){
		         alert(message);
		      }
		      
		      $("input[name='id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
		           if($("#chk_id").is(":checked")){ // ID 저장하기를 체크한 상태라면,
		               var userInputId = $("input[name='id']").val();
		               setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		           }
		       });
		      
		       $(document).ready(function(){
		             var userInputId = getCookie("userInputId");//저장된 쿠기값 가져오기
		             $("input[name='id']").val(userInputId); 
		              
		             if($("input[name='id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
		                                                    // 아이디 저장하기 체크되어있을 시,
		                 $("#chk_id").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
		       }
		             
		       $("#chk_id").change(function(){ // 체크박스에 변화가 발생시
		              if($("#chk_id").is(":checked")){ // ID 저장하기 체크했을 때,
		                  var userInputId = $("input[name='id']").val();
		                  setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
		              }else{ // ID 저장하기 체크 해제 시,
		                  deleteCookie("userInputId");
		              }
		      });
		   });
		         $('#in_pw').bind('keypress', function(e) {
		               var keyCode  = 0;
		             var shiftKey  = false;
		             keyCode   = e.keyCode;
		             shiftKey   = e.shiftKey;
		
		          if (((keyCode >= 65 && keyCode <= 90)&& !shiftKey)||((keyCode >= 97 && keyCode <= 122)&& shiftKey)) {
		              alert("CapsLock이 켜져 있습니다");
		              return;
		           }
		         });
		 });
		 
		function pressEnter(){
		    if(event.keyCode == 13){
		       if($(".in_id").val() ==""){
		         alert('아이디를 입력해주세용 ?')
		         $('.in_id').focus();
		         return false;
		      }
		       $('.in_pw').focus();
		       
		    }
		}
		
		function pressEnterPw(){
		    if(event.keyCode == 13){
		       if($(".in_pw").val() ==""){
		         alert('비밀번호를 입력해주세용 ?')
		         $('.in_pw').focus();
		         return false;
		      }
		       $('.loginForm').submit();
		    }
		}
		 
		function setCookie(cookieName, value, exdays){
		    var exdate = new Date();
		    exdate.setDate(exdate.getDate() + exdays);
		    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
		    document.cookie = cookieName + "=" + cookieValue;
		}
		 
		function deleteCookie(cookieName){
		    var expireDate = new Date();
		    expireDate.setDate(expireDate.getDate() - 1);
		    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
		}
		 
		function getCookie(cookieName) {
		    cookieName = cookieName + '=';
		    var cookieData = document.cookie;
		    var start = cookieData.indexOf(cookieName);
		    var cookieValue = '';
		    if(start != -1){
		        start += cookieName.length;
		        var end = cookieData.indexOf(';', start);
		        if(end == -1)end = cookieData.length;
		        cookieValue = cookieData.substring(start, end);
		    }
		    return unescape(cookieValue);
	}
</script>
</head>
<body>
<form action="loginOK" method="post" class="loginForm">
<table class="viewtable1" width="500" style="margin-left: auto; margin-right: auto;" >
<tr><th colspan="6" bgcolor="pink">로그인</th></tr>
<tr>
   <td>
      아이디 : <input class="in_id" type="text" name="id" onkeyup="return pressEnter()"/>
      <input type="hidden" name="referer" value="${referer}"/>
   </td>
</tr>
<tr>
   <td>
      비밀번호 : <input class="in_pw" type="password" name="pw" onkeyup="return pressEnterPw()"/>
   </td>
</tr>
<tr>
   <td>
      <input type="checkbox" name="chk_info" id="chk_id" value="remember_id">
      아이디저장
      <input class="login_btn" id="login_btn" type="button" value="로그인">
      <input id="login_btn" type="button" value="회원가입" onclick="location.href='register'">
      <input id="login_btn" type="button" value="돌아가기" onclick="location.href='index'">
   </td>
</tr>
</table> 
</form>
</body>
</html>