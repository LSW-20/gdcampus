<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인사관리</title>
<style type="text/css">
.main-content {
	min-height: 900px;
}

.page-content {
	margin: auto;
	width: 75%;
}

.card-body {
	height: 500px;
}
</style>
</head>


<body data-topbar="dark" data-sidebar="dark">
	<!-- body 태그에 data-topbar="dark"를 주면 헤더 다크모드. 없으면 라이트 모드. -->
	<!-- body 태그에 data-sidebar="dark"를 주면 사이드바 다크모드. 없애면 라이트 모드. -->



	<!-- 전체 영역(헤더, 사이드바, 내용) 시작 -->
	<div id="layout-wrapper">


		<!-- header 시작 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<!-- header 끝 -->


		<!-- sidebar 시작 -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
		<!-- sidebar 끝 -->



		<!-- main-content 시작 -->
		<div class="main-content">
			<div class="page-content">
				<div class="container-fluid mt-5">
					<div class="row mb-2">
						<div class="col-md-6">
							<h2>행정직원 목록</h2>
						</div>
						<div class="col-md-6">
							<div class="form-inline float-md-right mb-3">
								<div class="search-box ml-2">
									<div class="position-relative">
										<a href="#" class="btn btn-success waves-effect waves-light"><i
											class="mdi mdi-plus mr-2"></i> 사원 추가</a>

									</div>
								</div>
								<!-- 체크박스가 눌렸을때만 보이게 -->
								<div class="search-box ml-2">
									<div class="position-relative">
										<a href="#" class="btn btn-danger waves-effect waves-light">
										<i class="uil-minus mr-2"></i> 퇴사처리</a>
									</div>
								</div>

							</div>
						</div>
					</div>

					<div class="card-body mt-5">
						<div class="row mb-4">
							<div class="col-md-2">
								<div class="mb-3">
									<div class="select">
										<select class="custom-select" name="dept" id="dept">
											<option value="all">전체</option>
											<c:forEach var="category" items="${deptList}">
                								<option value="${category.deptNo}">
                    								${category.deptName}
                								</option>
            								</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-2">
								<div class="mb-3">
									<div class="select">
										<select class="custom-select" name="rank" id="rank">
											<option value="all">전체</option>
											<c:forEach var="category" items="${rankList}">
                								<option value="${category.rankNo}">
                    								${category.rankName}
                								</option>
            								</c:forEach>
										</select>
									</div>
								</div>
							</div>

							<div class="col-md-8">
								<div class="form-inline float-md-right mb-3">
									<div class="search-box ml-2">
										<div class="position-relative">
											<input type="text" id="search"
												class="form-control rounded bg-light border-0"
												placeholder="사원명"> <i
												class="mdi mdi-magnify search-icon"></i>
										</div>
									</div>
								</div>
							</div>


						</div>
						<!-- end row -->
						<div class="table-responsive mb-4 ">
							<table class="table table-centered table-nowrap table-check mb-0">
								<thead>
									<tr>
										<th scope="col" style="width: 50px;">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input"
													id="checkAll"> <label class="custom-control-label"
													for="checkAll"></label>
											</div>
										</th>
										<th scope="col">사원번호</th>
										<th scope="col">사원명</th>
										<th scope="col">부서</th>
										<th scope="col">직책</th>
										<th scope="col">상태</th>
									</tr>
								</thead>
								<tbody id="output">
									<tr>
										<th scope="row">
											<div class="custom-control custom-checkbox">
												<input type="checkbox" class="custom-control-input"
													id="contacusercheck1"> <label
													class="custom-control-label" for="contacusercheck1"></label>
											</div>
										</th>
										<td><a href="#" class="text-body">B0001</a></td>
										<td>사원명</td>
										<td>부서명</td>
										<td>직책</td>
										<td>상태</td>
									</tr>

								</tbody>
							</table>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-sm-12">

							<div class="float-sm-right">
								<ul class="pagination mb-sm-0">
									<li class="page-item disabled"><a href="#"
										class="page-link"><i class="mdi mdi-chevron-left"></i></a></li>
									<li class="page-item"><a href="#" class="page-link">1</a>
									</li>
									<li class="page-item active"><a href="#" class="page-link">2</a></li>
									<li class="page-item"><a href="#" class="page-link">3</a>
									</li>
									<li class="page-item"><a href="#" class="page-link"><i
											class="mdi mdi-chevron-right"></i></a></li>
								</ul>
							</div>
						</div>
					</div>

				</div>
			</div>
		</div>
		<!-- main-content 끝 -->
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$(document).ready(function() {
		    listDo(); 
	
		 // 부서가 변하는 경우
		    $('#dept').on('change', function() {
		        listDo(); 
		    });
		 // 직급이 변하는 경우
		    $('#rank').on('change', function() {
		        listDo(); 
		    });
		 // 검색어가 변하는 경우
		    $('#search').on('keyup', function() {
		        listDo(); 
		    });
		 // 페이지가 변하는 경우??
		    $('#').on('click', function() {
		        listDo(); 
		    });
		});
	    
	    function listDo(){
	        $.ajax({
	            url: '${contextPath}/user/listContent.do', 
	            data: 
	            {
					dept: $("#dept").val(),
					rank: $('#rank').val(),
					keyword:$('#search').val(),
					pi: 1
					
					},
	            type: 'GET',
	            dataType: 'json', // 응답 데이터 타입
	            success: function(response) {
	
	                var pi = response.pi;          // Pi 객체
	                var userList = response.userList; // List<UserDto>
	                
	                console.log("pi:"+ pi);
	                console.log("userList:"+ userList);
	
	                // 페이지 다시 그려줘야됨
	                $('#output').html(
	                    
	                );
	            },
	            error: function(error) {
	                alert('AJAX 요청 실패: ' + error);
	            }
	        });    	
	    }
	</script>



	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->



</body>
</html>