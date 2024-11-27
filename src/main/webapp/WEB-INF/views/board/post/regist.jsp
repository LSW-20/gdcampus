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
						<h3>게시글 등록</h3>
					</div>
				</div>
			<!-- Section start -->
        <section class="row m-3" style="min-height: 500px">
    
          <div class="container border p-5 m-4 rounded">
            <h2 class="m-4">게시글 등록</h2>
            <br>

            <form  id="enroll-form" method="post" action="${contextPath}/board/post/insert" method="post" enctype="multipart/form-data" class="was-validated">
                <div class="form-group">
                    <label for="title">제목 </label>
                    <input type="text" class="form-control" id="title" name="postTitle" required><br>
                    
                    <label for="writer">작성자 </label>
                    <input type="text" class="form-control" id="writer" name="" value="${ loginUser.userId }" readonly><br>
                    
                    <label for="upfile">첨부파일 </label>
                    <input type="file" class="form-control-file post file" id="upfile" name="uploadFiles" multiple><br>
                    
                    <label for="content">내용 </label>
                    <textarea class="form-control" required name="postContent" id="content" rows="10" style="resize:none;"></textarea><br>
                    
                </div>
                <br>
                <div align="center">
                    <button type="submit" class="btn btn-primary w-md mr-3" onclick="location.href='${contextPath}/board/post/insert;">등록하기</button>
                    <button type="reset" class="btn btn-danger" href="${contextPath }/board/post/list">취소하기</button>
                </div>

            </form>
          </div>
    
        </section>
							<hr>
							<div class="mt-4 row d-flex justify-content-center">
								<button type="submit" class="btn btn-primary w-md mr-3" onclick="location.href='${contextPath}/board/post/insert';">추가</button>
								<a class="btn btn-primary w-md mr-3" href="${contextPath }/board/post/list">취소</a>
							</div>
					</div>
				</div>

			</div>
		<!-- main-content 끝 -->
  <script src="${ contextPath }/resources/js/fileValidate.js"></script>

	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
  
  
</body>
</html>