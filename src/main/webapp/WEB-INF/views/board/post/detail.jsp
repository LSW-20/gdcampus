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

<style>
    #reply_area tbody>tr>th:nth-child(1){width:120px}
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

         
         <br><br>
         <table align="center" class="table">
             <tr>
                 <th width="120">제목</th>
                 <td colspan="3">${ p.postTitle }</td>
             </tr>
             <tr>
                 <th>작성자</th>
                 <td width="400">${ p.writerName }</td> <!-- 작성자 사번에서 가지고 와야할때는 뭐라고 입력해야하는지?   -->
                 <th width="120">작성일</th>
                 <td>${ p.registDate }</td>
             </tr>
             <tr>
                 <th>첨부파일</th>
                 <td colspan="3">
                 	 <c:forEach var="at" items="${ a.attachList }">
                     <a href="${ contextPath }${ at.filePath }/${ at.filesystemName }" download="${ at.originalName }">${ at.originalName }</a> 
                     <br>
                   </c:forEach>
                 </td>
             </tr>
            
             <tr>
          		 <th>내용</th>
                 <td colspan="4">
                 	 <p style="height:150px">${ p.postContent }</p>
                 </td>
              </tr>
         </table>
         <br>
				 <br>
				 
					 <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
         <c:if test="${ loginUser.userId eq p.writerName }">
	         <div align="center">
	         		<form id="frm" action="" method="post">
	         			<input type="hidden" name="no" value="${ p.userNo }">
	              <button type="submit" class="btn btn-primary" onclick="$('#frm').attr('action', '${contextPath}board/post/modify');">수정하기</button>
	              <button type="submit" class="btn btn-danger" onclick="$('#frm').attr('action', '${contextPath}/board/post/delete');">삭제하기</button>
	            </form>
	         </div>
         </c:if>
         <br><br>
        
				<textarea id="comment_content" class="form-control" rows="3"></textarea>
				<button class="btn btn-primary" onclick="fn_insertComment();">댓글 작성</button>
				         
		  	<a class="btn btn-secondary" style="float:center" href="${ contextPath }board/post/list">목록으로</a>
				<br>
		         
		         <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		         <script>
		      // 댓글 목록 조회 함수
		         function fn_commentList(){
		             $.ajax({
		                 url: '${contextPath}/board/post/clist',
		                 data:  "no:" + '${p.postNo}' ,
		                 success: function(resData){
		                	 	console.log(resData);
		                      let tbody = $("#comment_area tbody");
		                     tbody.empty();
		                     $.each(resData, function(index, comment){
		                         let tr = $("<tr></tr>");
		                         tr.append($("<td></td>").text(c.commentWriter));
		                         tr.append($("<td></td>").text(c.comment));
		                         tr.append($("<td></td>").text(c.registDate));
		                         tbody.append(tr); 
		                	 	$("#rcount").text(resData.length); // 댓글수출력
						         				 let tr = "";
						         				 for(let i=0; i<resData.length; i++){
						         					 tr += "<tr>"
						         					 		 +		"<th>" + resData[i].commentWriter  + "</th>"
						         					 		 +	  "<td>" + resData[i].comment + "</td>"
						         					 		 +    "<td>" + resData[i].registDate     + "</td>"
						         					 		 + "</tr>";
						         				 }
						         				 
						         				 $("#comment_area tbody").html
						         				 (tr);        			
		                     });
		                 }
		             });
		         }
		
		         // 댓글 등록 함수
		         function fn_insertComment(){
		             $.ajax({
		                 url: '${contextPath}/board/post/cinsert',
		                 type: 'post',
		                 data: {
		                     comment: $("#comment").val(),
		                     postNo: '${p.postNo}'
		                 },
		                 success: function(resData){
		                     if(resData === "SUCCESS"){
		                         fn_commentList();
		                         $("#comment").val("");
		                     } else {
		                         alert("댓글 작성 실패");
		                     }
		                 }
		             })
		         }
		
		         // 페이지 로드 시 댓글 목록 조회
		         $(document).ready(function(){
		             fn_commentList();
		         });
		
		         </script>
		       </div>
					</div>
		     <!-- Section end -->
				</div>
		 </div>
		 
 

</body>
</html>