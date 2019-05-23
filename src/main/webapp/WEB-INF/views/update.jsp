<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
 <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>   
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>   
<!DOCTYPE html>
<html>
<head>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript" src="./resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
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
<script type="text/javascript">
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
</script>
<body>
<fmt:requestEncoding value="UTF-8"/>
<form action="updateOK" method="get" id="insertBoardFrm">
<table width="800" border="1" align="left" cellspacing="0" cellpadding="10">
<input type="hidden" name="currentPage" value="${currentPage }"/>
<input type="hidden" name="idx" value="${vo.idx }"/>
<input type="hidden" name="hit" value="${vo.hit}"/>
<input type="hidden" name="contentType" value="${contentType}"/>
<input type="hidden" name="contentSubType" value="${contentSubType}"/>

	<tr><th colspan="5" style="background: #93A9D1; color: white;">수정하기</th></tr>
	<tr>
		<td width="80" align="center"  width="80">Index</td>
		<td width="80" align="left" colspan="2" width="500" name="idx">${vo.idx }</td>
			<td align="center"  width="50" >조회수</td>
			<td align="center" width="50"  name="hit"  >${vo.hit }</td>
			
	</tr>
	<tr>
			<th align="center" width="80">
			${vo.sub_type }
		<%-- 		<select id="sub_type" name="sub_type"   >
				 <option value="전자" 	<c:if test="${vo.sub_type eq '전자'}">  selected="selected" </c:if> >전자 </option>
				<option value="전기" <c:if test="${vo.sub_type eq '전기'}"> selected="selected"</c:if>>전기</option>
				<option value="컴퓨터" <c:if test="${vo.sub_type eq '컴퓨터'}"> selected="selected"</c:if>>컴퓨터</option>
				<option value="건축"  <c:if test="${vo.sub_type eq '건축'}"> selected="selected"</c:if>>건축</option>
				<option value='산업안전' <c:if test="${vo.sub_type eq '산업안전'}"> selected="selected"</c:if>>산업안전</option>
				<option value="재료" <c:if test="${vo.sub_type eq '재료'}"> selected="selected"</c:if>>재료</option>
				<option value="기계" <c:if test="${vo.sub_type eq '기계'}"> selected="selected"</c:if>>기계</option>
				<option value="화학" <c:if test="${vo.sub_type eq '화학'}"> selected="selected"</c:if>>화학</option>
				<option value="에너지" <c:if test="${vo.sub_type eq '에너지'}"> selected="selected"</c:if>>에너지</option>
				<option value="교육" <c:if test="${vo.sub_type eq '교육'}"> selected="selected"</c:if>>교육</option> --%>
		<%-- 	 <c:forEach var="i" begin="0" end="${fn:length(array)}" step="1">
               <c:if test="${vo.sub_type == array[i]}">
                  <option value="${array[i]}" selected="selected">${array[i]}</option>
               </c:if>
               <c:if test="${vo.sub_type != array[i]}">
                  <option value="${array[i]}">${array[i]}</option>
               </c:if>
               </c:forEach>
			     <c:forEach var="i" begin="0" end="${fn:length(type)}" step="1">
            <c:if test="${vo.sub_type == type[i]}">
               <option value="${type[i]}" selected="selected">${type[i]}</option>
            </c:if>
            <c:if test="${vo.sub_type != type[i]}">
               <option value="${type[i]}">${type[i]}</option>
            </c:if>
            </c:forEach>
				</select> --%> 
			</th>
		<td align="right"   colspan="4">
<java:useBean id="date" class="java.util.Date"/>
	<c:if test="${date.year==vo.writeDate.year && date.month==vo.writeDate.month && date.date == vo.writeDate.date }">
			<fmt:formatDate   value="${vo.writeDate}" pattern="a h:mm"/>
	</c:if>
	<c:if test="${date.year!=vo.writeDate.year || date.month!=vo.writeDate.month || date.date != vo.writeDate.date }">
			<fmt:formatDate  value="${vo.writeDate}" pattern="yyyy.MM.dd(E)"/>
	</c:if>
		</td>
	</tr>
		<tr>
			<th align="center" width="80">제목</th>
			<td align="left"   colspan="4" width="270" ><input type="text" name="subject" value="${vo.subject}" placeholder="${vo.subject }" style="border:none;"/></td>
		</tr>
	<tr>
		<th align="center" colspan="5"> 내용</th>
	</tr>
	<tr>
		<td align="left" colspan="6" >
				<textarea name="content" id="editor" style="width: 770px; height: 400px;">${vo.content}</textarea>
		</td>
	</tr>
	<tr>
		<td colspan="5" align="right" style="font-family: a타이틀고딕3;">
		<!-- history.back()나 history.go(-1)을 사용하면 변경된 조회수나 반영되지 않은 전 화면이 보인다. -->
			<input type="button" class="button" value="돌아가기" onclick="history.back()"/>
			<input type="button" id="insertBoard" class="button" value="수정하기" />
			<input type="reset" class="button"  value="다시쓰기" />
		</td>
	</tr>
</table>
</form>
</body>
</html>