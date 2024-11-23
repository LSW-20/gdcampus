<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
    <head>
        
        <meta charset="utf-8" />
        <title>Register | Drezon - Responsive Bootstrap 4 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="${contextPath}/images/favicon.ico">

        <!-- Bootstrap Css -->
        <link href="${contextPath}/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="${contextPath}/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="${contextPath}/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

				<!-- jQuery should be loaded first -->
				<script src="${contextPath}/libs/jquery/jquery.min.js" defer></script>
				
				<!-- Other JS libraries -->
				<script src="${contextPath}/libs/bootstrap/js/bootstrap.bundle.min.js" defer></script>
				<script src="${contextPath}/libs/metismenu/metisMenu.min.js" defer></script>
				<script src="${contextPath}/libs/simplebar/simplebar.min.js" defer></script>
				<script src="${contextPath}/libs/node-waves/waves.min.js" defer></script>
				<script src="${contextPath}/libs/waypoints/lib/jquery.waypoints.min.js" defer></script>
				<script src="${contextPath}/libs/jquery.counterup/jquery.counterup.min.js" defer></script>
				<script src="${contextPath}/libs/feather-icons/feather.min.js" defer></script>
				<script src="${contextPath}/libs/apexcharts/apexcharts.min.js" defer></script>
				
				<!-- App JS -->
				<script src="${contextPath}/js/app.js" defer></script>

    </head>


    <body class="authentication-bg" style="background-image: url(assets/images/auth-bg.png)">

        <div class="account-pages mt-5 mb-4 pt-sm-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <a href="#" class="mb-5 d-block auth-logo">
                                <img src="assets/images/logo-dark.png" alt="" height="22" class="logo logo-dark">
                                <img src="assets/images/logo-light.png" alt="" height="22" class="logo logo-light">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card">
                           
                            <div class="card-body p-4" style="height:440px"> 
                                <div class="text-center mt-2">
                                    <h5 class="text-primary"><b>아이디 찾기</b></h5>
                                </div>
    														<div class="d-flex justify-content-center align-items-center" style="height: 100%; transform: translateY(-50px);">
														        <div class="text-center">
														            <p style="font-size: 18px;">회원님의 아이디는<br>${ID} 입니다<br><br></p>
														            <p>
														            	<a href="${contextPath }/" class="font-weight-medium text-primary"> 로그인하러가기</a>
														            </p>
														        </div>
														        
														    </div>
                						</div>
                						</div>
                						</div>
                						</div>
            </div>
            
            
            <!-- end container -->
        </div>

        <!-- JAVASCRIPT -->
        <script src="${contextPath }/libs/jquery/jquery.min.js"></script>
        <script src="${contextPath }/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath }/libs/metismenu/metisMenu.min.js"></script>
        <script src="${contextPath }/libs/simplebar/simplebar.min.js"></script>
        <script src="${contextPath }/libs/node-waves/waves.min.js"></script>
        <script src="${contextPath }/libs/waypoints/lib/jquery.waypoints.min.js"></script>
        <script src="${contextPath }/libs/jquery.counterup/jquery.counterup.min.js"></script>
        <script src="${contextPath }/libs/feather-icons/feather.min.js"></script>

        <script src="${contextPath }/js/app.js"></script>

		
				
    </body>
</html>