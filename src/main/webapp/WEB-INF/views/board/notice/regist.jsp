<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
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

<body>
	<div class="container p-3">

      <!-- Header, Nav start -->
      <jsp:include page="/WEB-INF/views/common/header.jsp"/>
      <!-- Header, Nav end -->
  
      <!-- Section start -->
      <section class="row m-3" style="min-height: 500px">
  <!-- main-content 시작 -->
		<div class="main-content">
			<div class="page-content">
				<div class="row justify-content-md-center">
					<div class="mt-5">
						<h3>공지사항 등록</h3>
					</div>
				</div>
 
    <div class="container border p-5 m-4 rounded">
      <h2 class="m-4">공지사항 등록 페이지</h2>
          <br>

          <form id="enroll-form" method="post" action="${ contextPath }/board/notice/insert" enctype="multipart/form-data">
              <div class="form-group">
                  <label for="title">제목 </label>
                  <input type="text" class="form-control" id="title" name="Title" required><br>
                  
                  <label for="writer">작성자 </label>
                  <input type="text" class="form-control" id="writer" value="${ loginUser.userId }" readonly><br>
                  
                  <label for="upfile">첨부파일 </label>
                  <input type="file" class="form-control-file post file" id="upfile" name="uploadFiles" multiple><br>
                  
                  <label for="userName">내용 </label>
                  <textarea class="form-control" required name="postContent" id="content" rows="10" style="resize:none;"></textarea><br>
                  
              </div>
              <br>
              <div align="center">
							    <!-- "등록하기" 버튼 클릭 시 regist.jsp 페이지로 이동 -->
							    <button type="button" class="btn btn-primary" onclick="location.href='${contextPath}/board/post/regist'">등록하기</button>
							    
							    <!-- "수정하기" 버튼 클릭 시 update.jsp 페이지로 이동 -->
							    <button type="button" class="btn btn-warning" onclick="location.href='${contextPath}/board/post/update'">수정하기</button>
							</div>


          </form>
        </div>
  
      </section>
      <!-- Section end -->
  
  </div>
  
  
  <script src="${ contextPath }/resources/js/fileValidate.js"></script>
  
</body>
</html>