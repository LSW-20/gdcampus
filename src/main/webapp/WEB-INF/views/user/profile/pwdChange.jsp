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
		
		<style>
			.uncheck {display:none;}/* 유효성 검사 전일 경우(값 입력 전) */
			.smallfont {font-size:0.8em;}
			.unusable {color: red;}/* 사용불가능일 경우 */
			.usable {color: green;}/* 사용 가능일 경우 */
		</style>
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
		        <input type="password" class="form-control" id="userPwd" name="newPwd" placeholder="영문,숫자 포함 8~20 글자로 작성 " required>
		        <div id="pwdCheck_result" class="uncheck smallfont"></div>
		    </div>
		
		    
		    <div class="form-group">
		    		<label for="pwdCheck">Re-Enter Password</label>
		        <input type="password" class="form-control me-2" id="pwdCheck" name="pwdCheck" placeholder="Re-enter password" required>
		        <div id="pwdEqualCheck_result" class="uncheck smallfont"></div>
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
				let pwdResult = false;
       	let pwdEqualResult = false;
       	
	      //굳이 작성 된 게 없다면 유효성쳌 필요x 글 지워져야함
	    	//input요소에 작성 된 값이 없는지 체크해 주는 함수
	    	function noValueCheck($input,$result){	//input:비교할input요소객체, result:메세지출력되는 div요소객체
	    		//공백제거값 길이가 0 = 값이 비어있는 경우
	    		if($input.val().trim().length == 0){
	    			$result.removeClass("usable unusable")
	    						 .addClass("uncheck")
	    						 .text("");//uncheck활성화(결과영역 출력 메세지 숨김처리)
	    			return false;//유효성검사 진행필요 없어서 false
	    		}
	    		return true;//유효성검사 진행하도록 true
	    	}
	      
	    	//input요소에 작성 된 값이 정규식에 만족하는지 체크해주는 함수
        	function regExpCheck($input, $result, regExp, msg1, msg2){
        		if(regExp.test($input.val())){//유효한 값으로 잘 입력 됐을 경우
        			$result.removeClass("uncheck unusable")
        						 .addClass("usable")
        						 .text(msg1);
        			return true;
        		}else {//유효하지 않은 값으로 입력 됐을 경우
        			$result.removeClass("uncheck usable")
        						 .addClass("unusable")
        						 .text(msg2);
        			return false;
        		}
        	}
	    	
        	//pwd유효성 검사
	    		$("#pwdChangeForm #userPwd").on("keyup",function(){
	    			//0-9는 \d로 퉁칠수잇슴, 8글자이상,15글자이하, i:ignore(대소문자구분X)
	    			//비밀번호 정규식은 따로 제공되기도 한다
	    			let regExp = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,15}$/;
	    			//여기서 $(this)는 $("#signup_form #userPwd")를 가리킴
	    			pwdResult = noValueCheck($(this), $("#pwdCheck_result"))
	    									&& regExpCheck($(this),$("#pwdCheck_result")
	    															,regExp,'사용가능한 비밀번호'
	    															,'영문,숫자 포함 8~15자리로 작성');//해당조건이 true일 경우 실행
	    			
	    			validate();//모든값 유효?	
	    			
	    		})//pwd check end            		
	    		
	    		//pwdCheck유효성 검사
	    		$("#pwdChangeForm #pwdCheck").on("keyup",function(){
	    			
	    			//일치하는지 비교 할 거임
	    			//비교할 패턴이 위(pwd유효성 검사)와 동일한지 비교
	    			let regExp = new RegExp("^" + $("#pwdChangeForm #userPwd").val() + "$");//^  $ 안쓰면 contain처리됨
	    			
	    			pwdEqualResult = pwdResult && noValueCheck($(this),$("#pwdEqualCheck_result"))
	    																 && regExpCheck($(this),$("#pwdEqualCheck_result")
	    																											 , regExp,'비밀번호가 일치합니다.'
	    																						 									 ,'비밀번호가 일치하지 않습니다.');
	    			validate();
	    		})//pwd equal check end 
	    	
      	</script>
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
	    	
    	<script>
		    // 폼 제출 시 비밀번호 확인을 수행하는 JavaScript
		    document.getElementById("pwdChangeForm").addEventListener("submit", function(event) {
		        // 비밀번호와 비밀번호 재입력 값 가져오기
		        var password = document.getElementById("userPwd").value; // ID에 맞춰 수정
		        var confirmPassword = document.getElementById("pwdCheck").value;

		        // 비밀번호 유효성 검사: 영문과 숫자 혼용, 8자 이상 20자 이하
		        var passwordPattern = /^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,20}$/;
		        if (!passwordPattern.test(password)) {
		            alert("비밀번호는 영문과 숫자를 혼용하여 최소 8자 이상, 최대 20자 이내로 입력해주세요.");
		            event.preventDefault(); // 폼 제출 막기
		            return;
		        }
		        
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