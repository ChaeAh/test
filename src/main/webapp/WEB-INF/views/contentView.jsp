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
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">

	 function setting(idx,mode,title,bcomment) {
		frm = document.form;											//현재 문서의 댓글 작업 폼
		frm.idx.value= idx;													//수정 또는 삭제할 댓글의 글번호를 지정한다. 댓글 입력시 0으로 처리한다.
		frm.mode.value=mode;											//댓글 작업 모드 지정
		frm.title.value=title;
		frm.bcomment.value=bcomment;											// 댓글 작성자 이름을 댓글 작업 폼의 텍스트 객체에 넣어준다.
		
		frm.commentBtn.value=title;  								// submit 버튼위에 표시될 텍스트 지정
		
		while(bcomment.indexOf("</br>") != -1) {
			bcomment =bcomment.replace("</br>" , "\r\n");
		}
		
	}  
	
 	 $(document).ready(function() {
 		$("#form").submit(function(event) {
 			var bcomment =  $.trim($(".bcomment").val()).length;
 			if(bcomment==0) {
 				event.preventDefault();
  				alert('내용은 필수로 입력하셔야 합니다.');
  				$("#bcomment").focus();
 			}
 		});
 		
 		$(".contentList").each(function(index, item){
 			$(item).addClass("contentList"+index);   //index번째 item에 className을 갖는 클래스 추가
 		});
 		
 		$(".menuButton").each(function(index,item){
 			$(item).addClass("menuButton"+index);
 		});
 		
 		$(".inputBox").each(function(index,item){
 			$(item).addClass("inputBox"+index);
 			$(".inputBox"+index).hide();
 		});
 		
 		$(".test").each(function(index,item){
 			$(item).addClass("test"+index);
 		});
 		
 		$(".contentList").each(function(index,item){
 			$(".menuButton"+index).click(function() {
 				var isHidden= $(".inputBox"+index).is(":hidden");
 				if(isHidden) {
 					$(".inputBox"+index).show();
 				}else if(!isHidden){
 					$(".inputBox"+index).hide();
 				}
 			});
 		});
 		
 		if($("#userVO").val() == ''){
 			$("#commentArea").html("로그인 이후 사용 가능합니다.");
 			$("#commentArea").attr("disabled", "disabled");
            $("#commentArea_btn").attr("disabled", "disabled");
            $("#commentArea_btn_reset").attr("disabled", "disabled");
             
            $(".contentList").each(function(index,item){
 				$(".menuButton"+index).attr("disabled", "disabled");
        	});
        } 		
 		
 	});
 		
	 	function like_func() {
			var frm = $("#read_form");
			var board_idx = $(".contentList > #idx").val();
		//	alert(board_idx + "  " + $("#user_idx").val());
			
			$.ajax( {
				type : 'GET',
				url : 'like_check',
				cache : false,
				 async : false,
			 	dataType : "JSON", 
				data : {
					"board_idx" :  $.trim($(".contentList > #idx").val()),
					"user_idx" : $.trim($("#user_idx").val())
				}, 
				success : function(data) {
					var like_img = '';
					if(data.like_check ==0){
// 						alert(data.like_check);

						like_img = "./images/dislike.png";
					}else if(data.like_check ==1) {
// 						alert(data.like_check);
						like_img = "./images/like.png";
					}
					$("#like_img").attr('src',like_img);
					$("#like_count").html("["+data.like_count+"]");
				}
			
				}); //end ajax
		}; //end like_func 

</script>
 
</head>
<body>

