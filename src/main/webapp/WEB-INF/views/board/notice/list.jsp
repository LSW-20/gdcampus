<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
<title>Notice List | Admin Dashboard</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta content="Notice List Page" name="description" />
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

		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid">
					<div class="row">
						<div class="col-lg-12">
							<div class="table-responsive custom-table mb-4">
								<table class="table table-centered datatable dt-responsive nowrap table-card-list table-check"
									style="border-collapse: collapse; border-spacing: 0 8px; width: 100%;">
									<thead>
										<tr class="bg-transparent">
											<th style="width: 24px;">
												<div class="custom-control custom-checkbox">
												 <!-- 체크 버튼  -->
												</div>
											</th>
											<th>공지사항 번호</th>
											<th>제목</th>
											<th>작성자</th>
											<th>작성일</th>
											<!-- <th>첨부파일 여부</th> -->
											<th>조회수</th>
										</tr>
									</thead>

									<tbody>
										<c:forEach var="n" items="${noticeList}">
											<tr onclick='location.href = "${contextPath}/board/notice/detail?no=${n.noticeNo}";'>
												<td>
													<div class="custom-control custom-checkbox">
														
													</div>
												</td>
												<td>${n.noticeNo}</td>
												<td>${n.noticeTitle}</td>
												<td>${n.userName}</td>
												<td>${n.registDate}</td>
											<%-- 	<td>${n.fileStatus == 'Y' ? '★' : ''}</td> --%>
												<td>${n.count}</td>
											</tr>
										</c:forEach>
									</tbody>
									<div class="d-flex justify-content-end">
											<c:if test="${fn:substring(loginUser.userNo, 0, 1) == 'A'}">
											<button type="submit" class="btn btn-primary w-md mr-3" onclick="location.href='${contextPath}/board/notice/regist';">추가</button>
											</c:if>
									</div> 
								</table>
							</div>
						</div>
					</div>
					<!-- end row -->
				</div> <!-- container-fluid -->
			</div>
			<!-- End Page-content -->

			<footer class="footer">
				<div class="container-fluid">
					<div class="row">
						<div class="col-sm-6">
							<script>
								document.write(new Date().getFullYear())
							</script> © Admin Dashboard.
						</div>
						<div class="col-sm-6">
							<div class="text-sm-right d-none d-sm-block">
								Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesbrand
							</div>
						</div>
					</div>
				</div>
			</footer>
		</div>
		<!-- end main content-->
 </div>
   <!-- /Right-bar -->

   <!-- Right bar overlay-->
   <div class="rightbar-overlay"></div>

	<!-- JAVASCRIPT -->
	<script src="${contextPath}/libs/jquery/jquery.min.js"></script>
	<script src="${contextPath}/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
	<script src="${contextPath}/libs/metismenu/metisMenu.min.js"></script>
	<script src="${contextPath}/libs/simplebar/simplebar.min.js"></script>
	<script src="${contextPath}/libs/node-waves/waves.min.js"></script>
	<script src="${contextPath}/libs/datatables.net/js/jquery.dataTables.min.js"></script>
	<script src="${contextPath}/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
	<script src="${contextPath}/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
	<script src="${contextPath}/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>
	<script src="${contextPath}/js/app.js"></script>
	 <!-- bootstrap datepicker -->
   <script src="${contextPath}/libs/bootstrap-datepicker/js/bootstrap-datepicker.min.js"></script>

   <!-- Required datatable js -->
   <script src="${contextPath}/libs/datatables.net/js/jquery.dataTables.min.js"></script>
   <script src="${contextPath}/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
   
   <!-- Responsive examples -->
   <script src="${contextPath}/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
   <script src="${contextPath}/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

   <!-- init js -->
   <script src="${contextPath}/js/pages/ecommerce-datatables.init.js"></script>

   <script src="${contextPath}/js/app.js"></script>
   
   <script>
 		 $('.postCheckbox').parent().on("click", function(evt){
  			evt.stopPropagation();
 			})
	 </script>

</body>
</html>
