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
<body data-topbar="dark"  data-sidebar="dark">
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
                                    <h4 class="mb-0">직급 List</h4>


                                </div>
                            </div>
                        </div>
                        <!-- end page title -->
                        
												<!--직급추가 모달 창 -->
												<div class="modal fade" id="addRankModal" tabindex="-1" aria-labelledby="addRankModalLabel" aria-hidden="true">
												    <div class="modal-dialog modal-dialog-centered">
												        <div class="modal-content">
												            <form action="${contextPath}/user/profile/insertRank" method="POST" id="rankForm">
												            <!-- 모달 헤더 -->
												            <div class="modal-header">
												                <h5 class="modal-title" id="addRankModalLabel">Add Rank</h5>
												                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
												                    <span aria-hidden="true">&times;</span>
												                </button>
												            </div>
												            <!-- 모달 바디 -->
												            <div class="modal-body">
												                <!-- 텍스트 입력 필드 -->
												                <div class="form-group">
												                    <label for="inputText" >이름</label>
												                    <input type="text" class="form-control" id="inputText" name="rankName" placeholder="Enter text here" required>
												                </div>
												            </div>
												            <!-- 모달 푸터 -->
												            <div class="modal-footer">
												                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
												                <button type="submit" class="btn btn-primary">Save</button>
												            </div>
												            </form>
												        </div>
												    </div>
												</div>
												
												<!-- 직급 수정 모달 -->
												<div class="modal fade" id="editRankModal" tabindex="-1" aria-labelledby="editRankModalLabel" aria-hidden="true">
												    <div class="modal-dialog modal-dialog-centered">
												        <div class="modal-content">
												        		<form action="${contextPath}/user/profile/updateRank" method="POST" id="rankEditForm">
												            <!-- 모달 헤더 -->
												            <div class="modal-header">
												                <h5 class="modal-title" id="editRankModalLabel">Edit Rank</h5>
												                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
												                    <span aria-hidden="true">&times;</span>
												                </button>
												            </div>
												            <!-- 모달 바디 -->
												            <div class="modal-body">
												                <!-- Select Fields 세로 정렬 -->
												                <div class="form-group">
												                    <label for="editRankNo">직급번호</label>
										                        <input type="text" class="form-control" id="editRankNo" name="rankNo" readonly style="cursor: default;">
												                </div>
												                
												                <!-- 텍스트 입력 필드 -->
												                <div class="form-group">
												                    <label for="editRankName">직급이름</label>
												                    <input type="text" class="form-control" id="editRankName" name="rankName" placeholder="Enter name here" required>
												                </div>
												            </div>
												            <!-- 모달 푸터 -->
												            <div class="modal-footer">
												                <button type="button" class="btn btn-secondary" data-dismiss="modal">Cancel</button>
												                <button type="submit" class="btn btn-success waves-effect waves-light" id="saveEditBtn">Save</button>
												            </div>
												            </form>
												        </div>
												    </div>
												</div>
												
												<!-- 직급삭제모달 -->
												<div class="modal fade" id="deleteConfirmModal" tabindex="-1" aria-labelledby="deleteConfirmModalLabel" aria-hidden="true">
											    <div class="modal-dialog modal-dialog-centered">
											        <div class="modal-content">
											        		<form action="${contextPath}/user/profile/deleteRank" method="POST" id="deleteForm">
											            <!-- 모달 헤더 -->
											            <div class="modal-header">
											                <h5 class="modal-title" id="deleteConfirmModalLabel">삭제 확인</h5>
											                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											                    <span aria-hidden="true">&times;</span>
											                </button>
											            </div>
											            <!-- 모달 본문 -->
											            <div class="form-group" style="display: none;">
									                    <label for="deleteRankNo">직급번호</label>
							                        <input type="text" class="form-control" id="deleteRankNo" name="rankNo" readonly style="cursor: default;">
									                </div>
											            <div class="modal-body">
											                <p>정말로 이 항목을 삭제하시겠습니까?</p>
											            </div>
											            <!-- 모달 푸터 -->
											            <div class="modal-footer">
											                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
											                <button type="submit" class="btn btn-danger" id="confirmDelete">삭제</button>
											            </div>
											            </form>
											        </div>
											    </div>
											</div>
											
											<!-- 직급선택삭제모달 -->
												<div class="modal fade" id="selectConfirmModal" tabindex="-1" aria-labelledby="selectConfirmModalLabel" aria-hidden="true">
											    <div class="modal-dialog modal-dialog-centered">
											        <div class="modal-content">
											            <!-- 모달 헤더 -->
											            <div class="modal-header">
											                <h5 class="modal-title" id="deleteConfirmModalLabel">삭제 확인</h5>
											                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
											                    <span aria-hidden="true">&times;</span>
											                </button>
											            </div>
											            <!-- 모달 본문 -->
											            <div class="modal-body">
											                <p>선택한 항목들을 삭제하시겠습니까?</p>
											            </div>
											            <!-- 모달 푸터 -->
											            <div class="modal-footer">
											                <button type="button" class="btn btn-secondary" data-dismiss="modal">취소</button>
											                <button type="button" class="btn btn-danger" id="confirmDelete" onclick="deleteSelectedRanks()">삭제</button>
											            </div>
											        </div>
											    </div>
											</div>
												<script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
												<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.5.2/dist/js/bootstrap.bundle.min.js"></script>
                       
                       <!-- 직급리스트 -->
                        <div class="row">
                            <div class="col-md-4">
                                <div>
                                    <button type="button" class="btn btn-primary waves-effect waves-light mb-3" data-toggle="modal" data-target="#addRankModal"><i class="mdi mdi-plus mr-1"></i> Add Rank</button>
                                     <button type="button" class="btn btn-danger waves-effect waves-light mb-3" data-toggle="modal" data-target="#selectConfirmModal"><i class="mdi mdi-minus mr-1"></i> Select Delete</button>
                                    
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
                                                        <input type="checkbox" class="custom-control-input" id="checkAll" >
                                                        <label class="custom-control-label" for="checkAll"></label>
                                                    </div>
                                                </th>
                                                <th>직급</th>
                                                <th style="width: 120px;">Action</th>
                                            </tr>
                                        </thead>
                                        <tbody>
                                            <c:forEach var="r" items="${ rankList }">
                                            			<tr>
																								    <td>
																								        <div class="custom-control custom-checkbox">
																								            <input type="checkbox" class="custom-control-input" id="invoicecheck${r.rankNo}" data-rank-no="${r.rankNo}">
																								            <label class="custom-control-label" for="invoicecheck${r.rankNo}"></label>
																								        </div>
																								    </td>
																								    <td>${r.rankName}</td>
																								    
																								    
																								    <td>
																								        <a href="javascript:void(0);" class="px-3 text-primary edit-btn" data-toggle="modal" data-target="#editRankModal" data-rankNo="${r.rankNo}" data-rankName="${r.rankName }">
																						                <i class="uil uil-pen font-size-18"></i>
																						            </a>
																								        <a href="javascript:void(0);" class="px-3 text-danger edit-btn" data-toggle="modal" data-target="#deleteConfirmModal" data-placement="top" title="Delete" data-rankNo="${r.rankNo}" data-rankName="${r.rankName }" id="deleteBtn">
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
        	var rankNo = $(this).attr('data-rankNo');
            var rankName = $(this).attr('data-rankName');

            // 모달에 해당 데이터 채우기
            $('#editRankNo').val(rankNo);
            $('#deleteRankNo').val(rankNo);
            
            $('#editRankName').val(rankName);
        });
        </script>
        <script>
        function deleteSelectedRanks() {
            const selectedRanks = [];
            // 선택된 체크박스에서 직급 번호 수집
            document.querySelectorAll('input[type="checkbox"]:checked').forEach((checkbox) => {
                selectedRanks.push(checkbox.getAttribute('data-rank-no'));
            });

            if (selectedRanks.length === 0) {
                alert("삭제할 항목을 선택해주세요.");
                return;
            }

            // AJAX 요청으로 선택 항목 삭제
            fetch("/user/profile/deleteRanks", {
                method: "POST",
                headers: { "Content-Type": "application/json" },
                body: JSON.stringify(selectedRanks) // 수정된 부분
            })
            .then((response) => response.json())
            .then((data) => {
                if (data.success) {
                    alert(data.message);
                    location.reload(); // 페이지 새로고침
                } else {
                    alert("삭제 실패: " + data.message);
                }
            })
            .catch((error) => console.error("Error:", error));
        }

        </script>
       
    </body>
</html>
