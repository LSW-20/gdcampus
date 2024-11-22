<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <title>Invoice List | Drezon - Responsive Bootstrap 4 Admin Dashboard</title>
        

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
                                    <h4 class="mb-0">학생 List</h4>

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
                                                
                                                <th>학년</th>
                                                <th>학과</th>
                                                <th>이름</th>
                                                <th>재적</th>
                                                <th style="width: 120px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>

                                            
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

                
                
            </div>
            <!-- end main content-->

        </div>
        <!-- END layout-wrapper -->

       


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
        
        
    </body>
</html>
