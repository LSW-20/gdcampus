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
		<div class="main-content">
	     <div class="page-content">
	         <div class="container-fluid">
               <div class="row">
                   <div class="col-lg-12">
                       <div class="table-responsive custom-table mb-4">
                           <table class="table table-centered datatable dt-responsive nowrap table-card-list table-check" style="border-collapse: collapse; border-spacing: 0 8px; width: 100%;">
                               <thead>
                                   <tr class="bg-transparent">
                                       <th style="width: 24px;">
                                           <div class="custom-control custom-checkbox">
                                               <input type="checkbox" class="custom-control-input" id="checkAll">
                                               <label class="custom-control-label" for="check"></label>
                                           </div>
                                       </th>
		                                       <th>게시글 번호</th>
		                                       <th>게시글 내용</th>
		                                       <th>작성자</th>
		                                       <th>작성일</th>
		                                       <th>첨부파일 여부</th>
		                                       <th>조회수</th>
		                                       <th>${ p.boardTypeNo }</th>
                                   </tr>
                               </thead>
                               
                               <tbody>
                                <c:forEach var="p" items="${ postList }">
                    	           	<tr onclick='location.href = "${contextPath}/board/post/detail?no=${p.postNo}";'>
															    <td>
															        <div class="custom-control custom-checkbox">
															            <input type="checkbox" class="custom-control-input postCheckbox" id="invoicecheck${p.postNo}">
															            <label class="custom-control-label" for="invoicecheck${p.postNo}"></label>
															        </div>
															    </td>
															    
															    <td>${ p.postNo }</td>
															    <td>${ p.postTitle }</td>
															    <td>${ p.writerName }</td>
															    <td>${ p.registDate }</td>
															    <td>${ p.fileStatus == 'Y' ? '★' : ''  }</td>
															    <td>${ p.count }</td>
															
															 
														    <td>
														       <%--   
														        <a href="javascript:void(0);" class="px-3 text-primary edit-btn" data-toggle="modal" data-target="#editPostModal" data-post-no="${p.postNo}" data-dept="${p.dept}" data-name="${p.postName}" data-status="${p.filestatus}">
												                <i class="uil uil-pen font-size-18"></i>
												            </a>
														        <a href="javascript:void(0);" class="px-3 text-danger" data-toggle="tooltip" data-placement="top" title="Delete">
														            <i class="uil uil-trash font-size-18"></i>
														        </a>  
														        --%>
														    </td>
																</tr>
									        	  </c:forEach>
                              </tbody>
                           </table>
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
                           <script>document.write(new Date().getFullYear())</script> © Drezon.
                       </div>
                       <div class="col-sm-6">
                           <div class="text-sm-right d-none d-sm-block">
                               Crafted with <i class="mdi mdi-heart text-danger"></i> by <a href="https://themesbrand.com/" target="_blank" class="text-reset">Themesbrand</a>
                           </div>
                       </div>
                   </div>
               </div>
           </footer>
       </div>
       
         <!-- end main content-->

     </div>
     <!-- END layout-wrapper -->

     <!-- Right Sidebar -->
     <div class="right-bar">
         <div data-simplebar class="h-100">
             <div class="rightbar-title px-3 py-4">
                 <a href="javascript:void(0);" class="right-bar-toggle float-right">
                     <i class="mdi mdi-close noti-icon"></i>
                 </a>
                 <h5 class="m-0">Settings</h5>
             </div>

             <!-- Settings -->
             <hr class="mt-0" />
             <h6 class="text-center mb-0">Choose Layouts</h6>

             <div class="p-4">
                 <div class="mb-2">
                     <img src="assets/images/layouts/layout-1.jpg" class="img-fluid img-thumbnail" alt="">
                 </div>
                 <div class="custom-control custom-switch mb-3">
                     <input type="checkbox" class="custom-control-input theme-choice" id="light-mode-switch" checked />
                     <label class="custom-control-label" for="light-mode-switch">Light Mode</label>
                 </div>
 
                 <div class="mb-2">
                     <img src="assets/images/layouts/layout-2.jpg" class="img-fluid img-thumbnail" alt="">
                 </div>
                 <div class="custom-control custom-switch mb-3">
                     <input type="checkbox" class="custom-control-input theme-choice" id="dark-mode-switch" data-bsStyle="assets/css/bootstrap-dark.min.css" data-appStyle="assets/css/app-dark.min.css" />
                     <label class="custom-control-label" for="dark-mode-switch">Dark Mode</label>
                 </div>
 
                 <div class="mb-2">
                     <img src="assets/images/layouts/layout-3.jpg" class="img-fluid img-thumbnail" alt="">
                 </div>
                 <div class="custom-control custom-switch mb-5">
                     <input type="checkbox" class="custom-control-input theme-choice" id="rtl-mode-switch" data-appStyle="assets/css/app-rtl.min.css" />
                     <label class="custom-control-label" for="rtl-mode-switch">RTL Mode</label>
                 </div>

         
             </div>
					</div>
         </div> <!-- end slimscroll-menu-->
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
     <script src="${contextPath}/libs/waypoints/lib/jquery.waypoints.min.js"></script>
     <script src="${contextPath}/libs/jquery.counterup/jquery.counterup.min.js"></script>
     <script src="${contextPath}/libs/feather-icons/feather.min.js"></script>

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
