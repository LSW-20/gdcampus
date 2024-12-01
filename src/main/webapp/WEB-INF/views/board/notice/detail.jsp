<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지사항 상세</title>
 <style type="text/css">
        .main-content { min-height: 900px; }
        .page-content { margin: auto; width: 75%; }
        .card-body { height: 500px; }
        #reply_area tbody>tr>th:nth-child(1) { width: 120px; }
    </style>
 </head>

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
         <h2 class="m-4">공지사항 상세</h2>
         <br>
                    <a class="btn btn-secondary" style="float:right" href="${contextPath}/board/notice/list">목록으로</a>
         <br><br>
         
         <!-- 게시글 정보 테이블 -->
         <table align="center" class="table">
             <tr>
                 <th width="120">제목</th>
                 <td colspan="3">${n.postTitle}</td>
             </tr>
             <tr>
                 <th>작성자</th>
                 <td width="400">${n.writerName }</td> 
                 <th width="120">작성일</th>
                 <td>${ n.registDate }</td>
             </tr>
             <tr>
                 <th>첨부파일</th>
                 <td colspan="3">
	                 <c:forEach var="attachDto" items="${attachList}">
	                     <a href="${contextPath}${attachDto.filePath}/${attachDto.filesystemName}" download="${attachDto.originalName}">
	                         ${attachDto.originalName}
	                     </a>
	                     <br>
	                 </c:forEach>
                 </td>
             </tr>
            
             <tr>
             		<th>내용</th>
                 <td colspan="4">
                 	 <p style="height:150px">${ n.postContent }</p>
                 </td>
             </tr>
         </table>
         <br>

         <!-- 수정하기, 삭제하기 버튼은 이글이 본인글일 경우만 보여져야됨 -->
         <c:if test="${ loginUser.userId eq n.userNo }">
	         <div align="center">
	         		<form id="frm" action="" method="post">
	         			<input type="hidden" name="no" value="${n.postNo }">
	              <button type="submit" class="btn btn-primary" onclick="$('#frm').attr('action', '${contextPath}/board/notice/modify');">수정</button>
	              <button type="submit" class="btn btn-danger" onclick="$('#frm').attr('action', '${contextPath}/board/notice/delete');">삭제</button>
	            </form>
	         </div>
         </c:if>
         <br><br>

         
       </div>
			</div>
     <!-- Section end -->
		</div>
 </div>
 
 

</body>
</html>