<input type="hidden" id="userVO" value="${userVO }">
<input type="hidden" id="user_idx" value="${user_idx }">
<fmt:requestEncoding value="UTF-8"/>
<java:useBean name="date" class="java.util.Date"/>
<form action="update" method="get" id="read_form">
<table width="800" border="3" align="left" cellspacing="0" cellpadding="5">
   <tr><th colspan="6" style="background: #93A9D1; color: white;">게시글 보기</th></tr>
   <div class="contentList">
       <input type="hidden" name="idx" id="idx" value="${vo.idx }" />
       <input type="hidden" name="name" value="${userVO}" />
       <input type="hidden" name="currentPage" value="${currentPage}" />
       <input type="hidden" name="contentType" value="${contentType}" />
       <input type="hidden" name="contentSubType" value="${contentSubType}" />

   <tr>
      <th width="80" align="center"  width="80">Index</th>
      <td width="80" align="left" colspan="2" width="500">${vo.idx }</td>
         <th align="center"  width="50" >조회수</th>
         <td align="center" width="50" >${vo.hit }</td>
   </tr>
   <tr>
         <th align="center">${vo.type}/${vo.sub_type}</th>
      <td align="right"   colspan="4">
   <c:if test="${date.year==vo.writeDate.year && date.month==vo.writeDate.month && date.date == vo.writeDate.date }">
         <fmt:formatDate value="${vo.writeDate }" pattern="a h:mm"/>
   </c:if>
   <c:if test="${date.year!=vo.writeDate.year || date.month!=vo.writeDate.month || date.date != vo.writeDate.date }">
         <fmt:formatDate value="${vo.writeDate }" pattern="yyyy.MM.dd(E)"/>
   </c:if>
      </td>
   </tr>
      <tr>
         <th align="center" width="50">작성자</th>
      <c:set var="name" value="${fn:replace(vo.name,'<','&lt;') }"/>
      <c:set var="name" value="${fn:replace(name,'>','&gt;') }"/>
      <td align="center"   width="50">${name}</td>
         <th align="center" width="50">제목</th>
         <c:set var="subject" value="${fn:replace(vo.subject, '<', '&lt;') }"/>
         <c:set var="subject" value="${fn:replace(subject, '>', '&gt;') }"/>
         <td align="center"  width="450" colspan="4">${subject }</td>
      
      </tr>
   
   <tr>
      <th align="center" colspan="6"> 내용</th>
   </tr>
   <tr>
<%-- 	  <c:set var="content" value="${fn:replace(vo.content, '<', '&lt;') }"/> --%>
<%--       <c:set var="content" value="${fn:replace(content, '>', '&gt;') }"/> --%>
<%--       <c:set var="content" value="${fn:replace(content, rn, '</br>') }"/><!--요거를 꼭 맨마지막에 쓰기  --> --%>
      <td align="left" colspan="6" height="200" style="vertical-align: top;"  >${vo.content  }</td>
   </tr>
   </div>
   <tr>
   <td align="left">
   	<c:choose>
   		<c:when test="${userVO !=null }">
 			 <c:if test="${likeVO !=1 }">
   			<a href="javascript: like_func();"><img src="./images/dislike.png" id="like_img"></a>
   			</c:if>
   				<c:if test="${likeVO ==1 }"> 
   			<a href="javascript: like_func();"><img src="./images/like.png" id="like_img"></a>
   			 </c:if> 
   		</c:when>
   		 <c:otherwise>
   		 <img src="./images/dislike.png" />
   		</c:otherwise> 
   	</c:choose>
   	<span id="like_count">[${like_count }]</span>
   </td>
      <td colspan="5" align="right">
      <!-- history.back()나 history.go(-1)을 사용하면 변경된 조회수나 반영되지 않은 전 화면이 보인다. -->
      <c:if test="${userVO == name}">
         <input type="submit" class="button"  value="수정하기"/>
         <input type="button"  class="button" value="삭제하기" onclick="location.href='delete?currentPage=${currentPage}&idx=${vo.idx}&contentType=${contentType}&contentSubType=${contentSubType}'" />
      </c:if>
         <input type="button" class="button" value="목록보기" onclick="location.href='list?currentPage=${currentPage}&contentType=${contentType}&contentSubType=${contentSubType}'"/>
      </td>
   </tr>
</table>
</form>
<!-- </br> -->
<!-- </br> -->
</br>
<!-- <tr> -->

