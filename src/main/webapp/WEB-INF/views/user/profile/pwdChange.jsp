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
                           
                            <div class="card-body p-4"> 
                                <div class="text-center mt-2">
                                    <h5 class="text-primary"><b>비밀번호 변경</b></h5>
                                </div>
                                <div class="p-2 mt-4">
   <form id="pwdChangeForm" method="POST" action="/user/pwdUpdate">
		    <div class="form-group">
		        <label for="userPwd">New Password</label>
		        <input type="password" class="form-control" id="userPwd" name="newPwd" placeholder="Enter new Password" required>
		    </div>
		
		    <label for="pwdCheck" class="me-2">Re-Enter Password</label>
		    <div class="form-group d-flex align-items-center">
		        <input type="password" class="form-control me-2" id="pwdCheck" name="pwdCheck" placeholder="Re-enter password" required>
		    </div>
		    
		    <div class="mt-3 text-right">
		        <button class="btn btn-primary btn-block waves-effect waves-light" type="submit">확 인</button>
		    </div>
		</form>

                                    
                                   
                                        <div class="mt-4 text-center">
                                            <p class="text-muted mb-0">Already have an account ? <a href="${contextPath }/" class="font-weight-medium text-primary"> Login</a></p>
                                        </div>
            
                                        
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

			<script>
			    // 폼 제출 시 비밀번호 확인을 수행하는 JavaScript
			    document.getElementById("pwdChangeForm").addEventListener("submit", function(event) {
			        // 비밀번호와 비밀번호 재입력 값 가져오기
			        var password = document.getElementById("userPwd").value; // ID에 맞춰 수정
			        var confirmPassword = document.getElementById("pwdCheck").value;
			
			        // 두 비밀번호가 일치하는지 확인
			        if (password !== confirmPassword) {
			            // 비밀번호가 일치하지 않으면 경고 메시지 출력하고 폼 제출을 막음
			            alert("비밀번호가 일치하지 않습니다. 다시 확인해주세요.");
			            event.preventDefault(); // 폼 제출 막기
			        }
			    });
			</script>
    </body>
</html>