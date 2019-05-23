<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	      <!-- jstl 제어,대입문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      <!-- jstl 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	<!-- jstl 함수 -->
            
<!DOCTYPE html>
<html>
<head>
<style>
 body {
  	font-family: a타이틀고딕2;
 }
 .button {
 	background-color: white;
 	border:  none;
 	font-family: a타이틀고딕3;
 	text-decoration: none;
 	padding: 10px 10px;
 	margin: 1px;
 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script>

	 $(document).ready(function(){
		 $('#insertBoard').submit(function(){
			 var subject =$.trim($("#subject").val());
			 var content =$.trim($("#editor").val());

			 if(subject==""){
	      		alert('제목을 입력하세요');
	      		return false;
			 }
		
			 if(content==""){
	      		alert('내용을 입력하세요');
	      		return false;
			 }
			 if($("#type").val()=="선택"){
	      		alert('과를 선택하세요');
	      		return false;
			 }
			 if($("#sub_type").val()=="선택"){
	      		alert('세부과를 선택하세요');
	      		return false;
			 }
		
			 return true;
	      });
	
		 var array1 = new Array("선택","언어문학","인문","경영경제","법학","사회과학");
		 var array2 = new Array("선택","음악","체육","연극","영화","응용예술","미술");
		 var array3 = new Array("선택","전자","전기","컴퓨터","건축","산업안전","재료","기계","화학","에너지");
		 var array4 = new Array("선택","자유");
		 var array5 = new Array("선택","농림수산","화학","생명과학","환경","수학","물리","천문지구");
		 var array6 = new Array("선택","간호","보건","약학","의예","치예");
		$("#type").change(function(){ 
			$("#type option:selected").each(function(){ 
				var array = new Array();
				switch($(this).val()){
				case "인문사회": array = array1; break;
				case "예체능": array = array2; break;
				case "공학": array = array3; break;
				case "자유" : array = array4; break;
				case "자연과학" : array = array5; break;
				}
				
				var innerhtml = '<select name="sub_type" id=sub_type>';
				for (var i=0; i<array.length; i++){
				innerhtml +='<OPTION value="'+array[i]+'">'+array[i];
				}
				innerhtml +='</select>';
				document.getElementById("subM").innerHTML = innerhtml;
				
		
		    });  
	
		}); 

		$(function(){
		    //전역변수
		    var obj = [];              
		    //스마트에디터 프레임생성
		    nhn.husky.EZCreator.createInIFrame({
		        oAppRef: obj,
		        elPlaceHolder: "editor",
		        sSkinURI: "./resources/editor/SmartEditor2Skin.html",
		        htParams : {
		            // 툴바 사용 여부
		            bUseToolbar : true,            
		            // 입력창 크기 조절바 사용 여부
		            bUseVerticalResizer : true,    
		            // 모드 탭(Editor | HTML | TEXT) 사용 여부
		            bUseModeChanger : true,
		        }
		    });
		    //전송버튼
		    $("#insertBoard").click(function(){
		        //id가 smarteditor인 textarea에 에디터에서 대입
		        obj.getById["editor"].exec("UPDATE_CONTENTS_FIELD", []);
		        //폼 submit
		        $("#insertBoardFrm").submit();
		    });
		});
		
	 });
		
</script>
</head>
<body>
<form action="insertOK" method="get" id="insertBoard">
<table width="600" border="1" align="left" cellspacing="0" cellpadding="10">
	<tr><th colspan="6" style="background: #93A9D1; color: white;">글쓰기</th></tr>
	<input type="hidden" name="name" value="${userVO}" />
	<tr>
		<td width="200">
			<!--<input type="hidden" value="${type[0]}" name="type"/>-->
			<select id="type" name="type" onchange="change1(this.value);">
                <option value="선택" selected="selected">선택하세요</option>
		         <c:forEach var="i" begin="0" end="${fn:length(mainArray)-1}" step="1">
		                <option value="${mainArray[i]}" >${mainArray[i]}</option>
		         </c:forEach>
	      	</select>
	      <span id="subM">
			<%-- <select id="sub_type" name="sub_type" >
				<option value="선택" selected="selected">선택하세요</option>
				<c:forEach var="i" begin="1" end="${fn:length(type1)-1}" step="1">
				 	<option value="${type1[i]}" >${type1[i]}</option>
				</c:forEach>
			</select> --%>
		</span>
		</td>
		<!-- <th width="100" align="center"><label for="subject">제목</label></th> -->
		<td align="left" colspan="4" width="300"> <input type="text" id="subject"  name="subject"  size="30" /></td>
	
	</tr>
			<!-- <th align="center" width="50"><label for="name">작성자</label></th>
					<td align="left"  colspan="4"><input type="text" id="name"  name="name" /></td>
		</tr> -->
		<th align="center" colspan="6"> <label for="editor">내용</label></th>
	</tr>
	<tr>
		<td align="left" colspan="6" >
				<textarea name="content" id="editor" style="width: 500px; height: 400px;"></textarea>
		</td>
	</tr>
	<tr>
		<td colspan="6" align="right">
		<!-- history.back()나 history.go(-1)을 사용하면 변경된 조회수나 반영되지 않은 전 화면이 보인다. -->
			<button id="insertBoard">글쓰기</button> 
			<input type="button"  class="button" value="돌아가기" onclick="history.back()"/>
			<input type="reset"  class="button" value="다시쓰기" />
		</td>
	</tr>
</table>
</form>
</body>
</html>
<%-- <%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>         <!-- jstl 제어,대입문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      <!-- jstl 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   <!-- jstl 함수 -->
            
<!DOCTYPE html>
<html>
<head>
<style>
 body {
 margin: 100px;
     font-family: a타이틀고딕2;
 }
 .button {
    background-color: white;
    border:  none;
    font-family: a타이틀고딕3;
    text-decoration: none;
    padding: 10px 10px;
    margin: 1px;
 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
    $(document).ready(function(){
       $('input:submit').click(function(){
          var subject =$.trim($("#subject").val());
          var content =$.trim($("#content").val());

          if(subject==""){
               alert('제목을 입력하세요');
               return false;
          }
      
          if(content==""){
               alert('내용을 입력하세요');
               return false;
          }
          if($("#sub_type").val()=="선택"){
               alert('과를 선택하세요');
               return false;
          }
      
          return true;
         });
       
    });

</script>
</head>
<body>
<form action="insertOK" method="get" id="form">
<table width="600" border="1" align="center" cellspacing="0" cellpadding="10">
   <tr><th colspan="6" style="background: #93A9D1; color: white;">글쓰기</th></tr>
   <input type="hidden" name="name" value="채" />
   <tr>
      <td>
         <!--<input type="hidden" value="${type[0]}" name="type"/>-->
         <select name="type">
            <option value="인문사회">${array[0]}</option>
         </select>
         <select id="type" name="type"    >
                <option value="선택" selected="selected">선택하세요</option>
                
         <c:forEach var="i" begin="0" end="${fn:length(mainArray)-1}" step="1">
                <option value="${mainArray[i]}" >${mainArray[i]}</option>
         </c:forEach>
      </select>
         <select id="sub_type" name="sub_type"    >
                <option value="선택" selected="selected">선택하세요</option>
                
         <c:forEach var="i" begin="1" end="${fn:length(array)-1}" step="1">
                <option value="${array[i]}" >${array[i]}</option>
         </c:forEach>
      </select>
      </td>
      <th width="100" align="center"><label for="subject">제목</label></th>
      <td align="left" colspan="4" width="300"> <input type="text" id="subject"  name="subject"  size="30" /></td>
   
   </tr>
         <!-- <th align="center" width="50"><label for="name">작성자</label></th>
               <td align="left"  colspan="4"><input type="text" id="name"  name="name" /></td>
      </tr> -->
      <th align="center" colspan="6"> <label for="content">내용</label></th>
   </tr>
   <tr>
      <td align="left" colspan="6" height="200" >
            <textarea style="overflow: scroll;" id="content" name="content" rows="14" cols="97"></textarea></td>
      </td>
   </tr>
   <tr>
      <td colspan="6" align="right">
      <!-- history.back()나 history.go(-1)을 사용하면 변경된 조회수나 반영되지 않은 전 화면이 보인다. -->
         <input type="submit" class="button" value="글쓰기" />
         <input type="button"  class="button" value="돌아가기" onclick="history.back()"/>
         <input type="reset"  class="button" value="다시쓰기" />
      </td>
   </tr>
</table>
</form>
</body>
</html>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	      <!-- jstl 제어,대입문 -->
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>      <!-- jstl 서식 -->
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>	<!-- jstl 함수 -->
            
<!DOCTYPE html>
<html>
<head>
<style>
 body {
 margin: 100px;
  	font-family: a타이틀고딕2;
 }
 .button {
 	background-color: white;
 	border:  none;
 	font-family: a타이틀고딕3;
 	text-decoration: none;
 	padding: 10px 10px;
 	margin: 1px;
 }
</style>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script>
	$(document).ready(function() {
		$("#form").submit(function(event) {
				var subject= $.trim($("#subject").val()).length;
				var name= $.trim($("#name").val()).length;
				var content= $.trim($("#content").val()).length;
				
				if(title ==0) { 
					event.preventDefault();
					alert("제목은 반드시 입력해야 합니다.");
					$("#subject").focus();
				}else if(name==0) {
					event.preventDefault();
					alert("이름은 반드시 입력해야 합니다.");
					$("#name").focus();
				}else if(content==0) {
					event.preventDefault();
					alert("내용은 반드시 입력해야 합니다.");
					$("#content").focus();
				}
		});
	});

</script>
</head>
<body>
<form action="insertOK" method="get" id="form">
<table width="600" border="1" align="center" cellspacing="0" cellpadding="10">
	<tr><th colspan="6" style="background: #93A9D1; color: white;">글쓰기</th></tr>
	<input type="hidden" name="name" value="채" />
	<tr>
		<td>
			<input type="hidden" value="${type[0]}" name="type"/>
			<select id="sub_type" name="sub_type"    >
					 <option value="선택하세요" selected="selected">선택하세요</option>
					 
			<c:forEach var="i" begin="1" end="${fn:length(type)-1}" step="1">
					 <option value="${type[i]}" >${type[i]}</option>
			</c:forEach>
				</select>
		</td>
		<th width="100" align="center"><label for="subject">제목</label></th>
		<td align="left" colspan="4" width="300"> <input type="text" id="subject"  name="subject"  size="30" /></td>
	
	</tr>
			<!-- <th align="center" width="50"><label for="name">작성자</label></th>
					<td align="left"  colspan="4"><input type="text" id="name"  name="name" /></td>
		</tr> -->
		<th align="center" colspan="6"> <label for="content">내용</label></th>
	</tr>
	<tr>
		<td align="left" colspan="6" height="200" >
				<textarea style="overflow: scroll;" id="content" name="content" rows="14" cols="97"></textarea></td>
		</td>
	</tr>
	<tr>
		<td colspan="6" align="right">
		<!-- history.back()나 history.go(-1)을 사용하면 변경된 조회수나 반영되지 않은 전 화면이 보인다. -->
			<input type="submit" class="button" value="글쓰기" />
			<input type="button"  class="button" value="돌아가기" onclick="history.back()"/>
			<input type="reset"  class="button" value="다시쓰기" />
		</td>
	</tr>
</table>
</form>
</body>
</html> --%>