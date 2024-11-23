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
    <form id="emailForm">
	    <div class="form-group">
	        <label for="userid">UserID</label>
	        <input type="text" class="form-control" id="userId" name="userId" placeholder="Enter userID">
	    </div>
	
	    <label for="useremail" class="me-2">Email</label>
	    <div class="form-group d-flex align-items-center">
	        <input type="email" class="form-control me-2" id="email" name="email" placeholder="Enter email">
	        <button type="button" id="sendEmailButton" class="btn btn-secondary waves-effect waves-light" style="height: 38px; width:180px;">
	            인증번호 발송
	        </button>
	    </div>
		</form>

                                    
                                    <form action="${contextPath }/user/selectPwd" onsubmit="return addHiddenFields()" method="post">
                                        <div class="form-group">
                                            <label for="userpassword">인증번호</label>
                                            <input type="text" class="form-control" id="userpassword" placeholder="인증번호 6자리 입력" name="certNo" id="certNo" readonly>        
                                        </div>
                                        <div class="mt-3 text-right">
                                            <button class="btn btn-primary btn-block waves-effect waves-light" type="submit">확 인</button>
                                        </div>
																		    <input type="hidden" id="hiddenEmail" name="email">
																		    <input type="hidden" id="hiddenUserId" name="userId">
                                    </form>
                                        <div class="mt-4 text-center">
                                            <p class="text-muted mb-0">Already have an account ? <a href="${contextPath }/" class="font-weight-medium text-primary"> Login</a></p>
                                        </div>
            
                                        
                                </div>
                            </div>
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
			var verificationCode = null;

			$(document).ready(function() {
			    // 인증번호 발송 버튼 클릭 이벤트
			    $('#sendEmailButton').on('click', function(event) {
			        event.preventDefault(); // form 제출 기본 동작 차단

			        var email = $('#email').val();
			        var userId = $('#userId').val();

			        document.getElementById("userpassword").removeAttribute("readonly");

			        // 이메일 주소와 사용자 아이디 비어 있는지 확인
			        if (!email || !userId) {
			            alert('이메일 주소와 사용자 아이디를 입력해주세요.');
			            return;
			        }

			        // Ajax 요청으로 이메일 인증 요청 보내기
			        $.ajax({
			            type: 'POST',
			            url: '${contextPath}/mailSendPwd',  // 서버에서 정의한 URL
			            data: {
			                email: email,
			                userId: userId
			            },
			            success: function(response) {
			                alert('인증번호가 발송되었습니다.');
			                // 서버 응답에서 인증번호를 받아와서 사용
			                verificationCode = response.verificationCode;
			                console.log("Received verification code:", verificationCode);
			            },
			            error: function(xhr, status, error) {
			                alert('인증번호 발송에 실패했습니다. 다시 시도해주세요.');
			            }
			        });
			    });
			});

			// 인증번호 입력 후, hidden 필드 값 설정 및 인증번호 비교
			function addHiddenFields() {
			    if (!verificationCode) {
			        alert("인증번호 발송을 먼저 해주세요.");
			        return false; // 인증번호가 발송되지 않았다면 폼을 제출하지 않음
			    }

			    // 첫 번째 폼에서 이메일과 아이디를 가져와 숨은 필드에 설정
			    document.getElementById('hiddenEmail').value = document.getElementById('email').value;
			    document.getElementById('hiddenUserId').value = document.getElementById('userId').value;
			    
			    // 입력한 인증번호와 서버에서 받은 verificationCode를 비교
			    var inputCode = document.getElementById('certNo').value;

			    if (inputCode.toString() === verificationCode.toString()) {
			        return true; // 인증번호가 일치하면 폼 제출
			    } else {
			        alert("인증번호가 일치하지 않습니다. 다시 시도해주세요.");
			        return false; // 인증번호가 일치하지 않으면 폼 제출을 막음
			    }
			}
			</script>
				
    </body>
</html>