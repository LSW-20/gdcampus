<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
        <meta charset="utf-8" />
        <title>Profile | Drezon - Responsive Bootstrap 4 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${contextPath }/images/favicon.ico">

        <!-- Bootstrap Css -->
        <link href="${contextPath }/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="${contextPath }/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="${contextPath }/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

    </head>
 <body data-topbar="dark" data-sidebar="dark">

    <!-- <body data-layout="horizontal" data-topbar="colored"> -->

        <!-- Begin page -->
        <div id="layout-wrapper">

    <!-- header 시작 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <!-- header 끝 -->


		<!-- sidebar 시작 -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />				
		<!-- sidebar 끝 -->		
>

            

            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="main-content">

                <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0">Profile</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Contacts</a></li>
                                            <li class="breadcrumb-item active">Profile</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-xl-3">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dropdown float-right">
                                            <a class="text-body dropdown-toggle font-size-18" href="#" role="button" data-toggle="dropdown" aria-haspopup="true">
                                              <i class="uil uil-ellipsis-v"></i>
                                            </a>
                                          
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                        <div class="text-center mt-3 mb-4">
                                            <div class="avatar-xl rounded-circle p-2 border border-soft-primary mx-auto">
                                                <img src="assets/images/users/avatar-4.jpg" alt="" class="img-fluid rounded-circle">
                                            </div>
                                            <h5 class="mt-4 mb-2">Marie Hensley</h5>
                                            <p class="text-muted"><i class="icon-xs mr-1 icon" data-feather="monitor"></i> Web Developer</p>
                                        </div>
                                        <div class="row justify-content-center mt-4 pt-2">
                                            <div class="col-3">
                                                <a href="#">
                                                    <div class="avatar mx-auto">
                                                        <div class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                            <i class="icon-sm" data-feather="mail"></i>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-3">
                                                <a href="#">
                                                    <div class="avatar mx-auto">
                                                        <div class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                            <i class="icon-sm" data-feather="phone"></i>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-3">
                                                <a href="#">
                                                    <div class="avatar mx-auto">
                                                        <div class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                            <i class="icon-sm" data-feather="globe"></i>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title mb-4">Projects</h4>

                                        <h5 class="mb-2">UI/UX Design Updates</h5>
                                        <p class="text-muted">Reached 20,450 sales</p>
                                        <div class=" mt-4">
                                            <h6 class="mb-0 float-right">70/100</h6>
                                            <h6 class="mb-3"><i class="icon-xs icon text-muted mr-1" data-feather="list"></i>Progress</h6>
                                        </div>
                                        <div class="progress" style="height: 8px;">
                                            <div class="progress-bar" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <div class="row align-items-center my-4">
                                            <div class="col-6">
                                                <span class="bg-soft-primary d-inline-block px-2 py-1 border border-soft-primary rounded text-primary">15th Oct, 2020</span>
                                            </div>
                                            <div class="col-6">
                                                <ul class="list-inline text-right mb-0">
                                                    <li class="list-inline-item mr-1">
                                                        <img src="assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded">
                                                    </li>
                                                    <li class="list-inline-item mr-1">
                                                        <img src="assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded">
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <a href="#">
                                                            <div class="avatar-xs">
                                                                <span class="avatar-title rounded bg-soft-primary font-size-15 text-primary">5+</span>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row text-center mt-4">
                                            <div class="col-4">
                                                <h5 class="mb-1">5.2M</h5>
                                                <p class="text-muted mb-0">Followers</p>
                                            </div>

                                            <div class="col-4">
                                                <h5 class="mb-1">10.5K</h5>
                                                <p class="text-muted mb-0">Following</p>
                                            </div>

                                            <div class="col-4">
                                                <h5 class="mb-1">5.8K</h5>
                                                <p class="text-muted mb-0">Shot</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body">
                                        <div class="media">
                                            <div class="avatar mr-3">
                                                <div class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                    <i class="icon-sm" data-feather="layout"></i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <h5 class="font-size-15 my-1">Admin Projects</h5>
                                                <p class="text-muted font-size-14 mb-2">UI/UX Design</p>
                                                <p class="text-muted mb-0">Itaque earum rerum hic tenetur a sapiente delectus.</p>
                                            </div>
                                            <a href="#">
                                                <div class="dropdown">
                                                    <a class="text-body dropdown-toggle font-size-20" href="#" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                      <i class="uil uil-ellipsis-v"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Remove</a>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body">
                                        <div class="media">
                                            <div class="avatar mr-3">
                                                <div class="avatar-title rounded-circle bg-soft-success text-success">
                                                    <i class="icon-sm" data-feather="globe"></i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <h5 class="font-size-15 mb-1">Freelancer Work</h5>
                                                <p class="text-muted font-size-14 mb-2">UI/UX Design</p>
                                                <p class="text-muted mb-0">Itaque earum rerum hic tenetur a sapiente delectus.</p>
                                            </div>
                                            <a href="#">
                                                <div class="dropdown">
                                                    <a class="text-body dropdown-toggle font-size-20" href="#" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                      <i class="uil uil-ellipsis-v"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Remove</a>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-9">
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-7">
                                                        <h4 class="mb-1">15</h4>
                                                        <p class="text-muted mb-4">Pending Projects</p>
                                                        <p class="text-muted mb-0"><i class="icon-xs text-danger mr-2" data-feather="trending-down"></i>30.12%</p>
                                                    </div>
                                                    <div class="col-5">
                                                        <div>
                                                            <div class="apex-charts" id="sparkline-chart-2"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-7">
                                                        <h4 class="mb-1">$40,236</h4>
                                                        <p class="text-muted mb-4">Total Revenue</p>
                                                        <p class="text-muted mb-0"><i class="icon-xs text-success mr-2" data-feather="trending-up"></i>78.45%</p>
                                                    </div>
                                                    <div class="col-5">
                                                        <div>
                                                            <div class="apex-charts" id="sparkline-chart-3"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                               <!-- 근무일정 -->
                                <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row align-items-center">
													    <div class="col-12">
													    <table id="data-table" class="table" style="text-align: center; width: 100%;">
													        <thead>
													            <tr>
													                <th colspan="3"><b>근무 시간</b></th>
													            </tr>
													            <tr>
													               <td>근무일수 &nbsp| 총 근무시간  &nbsp| 근무일수</td> 
													         
													            </tr>
													        </thead>
													        <tbody>
													            <!-- Ajax 요청으로 추가된 데이터가 여기에 삽입됩니다 -->
													        </tbody>
													    </table>
													</div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
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
        <script src="${contextPath }/libs/jquery/jquery.min.js"></script>
        <script src="${contextPath }/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath }/libs/metismenu/metisMenu.min.js"></script>
        <script src="${contextPath }/libs/simplebar/simplebar.min.js"></script>
        <script src="${contextPath }/libs/node-waves/waves.min.js"></script>
        <script src="${contextPath }/libs/waypoints/lib/jquery.waypoints.min.js"></script>
        <script src="${contextPath }/libs/jquery.counterup/jquery.counterup.min.js"></script>
        <script src="${contextPath }/libs/feather-icons/feather.min.js"></script>

        <!-- apexcharts -->
        <script src="${contextPath }/libs/apexcharts/apexcharts.min.js"></script>

        <script src="${contextPath }/js/pages/profile.init.js"></script>

        <script src="${contextPath }/js/app.js"></script>
        
        <script>
        $(document).ready(function () {
            const userNo = "${loginUser.userNo}"; // 세션 값 가져오기
            
            $.ajax({
                url: '${contextPath}/holiday/works.do', // 컨트롤러의 매핑 경로
                type: 'GET',
                data: { userNo: userNo }, // 데이터를 컨트롤러로 전달
                success: function (status) {
                    // 데이터를 테이블의 tbody에 추가
                    const tbody = '<tr><td>' + status.arDate +"&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp   |   " + "&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" +status.arTime +  " &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp | &nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp" + status.arAv + '</td></tr>';
                    $('#data-table tbody').append(tbody); // 테이블 ID가 'data-table'인 경우
                },
                error: function (xhr, status, error) {
                    console.error("컨트롤러 호출 실패:", error);
                }
            });
        });
    </script>

    </body>
</html>