<form action="CommentOK" method="post"  name="form" id="form">
<table width="800" border="3" cellsapcing="0" cellpadding="5" align="left" >
<!--       <td colspan="4" style="display: none;"> -->
<!--           <input type="hidden" name="name" value="채" /> -->
      <!-- 수정 또는 삭제할 댓글의 글 번호를 넘겨준다. -->
         <input type="hidden" name="idx" id="idx" value="${vo.idx}" size="1"/>  
         <!-- 어떤 메인글의 댓글인지 넘겨준다. -->
         <input type="hidden" name="subject_idx" value="${vo.idx}" size="1"/>
         <!-- 작업 mode : 1 - 댓글 저장, 2 - 댓글 수정, 3 - 댓글 삭제 -->
         <input type="hidden" name="mode" id="mode" value="1" size="1"/>
         <input type="hidden" name="currentPage" value="${currentPage}" size="1"/>
         <input type="hidden" name="recurrentPage" value="${bcommentList.recurrentPage}" size="1"/>

		 <input type="hidden" name="contentType" value="${contentType}" />
		 <input type="hidden" name="contentSubType" value="${contentSubType}" />
<!--       </td> -->
<!--    </tr> -->
      <%--    <input type="hidden" name="idx" value="${vo.idx }" size="1"/>
          <input type="hidden" name="ref" value="${vo.idx }" size="1"/>
          <input type="hidden" name="mode"  id="mode" value="1" size="1"/>
          <input type="hidden" name="currentPage" value="${currentPage}" size="1"/> --%>
   <!-- 이줄부터 댓글 작업에 사용된다. -->
         <tr> <th colspan="4" align="center" style="background: #93A9D1; color: white;">댓글 달기</th>
   </tr>
      
   <tr>
      <td align="center" width="100">내용   </td>
      <td colspan="3"><textarea id="commentArea" cols="70" rows="3" style="overflow: scroll;" class="bcomment" name="bcomment"></textarea></td>
   </tr>
   <tr>
      <td align="right" colspan="4" >
         <input type="submit" id="commentArea_btn" class="button" name="commentBtn" id="commentBtn"  value="댓글쓰기" />
         <input type="button" id="commentArea_btn_reset" class="button"  value="다시쓰기"  onclick="setting(0,1,'저장','')"/>
      </td>
   </tr>
