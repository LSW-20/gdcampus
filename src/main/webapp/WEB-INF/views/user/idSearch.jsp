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
                                    <h5 class="text-primary">Register Account</h5>
                                    <p class="text-muted">Get your free Drezon account now.</p>
                                </div>
                                <div class="p-2 mt-4">
   <form id="emailForm">
    <div class="form-group">
        <label for="username">Username</label>
        <input type="text" class="form-control" id="userName" name="userName" placeholder="Enter username">
    </div>

    <label for="useremail" class="me-2">Email</label>
    <div class="form-group d-flex align-items-center">
        <input type="email" class="form-control me-2" id="email" name="email" placeholder="Enter email">
        <button type="button" id="sendEmailButton" class="btn btn-secondary waves-effect waves-light" style="height: 38px; width:180px;">
            인증번호 발송
        </button>
    </div>
</form>

                                    
                                    <form action="">
                                        <div class="form-group">
                                            <label for="userpassword">인증번호</label>
                                            <input type="password" class="form-control" id="userpassword" placeholder="인증번호 6자리 입력" readonly>        
                                        </div>
                    
                                        <div class="mt-3 text-right">
                                            <button class="btn btn-primary btn-block waves-effect waves-light" type="submit">확 인</button>
                                        </div>
                                    </form>
                                        <div class="mt-4 text-center">
                                            <p class="text-muted mb-0">Already have an account ? <a href="auth-login.html" class="font-weight-medium text-primary"> Login</a></p>
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
			    $(document).ready(function() {
			        // 인증번호 발송 버튼 클릭 이벤트
			        $('#sendEmailButton').on('click', function(event) {
			            event.preventDefault(); // form 제출 기본 동작 차단
			
			            var email = $('#email').val();
			            var userName = $('#userName').val();

			            document.getElementById("userpassword").removeAttribute("readonly");
			            
			            // 이메일 주소와 사용자 이름이 비어 있는지 확인
			            if (!email || !userName) {
			                alert('이메일 주소와 사용자 이름을 입력해주세요.');
			                return;
			            }
			
			            // Ajax 요청으로 이메일 인증 요청 보내기
			            $.ajax({
			                type: 'POST',
			                url: '${contextPath}/mailSend',  // 서버에서 정의한 URL
			                data: {
			                    email: email,
			                    userName: userName
			                },
			                success: function(response) {
			                    alert('인증번호가 발송되었습니다.');
			                    // 성공적으로 인증번호를 발송했을 때 추가 로직을 처리할 수 있습니다.
			                },
			                error: function(xhr, status, error) {
			                    alert('인증번호 발송에 실패했습니다. 다시 시도해주세요.');
			                }
			            });
			        });
			    });
			</script>
				
    </body>
</html>