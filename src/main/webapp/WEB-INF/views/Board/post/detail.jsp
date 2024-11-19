<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시글 상세</title>
<style type="text/css">
.main-content {
	min-height: 900px;
}

.page-content {
	margin: auto;
	width: 75%;
}

.card-body {
	height: 500px;
}
</style>
</head>
<body>

<body data-topbar="dark" data-sidebar="dark">
	<!-- body 태그에 data-topbar="dark"를 주면 헤더 다크모드. 없으면 라이트 모드. -->
	<!-- body 태그에 data-sidebar="dark"를 주면 사이드바 다크모드. 없애면 라이트 모드. -->



	<!-- 전체 영역(헤더, 사이드바, 내용) 시작 -->
	<div id="layout-wrapper">


		<!-- header 시작 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<!-- header 끝 -->


		<!-- sidebar 시작 -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
		<!-- sidebar 끝 -->



		<!-- main-content 시작 -->
		<div class="main-content">
			<div class="page-content">
			
       <div class="container border p-5 m-4 rounded">
         <h2 class="m-4">게시글 상세</h2>
         <br>

         <a class="btn btn-secondary" style="float:right" href="${ contextPath }/post/list.do">목록으로</a>
         <br><br>
         <table align="center" class="table">
             <tr>
                 <th width="120">제목</th>
                 <td colspan="3">${ p.postTitle }</td>
             </tr>
             <tr>
                 <th>작성자</th>
                 <td width="400">${ p.postWriter }</td>
                 <th width="120">작성일</th>
                 <td>${ p.registDate }</td>
             </tr>
             <tr>
                 <th>첨부파일</th>
                 <td colspan="3">
                 	 <c:forEach var="at" items="${ p.attachList }">
                     <a href="${ contextPath }${ at.filePath }/${ at.filesystemName }" download="${ at.originalName }">${ at.originalName }</a> 
                     <br>
                   </c:forEach>
                 </td>
             </tr>
             <tr>
                 <th>내용</th>
                 <td colspan="3"></td>
             </tr>
             <tr>
                 <td colspan="4">
                 	 <p style="height:150px">${ p.postContent }</p>
                 </td>
             </tr>
         </table>
         <br>

         <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
         <c:if test="${ loginUser.userId eq p.user_no }">
	         <div align="center">
	         		<form id="frm" action="" method="post">
	         			<input type="hidden" name="no" value="${ p.postNo }">
	              <button type="submit" class="btn btn-primary" onclick="$('#frm').attr('action', '${contextPath}/post/modify.do');">수정하기</button>
	              <button type="submit" class="btn btn-danger" onclick="$('#frm').attr('action', '${contextPath}/post/delete.do');">삭제하기</button>
	            </form>
	         </div>
         </c:if>
         <br><br>

         <table id="comment_area" class="table" align="center">
             <thead>
                 <tr>
                 
                 	 <c:choose>
                 	 	 <c:when test="${ empty loginUser }">
	                     <th colspan="2" width="650">
	                         <textarea class="form-control" rows="2" style="resize:none; width:100%" readonly>로그인 후 이용가능한 서비스 입니다.</textarea>
	                     </th>
	                     <th style="vertical-align: middle"><button class="btn btn-secondary disabled">등록하기</button></th>
                 		 </c:when>
                 		 <c:otherwise>
	                 		 <th colspan="2" width="650">
	                         <textarea class="form-control" id="comment_content" rows="2" style="resize:none; width:100%"></textarea>
	                     </th>
	                     <th style="vertical-align: middle"><button class="btn btn-secondary" onclick="fn_insertComment();">등록하기</button></th>
                   	 </c:otherwise>
                   </c:choose>
                 </tr>
                 <tr>
                    <td colspan="3">댓글 (<span id="rcount">0</span>) </td> 
                 </tr>
             </thead>
             <tbody>
                 
             </tbody>
         </table>
         
         <script>
         	 $(document).ready(function(){
         		 fn_commentList();
         	 })
         
         	 // 해당 게시글의 댓글 목록 조회용 (ajax) 함수
         	 function fn_commentList(){
         		 $.ajax({
         			 url: '${contextPath}/board/post/clist.do',
         			 data: "no=" + ${p.postNo},
         			 success: function(resData){
         				 console.log(resData); // [{}, {}, ..]
         				 
         				/* 
         				 	<tr>
                     <th>user02</th>
                     <td>댓글입니다. <td>
                     <td>2020-04-10</td>
                  </tr>
         				 */
         				 
         				 $("#rcount").text(resData.length); // 댓글수출력
         				 let tr = "";
         				 for(let i=0; i<resData.length; i++){
         					 tr += "<tr>"
         					 		 +		"<th>" + resData[i].commenterId  + "</th>"
         					 		 +	  "<td>" + resData[i].comment + "</td>"
         					 		 +    "<td>" + resData[i].registDate     + "</td>"
         					 		 + "</tr>";
         				 }
         				 
         				 $("#comment_area tbody").html(tr);        				 
         				 
         			 }
         		 })
         	 }
         	 
         	 // 댓글 등록용 (ajax) 함수
         	 function fn_insertComment(){
         		 $.ajax({
         			 url: '${contextPath}/post/comment.do',
         			 type: 'post',
         			 data: {
         				 postContent: $("#post_content").val(),
         				 refpostdNo: ${p.postNo}
         			 },
         			 success: function(resData){
         				 if(resData == "SUCCESS"){
         					 fn_commentList();
         					 $("#comment_content").val("");
         				 }else{
         					 alert("댓글 작성 실패");
         				 }
         			 }
         		 })
         	 }
         </script>
       </div>
			</div>
     <!-- Section end -->
		</div>
 </div>
 
 

</body>
</html>