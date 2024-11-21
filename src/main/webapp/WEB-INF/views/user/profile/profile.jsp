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
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

		<style>
		  .form-control {
		    cursor: default;
		  }
		</style>
    </head>

    
    <body data-topbar="dark"  data-sidebar="dark">

    <!-- <body data-layout="horizontal" data-topbar="colored"> -->

		
        <!-- Begin page -->
        <div id="layout-wrapper">

  	<!-- header 시작 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <!-- header 끝 -->


		<!-- sidebar 시작 -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />				
		<!-- sidebar 끝 -->		
            

            

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
																						    <!-- 원형으로 표시할 이미지 -->
																						    <img id="profileImg" src="${ contextPath }<c:out value='${ loginUser.profileURL }' default='${contextPath}/images/users/avatar-4.jpg' />"
																						         onclick="$('#profileImgFile').click();"
																						         style="border-radius: 50%; width: 100%; height: 100%; object-fit: cover;">
																						    <!-- 파일 업로드 input -->
																						    <input type="file" class="file" id="profileImgFile" style="display:none;" accept="image/*">
																						</div>
                                            <h5 class="mt-4 mb-2">${loginUser.userName }</h5>
                                            <p class="text-muted">
	                                            <i class="icon-xs mr-1 icon" data-feather="monitor"></i> 
	                                            
	                                            
	                                            <c:choose>
	                                            	<c:when test="${ not empty loginUser.deptNo}">
	                                            	 ${loginUser.deptList[0].deptName}${loginUser.rankList[0].rankName}
	                                            	</c:when>
	                                            	<c:otherwise>
	                                            	</c:otherwise>
	                                            </c:choose>
                                            </p>
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
        
                                        <h4 class="card-title">회원정보</h4><br>
                                      
    <form action="${contextPath }/user/profile/modify.do" class="custom-validation" id="modiform" method="post">
		    <div class="form-group">
		        <label>이름</label>
		        <div>
		            <input type="text" class="form-control" required="" data-parsley-minlength="6" value="${loginUser.userName}" readonly id="userName" name="userName">
		        </div>
		    </div>
		    <div class="form-group">
		        <label>전화번호</label>
		        <div>
		        
		            <input type="text" class="form-control" required="" data-parsley-maxlength="6" value="${loginUser.phone}" readonly id="phone" name="phone"  pattern="^\d{3}-\d{4}-\d{4}$">
		        </div>
		    </div>
		    <div class="form-group">
		        <label>이메일</label>
		        <div>
		            <input type="text" class="form-control" required="" data-parsley-length="[5,10]"  value="${loginUser.email}" readonly id="email" name="email" pattern="^[^@]+@[^@]+\.[a-zA-Z]{2,}$">
		        </div>
		    </div>
		    <div class="form-group">
		        <label>주소</label>
		        <div>
		            <input type="text" class="form-control" required="" data-parsley-min="6" value="${loginUser.address}" readonly id="address" name="address" >
		        </div>
		    </div>
		    <div class="form-group">
		        <label>성별</label>
		        <div>
		            <input type="text" class="form-control" required="" data-parsley-max="6" value="${loginUser.gender eq 'M' ? '남자' : '여자'}" readonly id="gender" name="gender">
		        </div>
		    </div>
		
				<!-- userId를 넘기는 히든버튼 -->
				<input type="hidden" value="${loginUser.userId}" name="userId">
		    <!-- 수정하기 버튼 -->
		    <div class="form-group mb-0">
		        <div class="d-flex justify-content-end">
		            <button type="button" class="btn btn-light waves-effect mr-1" id="editButton" onclick="enableEdit()">수정하기</button>
		        </div>
		    </div>
				<div class="form-group mb-0">
				    <div class="d-flex justify-content-end">
				        <!-- 취소 버튼 (숨겨져 있음) -->
				        <button type="button" class="btn btn-secondary waves-effect waves-light mr-1" id="cancelButton" style="display: none;" onclick="resetForm()">취소</button>
				        
				        <!-- 수정완료 버튼 (숨겨져 있음) -->
				        <button type="submit" class="btn btn-success waves-effect waves-light mr-1" id="saveButton" style="display: none;">수정완료</button>
				    </div>
				</div>
				
		</form>
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
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>
        <script src="assets/libs/waypoints/lib/jquery.waypoints.min.js"></script>
        <script src="assets/libs/jquery.counterup/jquery.counterup.min.js"></script>
        <script src="assets/libs/feather-icons/feather.min.js"></script>

        <!-- apexcharts -->
        <script src="assets/libs/apexcharts/apexcharts.min.js"></script>

        <script src="assets/js/pages/profile.init.js"></script>

        <script src="assets/js/app.js"></script>
        
		<script>
    // 수정 전 초기 값 저장
    var initialValues = {};

    function enableEdit() {
        var inputFields = document.getElementsByClassName("form-control");

        // 현재 입력된 값들 저장
        initialValues.userName = document.getElementById("userName").value;
        initialValues.phone = document.getElementById("phone").value;
        initialValues.email = document.getElementById("email").value;
        initialValues.address = document.getElementById("address").value;
        initialValues.gender = document.getElementById("gender").value.trim() === "남자" ? "M" : "F"; // 성별 저장 (M/F 변환)

        // readonly 속성 제거
        document.getElementById("userName").removeAttribute("readonly");
        document.getElementById("phone").removeAttribute("readonly");
        document.getElementById("email").removeAttribute("readonly");
        document.getElementById("address").removeAttribute("readonly");


        // gender 필드를 셀렉트 박스로 변경
        var genderField = document.getElementById("gender");
        genderField.outerHTML = 
            '<select id="gender" class="form-control" name="gender" required>' +
            '<option value="M" ' + (initialValues.gender === 'M' ? 'selected' : '') + '>남자</option>' +
            '<option value="F" ' + (initialValues.gender === 'F' ? 'selected' : '') + '>여자</option>' +
            '</select>';

        // 버튼 표시/숨김 설정
        document.getElementById("editButton").style.display = "none"; // 수정하기 버튼 숨기기
        document.getElementById("saveButton").style.display = "inline-block"; // 수정완료 버튼 표시
        document.getElementById("cancelButton").style.display = "inline-block"; // 취소 버튼 표시


        // 각 input 요소에 대해 마우스 오버 이벤트 설정
        for (var i = 0; i < inputFields.length; i++) {
            inputFields[i].onmouseover = function() {
                this.style.cursor = 'text';  // 마우스를 올리면 커서가 텍스트 입력 모양으로 변경
            };
        }
    }

    // 초기 값으로 리셋하는 함수
    function resetForm() {
        // 초기 값으로 폼 리셋
        document.getElementById("userName").value = initialValues.userName;
        document.getElementById("phone").value = initialValues.phone;
        document.getElementById("email").value = initialValues.email;
        document.getElementById("address").value = initialValues.address;
        // 성별 값 변환 (M -> 남자, F -> 여자)
        var genderText = initialValues.gender === "M" ? "남자" : "여자";

        // gender 필드를 텍스트로 복원
        var genderField = document.getElementById("gender");
        genderField.outerHTML = '<input type="text" class="form-control" id="gender" value="' + genderText + '" readonly>';


        // readonly 속성 복원
        document.getElementById("userName").setAttribute("readonly", "true");
        document.getElementById("phone").setAttribute("readonly", "true");
        document.getElementById("email").setAttribute("readonly", "true");
        document.getElementById("address").setAttribute("readonly", "true");

        
        // 수정하기 버튼 보이기
        document.getElementById("editButton").style.display = "inline-block";

        // 수정완료 버튼 숨기기
        document.getElementById("saveButton").style.display = "none";

        // 취소 버튼 숨기기
        document.getElementById("cancelButton").style.display = "none";

        // 각 input 요소의 마우스 오버 이벤트 제거
        var inputFields = document.getElementsByClassName("form-control");
				for (var i = 0; i < inputFields.length; i++) {
				    inputFields[i].onmouseover = function() {
				        this.style.cursor = 'default';  // 마우스를 올리면 커서가 기본 모양으로 변경
				    };
				}
    }
		</script>
		<script>
       	$(document).ready(function(){
       		$("#profileImgFile").on("change",function(evt){
       			const files = evt.target.files;//FileList{File,File}
       			
       			//선택된 파일이 있을 경우
       			if(files.length != 0){//비동기식으로 파일 전송 업로드 + DB기록
       				let formData = new FormData();
       				formData.append("uploadFile",files[0]);
       				$.ajax({
       					url: '${contextPath}/user/updateProfile.do',
       					type: 'post',
       					data: formData,
       					processData: false,//문자열변경 전달 default값 설정 해제를 위해
       					contentType: false,//두개 false해두기
       					success: function(resData){
       						if(resData == "SUCCESS"){
       							location.reload();
       						}else {
       							alert("프로필 이미지 변경 실패");
       						}
       					}
       				})
       			}
       			
       		})
       	})
       </script>

<script src="${ contextPath }/resources/js/fileValidate.js"></script>
    </body>
</html>
