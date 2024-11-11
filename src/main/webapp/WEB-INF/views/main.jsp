<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

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
<script>
	if('${alertMsg}' != ''){
		alert('${alertMsg}');
		if('${historyBackYN}' == 'Y'){
			history.back();
		}
	}
</script>

<body class="authentication-bg" style="background-image: url(assets/images/auth-bg.png)">





		
        <div class="account-pages mt-5 mb-4 pt-sm-5">
            <div class="container">
                <div class="row">
                    <div class="col-lg-12">
                        <div class="text-center">
                            <a href="index.html" class="mb-5 d-block auth-logo">
                                <img src="assets/images/logo-dark.png" alt="" height="22" class="logo logo-dark">
                                <img src="assets/images/logo-light.png" alt="" height="22" class="logo logo-light">
                            </a>
                        </div>
                    </div>
                </div>
                <div class="row align-items-center justify-content-center">
                    <div class="col-md-8 col-lg-6 col-xl-5">
                        <div class="card">
                           
                            <div class="card-body p-4"> 
                                <div class="text-center mt-2">
                                    <h5 class="text-primary">Welcome Back !</h5>
                                    <p class="text-muted">구디아카데미 로그인</p>
                                </div>
                                <div class="p-2 mt-4">
                                <form action="${contextPath}/member/signin.do" method="post">
        
                                        <div class="form-group">
                                            <label for="userId">UserID</label>
                                            <input type="text" class="form-control" id="userId" name="userId" placeholder="Enter userID">
                                        </div>
                
                                        <div class="form-group">
                                            
                                            <label for="userPwd">Password</label>
                                            <input type="password" class="form-control" id="userPwd"  name="userPwd" placeholder="Enter password">
                                        </div>
                
                                        <div class="custom-control custom-checkbox">
                                            <input type="checkbox" class="custom-control-input" id="auth-remember-check">
                                            <label class="custom-control-label" for="auth-remember-check">Remember me</label>
                                        </div>
                                        
                                        <div class="mt-3 text-right">
                                            <button class="btn btn-primary btn-block waves-effect waves-light" type="submit"><i class="icon-xs icon mr-1" data-feather="log-in"></i> Log In</button>
                                        </div>
                                        <div class="mt-4 text-center">
                                            <p class="mb-0"><a href="auth-register.html" class="font-weight-medium text-primary">아이디 찾기</a>/ <a href="auth-register.html" class="font-weight-medium text-primary">비밀번호 찾기</a> </p>
                                        </div>
            
                                        
                                    </form>
                                </div>
                            </div>
                        </div>

                        <div class="mt-5 text-center">
                            <p>© 2020 Drezon. Crafted with <i class="mdi mdi-heart text-danger"></i> by Themesbrand</p>
                        </div>

                    </div>
                </div>
                <!-- end row -->
            </div>
            <!-- end container -->
        </div>
</body>
</html>