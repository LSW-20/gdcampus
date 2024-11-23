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
	
	             <!-- start page title -->
	             <div class="row">
	                 <div class="col-12">
	                     <div class="page-title-box d-flex align-items-center justify-content-between">
	                         <h4 class="mb-0">게시판</h4>
	
	                         <div class="page-title-right">
	                             <ol class="breadcrumb m-0">
	                                 <li class="breadcrumb-item"><a href="javascript: void(0);">Invoices</a></li>
	                                 <li class="breadcrumb-item active">Invoice List</li>
	                             </ol>
	                         </div>
	
	                     </div>
	                 </div>
	             </div>
	             <!-- end page title -->
	            
		<!--게시판 추가 모달 창 -->
		<!-- 게시글 생성 -->
		<form action="${contextPath }/board/post/regist" method="POST" id="boardForm">
			<div class="modal fade" id="addboardModal" tabindex="-1" aria-labelledby="addStudentModalLabel" aria-hidden="true">
			    <div class="modal-dialog modal-dialog-centered">
			        <div class="modal-content">
			            <!-- 모달 헤더 -->
			            <div class="modal-header">
			                <h5 class="modal-title" id="addPostModalLabel">Add Post</h5>
			                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
			                    <span aria-hidden="true">&times;</span>
			                </button>
			            </div>
			            <!-- 모달 바디 -->
			            <div class="modal-body">
			                
		                <!-- Select Fields 세로 정렬 -->
		                <div class="form-group">
		                    <label for="select1">게시판유형</label>
		                    <select class="form-control" id="boardTypeNo" name="boardTypeNo" required>
		                        <option value="1">공지사항</option>
		                        <option value="2">자유게시판</option>
		                        <option value="3">투표게시판</option>
		                    </select>
		                </div>
		               
		                </div>
		                
		                <!-- 텍스트 입력 필드 -->
		                <div class="form-group">
		                    <label for="inputText" >이름</label>
		                    <input type="text" class="form-control" id="inputText" name="postName" placeholder="Enter text here" required>
		                </div>
		                
			            </div>
			            <!-- 모달 푸터 -->
			            <div class="modal-footer">
			                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
			                <button type="submit" class="btn btn-primary">Save</button>
			            </div>
			        </div>
			    </div>
			</div>
		</form>
									
									<!-- 학생 수정 모달 -->
									<div class="modal fade" id="editStudentModal" tabindex="-1" aria-labelledby="editStudentModalLabel" aria-hidden="true">
									    <div class="modal-dialog modal-dialog-centered">
									        <div class="modal-content">
									            <!-- 모달 헤더 -->
									            <div class="modal-header">
									                <h5 class="modal-title" id="editStudentModalLabel">Edit Student</h5>
									                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
									                    <span aria-hidden="true">&times;</span>
									                </button>
									            </div>
									            <!-- 모달 바디 -->
									            <div class="modal-body">
									                <!-- Select Fields 세로 정렬 -->
									                <div class="form-group">
									                    <label for="editGrade">학년</label>
									                    <select class="form-control" id="editGrade" required>
									                        <option value="1">1</option>
									                        <option value="2">2</option>
									                        <option value="3">3</option>
									                        <option value="4">4</option>
									                    </select>
									                </div>
									                <div class="form-group">
									                    <label for="editDept">제목</label>
									                    <select class="form-control" id="editDept" required>
									                        <option value="컴퓨터공학과">컴퓨터공학과</option>
									                        <option value="전자공학과">전자공학과</option>
									                    </select>
									                </div>
									                <div class="form-group">
									                    <label for="editStatus">재적상태</label>
									                    <select class="form-control" id="editStatus" required>
									                        <option value="1">재학</option>
									                        <option value="2">휴학</option>
									                        <option value="3">졸업</option>
									                        <option value="4">제적</option>
									                    </select>
									                </div>
									                <!-- 텍스트 입력 필드 -->
									                <div class="form-group">
									                    <label for="editName">이름</label>
									                    <input type="text" class="form-control" id="editName" placeholder="Enter name here" required>
									                </div>
									            </div>
									            <!-- 모달 푸터 -->
									            <div class="modal-footer">
									                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
									                <button type="button" class="btn btn-success waves-effect waves-light" id="saveEditBtn">Save</button>
									            </div>
									        </div>
									    </div>
									</div>
									
									<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
									<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
                    
                    <!-- 학생추가 -->
                     <div class="row">
                         <div class="col-md-4">
                             <div>
                                 <button type="button" class="btn btn-primary waves-effect waves-light mb-3" data-toggle="modal" data-target="#addStudentModal"><i class="mdi mdi-plus mr-1"></i> Add Student</button>
                             </div>
                         </div>
                         <div class="col-md-8">
                             
                         </div>
                     </div>

                     <div class="row">
                         <div class="col-lg-12">
                             
                             <div class="table-responsive custom-table mb-4">
                                 <table class="table table-centered datatable dt-responsive nowrap table-card-list table-check" style="border-collapse: collapse; border-spacing: 0 8px; width: 100%;">
                                     <thead>
                                         <tr class="bg-transparent">
                                             <th style="width: 24px;">
                                                 <div class="custom-control custom-checkbox">
                                                     <input type="checkbox" class="custom-control-input" id="checkAll">
                                                     <label class="custom-control-label" for="checkAll"></label>
                                                 </div>
                                             </th>
                                             
                                             <th>게시글 제목</th>
                                             <th>작성일</th>
                                             <th>첨부파일</th>
                                             <th>조회수</th>
                                             <th>공지사항Y / 자유게시판N</th>
                                             <th style="width: 120px;">Action</th>
                                         </tr>
                                     </thead>
                                     <tbody>
                                      <c:forEach var="p" items="${ postList }">
                                          			<tr>
																						    <td>
																						        <div class="custom-control custom-checkbox">
																						            <input type="checkbox" class="custom-control-input" id="invoicecheck${p.postNo}">
																						            <label class="custom-control-label" for="invoicecheck${p.postNo}"></label>
																						        </div>
																						    </td>
																						    
																						    <td>${ p.postTitle }</td>
																						    <td>${ p.registDate }</td>
																						    <td>${ p.fileStatus }</td>
																						    <td>${ p.count }</td>
																						    <td>${ p.postTop }</td>
																						    
																						      
																						    <td>
																						        <a href="javascript:void(0);" class="px-3 text-primary edit-btn" data-toggle="modal" data-target="#editStudentModal" data-stu-no="${s.stuNo}" data-grade="${s.grade}" data-dept="${s.dept}" data-name="${s.stuName}" data-status="${s.status}">
																				                <i class="uil uil-pen font-size-18"></i>
																				            </a>
																						        <a href="javascript:void(0);" class="px-3 text-danger" data-toggle="tooltip" data-placement="top" title="Delete">
																						            <i class="uil uil-trash font-size-18"></i>
																						        </a>
																						    </td>
																						</tr>
															          </c:forEach>
                                     </tbody>
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
     $(document).on('click', '.edit-btn', function() {
         var stuNo = $(this).data('post-no');
         var grade = $(this).data('grade');
         var dept = $(this).data('dept');
         var name = $(this).data('name');
         var status = $(this).data('status');

         // 모달에 해당 데이터 채우기
         $('#editGrade').val(grade);
         $('#editDept').val(dept);
         $('#editStatus').val(status);
         $('#editName').val(name);
         
         // 추가적으로 postNo를 저장하거나 수정 시 사용할 수 있습니다.
         $('#saveEditBtn').data('post-no', postNo);
     });
     </script>
 </body>
</html>