<!--    <tr><td colspan="4">&nbsp;</td></tr> -->
   <tr>
      <th colspan="4" style="background: #93A9D1; color: white;">댓글보기</th>
   </tr>
       <c:set var="bcommentList2" value="${bcommentList.bcommentList }"/>
      <c:if test="${bcommentList2.size() ==0}" >
         <tr>
            <td align="center" colspan="4">댓글이 없습니다.</td>
         </tr>
         </c:if>
      <c:if test="${bcommentList2.size() !=0 }">
         <c:forEach var="comment" items="${bcommentList2}">
         <tr class="contentList">
            <td colspan="3" align="center" width="550">
            <c:if test="${comment.idx != comment.ref }">
            <%--    <c:if test="${comment.lev>0}"> --%>
            <%--       <c:forEach var="i" begin="1" end="${comment.lev}"> --%>
                     &nbsp;&nbsp;
            <%--       </c:forEach> --%>
                  <img src="images/reply.png"/>
               </c:if>
               <c:if test="${comment.deleteCheck == -1 }">
               삭제된 댓글입니다.
               </c:if>
               
               <c:if test="${comment.deleteCheck == 1 }">
               ${comment.idx}. 
               <c:set var="name" value="${fn:replace(comment.name,'<','&lt;') }"/>
               <c:set var="name" value="${fn:replace(name,'>','&gt;') }"/>
               <c:set var="name" value="${fn:replace(name,rn,'</br>') }"/>
               <c:set var="name" value="${fn:trim(name) }"/>
               ${name} 님이 
               <c:set var="bcomment" value="${fn:replace(comment.bcomment,'<','&lt;') }"/>
               <c:set var="bcomment" value="${fn:replace(bcomment,'>','&gt;') }"/>
               <c:set var="bcomment" value="${fn:replace(bcomment,rn,'</br>') }"/>
               <c:set var="bcomment" value="${fn:trim(bcomment) }"/>
               ${bcomment}(을)를
              <fmt:formatDate   value="${comment.writeDate}" pattern="yyyy.MM.dd(E) HH:mm:ss"/>에 남기셨습니다. 
              <td align="center" width="150">
               <input type="hidden" name="seq" value="${comment.seq }" size="1"/>
            <%--    <input type="hidden" name="idx" value="${comment.idx }" size="1"/> --%>
               <input type="hidden" name="lev" value="${comment.lev }" size="1"/>
               <input type="button" class="button menuButton" id="recomment_menu"  value="메뉴" style="padding:8px 20px;" />
            </td>
            <tr>
               <td colspan="4" align="left" class="inputBox">
	               <c:if test="${userVO == name}">
		               <input type="button" class="button test" value="수정"  id="update" onclick="setting(${comment.idx},2,'수정','${bcomment}')" />
		               <input type= "button" class="button test"  value="삭제"  id="delete"  onclick="setting(${comment.idx},3,'삭제','${bcomment}')"/>
	               </c:if>
	               
           	   	   <input type= "button" class="button test"  value="답글"  id="re_comment"   onclick="setting(${comment.ref},4,'답글','')" />
               </td>
            <tr>
          </tr>
          </c:if>
         </c:forEach>
      </c:if> 
      </table>
   </form>
         
   <table width="800" border="3" cellsapcing="0" cellpadding="5" align="left" >
         <tr>
         <td align="center" colspan="4" >
     <c:if test="${bcommentList.startPage >1 }">
            <input type="button" class="button button2" title="처음 페이지로"  value="처음" onclick="location.href='?currentPage=1&recurrentPage=1&idx=${vo.idx}'"/> 
            <input type="button" class="button button2" title="이전 10페이지"  value="-10Page" onclick="location.href='?currentPage=${currentPage}&recurrentPage=${bcommentList.startPage-1}&idx=${vo.idx }''"/>
         </c:if>  

         <c:if test="${ bcommentList.recurrentPage >bcommentList.startPage}">
               <button class="button button2" value="이전" title="${i}번째 페이지로 이동합니다." 
                  onclick="location.href='?currentPage=${currentPage}&recurrentPage=${bcommentList.recurrentPage -1}&idx=${vo.idx }'">이전</button>
            </c:if>
         <c:if test="${ bcommentList.recurrentPage <bcommentList.startPage}">
               <button class="button button2" value="이전" title="이전페이지가 없습니다." 
                  disabled="disabled">이전</button>
            </c:if>     

         <c:forEach var="i" begin="${bcommentList.startPage}" end="${bcommentList.endPage}" step="1">
            <c:if test="${i == bcommentList.recurrentPage}">
               <button class="button button2" style=" border: #AD7FB0 2px solid" disabled="disabled" title="현재 페이지입니다." value="${i}" >${i}</button>
            </c:if>
         <c:if test="${i != bcommentList.recurrentPage}">
               <button class="button button2" value="${i}" title="${i}번째 페이지로 이동합니다." 
                  onclick="location.href='?recurrentPage=${i}&currentPage=${currentPage}&idx=${vo.idx }'">${i}</button>
            </c:if>
         </c:forEach>
     
         <!-- currentPage가 totalPage보다 작으면  다음페이지가 있다. -->
            <c:if test="${ bcommentList.recurrentPage <bcommentList.totalPage}">
               <button class="button button2" value="다음" title="${i}번째 페이지로 이동합니다." 
                  onclick="location.href='?recurrentPage=${bcommentList.recurrentPage +1}&currentPage=${currentPage}&idx=${vo.idx }'">다음</button>
                     <input type="button" class="button button2" title="+10Page"  value="+10Page" onclick="location.href='?currentPage=${currentPage}&recurrentPage=${bcommentList.endPage +1}&idx=${vo.idx }'"/>
                     <button class="button button2" value="끝" title="${i}번째 페이지로 이동합니다." 
                  onclick="location.href='?recurrentPage=${bcommentList.totalPage}&currentPage=${currentPage}&idx=${vo.idx }'">마지막</button>
            </c:if>
            
         <!--  endPage가 totalPage보다 작으면 이전 10페이지가 있다. -->
         <c:if test="${bcommentList.endPage < bcommentList.totalPage }">
            <input type="button" class="button button2" title="+10Page"  value="+10Page" onclick="location.href='?currentPage=${currentPage}&recurrentPage=${bcommentList.endPage +1}&idx=${vo.idx }'"/>
            <input type="button" class="button button2" title="마지막"  value="끝" onclick="location.href='?currentPage=${currentPage}&recurrentPage=${bcommentList.totalPage}&idx=${vo.idx }'"/> 
         </c:if>
         
          </td>
          </tr>      
   </table>
</body>
</html>