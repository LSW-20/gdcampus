<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <title>Invoice List | Drezon - Responsive Bootstrap 4 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- bootstrap-datepicker css -->
        <link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

        <!-- DataTables -->
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <!-- Responsive datatable examples -->
        <link href="assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" /> 

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
        
</head>

<body data-sidebar="dark">
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
				<div class="row justify-content-md-center">
					<div class="mt-5">
						<h3>게시글 수정</h3>
					</div>
				</div>
			<!-- Section start -->
        <section class="row m-3" style="min-height: 500px">
    
          <div class="container border p-5 m-4 rounded">
            <h2 class="m-4">게시글 수정</h2>
            <br>

            <form  id="modify-form" method="post" action="${contextPath}/board/post/update" enctype="multipart/form-data" class="was-validated">
               <input type="hidden" name="postNo" value="${ post.postNo }">
                <div class="form-group">
                    <label for="title">제목 </label>
                    <input type="text" class="form-control" id="title" name="postTitle" value="${ post.postTitle }" required><br>
                    
                    <label for="writer">작성자 </label>
                    <input type="text" class="form-control" id="writer" name="" value="${ loginUser.userId }" readonly><br>
                    
                    <label for="upfile">첨부파일 </label>
                    <input type="file" class="form-control-file post file" id="upfile" name="uploadFiles" multiple><br>
                    
                    <c:forEach var="at" items="${ post.attachList }">
                  	<div>
	                  	<a href="${contextPath}${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName }</a> 
	                  	<span class="origin_attach_del" data-fileno="${ at.fileNo }">x</span>
                  	</div>
                  </c:forEach>
                  
                    <label for="content">내용 </label>
                    <textarea class="form-control" required name="postContent" id="content" rows="10" style="resize:none;">${ post.postContent }</textarea><br>
                    
                </div>
                <br>
                	<div class="mt-4 row d-flex justify-content-center">
                  <button type="submit" class="btn btn-primary">수정하기</button>
                  <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
							</div>

            </form>
          </div>
    
        </section>
						
			</div>
		<!-- main-content 끝 -->
  <script src="${ contextPath }/resources/js/fileValidate.js"></script>
<script>
          	$(document).ready(function(){
          		$(".origin_attach_del").on("click", function(){
          			
          			// 삭제할 첨부파일 번호를 submit시 넘기기위한 작업
          			// 수정하기 submit시 form요소내에 input type="hidden" 으로 첨부파일번호 숨기기
          			let hiddenEl = "<input type='hidden' name='delFileNo' value='" + $(this).data("fileno") + "'>";
          			$("#modify-form").append(hiddenEl);
          			
          			// 화면으로부터 삭제된거 처럼 보여지게 해당 첨부파일 링크 삭제 처리
          			$(this).parent().remove();
          			
          		})
          	})
          	
          </script>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
  </div>
  </div>
</body>
</html>