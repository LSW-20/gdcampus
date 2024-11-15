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
										<a href="${contextPath}/user/staff/addForm.do" class="btn btn-success waves-effect waves-light"><i
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
									

								</tbody>
							</table>
						</div>
					</div>
					<div class="row mt-4">
						<div class="col-sm-12">

							<div class="float-sm-center">
								<ul id="paging_area" class="pagination d-flex justify-content-center">
									
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
			
		    listDo(1);
		    
		    $('#dept, #rank, #search').on('change keyup', function() {
		        listDo(1); 
		    });

		    // 페이징바를 선택한 경우
		    $(document).on('click', '#paging_area a', function(e) {
		        e.preventDefault();  
		        var page = $(this).data('page'); 
		        listDo(page); 
		    });
		});
	    
	    function listDo(page){
	        $.ajax({
	            url: '${contextPath}/user/staff/listContent.do', 
	            data: 
	            {
					dept: $("#dept").val(),
					rank: $('#rank').val(),
					keyword:$('#search').val(),
					page: page
					
					},
	            type: 'GET',
	            dataType: 'json', // 응답 데이터 타입
	            success: function(response) {
	
	                var pi = response.pi;          // Pi 객체
	                var userList = response.userList; // List<UserDto>
					var num=1;
	                
	                var tbody = '';

	                // 각 사용자 데이터를 테이블에 추가
	                userList.forEach(function(user) {
	                	
	                	var status = user.userStatus === 'Y' ? '재직' : '퇴직';

	                	tbody += '<tr onclick="location.href = \'' + '${contextPath}' + '/user/staff/detail.do?userNo=' + user.userNo + '\';">'
	                             +'<th scope="row">'
	                             +   '<div class="custom-control custom-checkbox">'
	                             +       '<input type="checkbox" class="custom-control-input" id="contacusercheck'+num+' '+user.userNo+'">'
	                             +       '<label class="custom-control-label" for="contacusercheck'+num+' '+user.userNo+'"></label>'
	                             +   '</div>'
	                             +'</th>'
	                             +'<td>'+user.userNo+'</td>'
	                             +'<td>'+user.userName+'</td>'
	                             +'<td>'+user.deptNo+'</td>'
	                             +'<td>'+user.rankNo+'</td>'                          
	                             +'<td>'+status+'</td>'
	                             +'</tr>'
	                    ;
	                	num++;
	                });
	
	                // 페이지 다시 그려줘야됨
	                $('#output').html(tbody);
	                
	                // 페이징바도 처리	                
	                var paging = '';
					const previousDisabled = pi.currentPage == 1 ? 'disabled' : '';
					paging += '<li class="page-item ' + previousDisabled + '">' 
						   +    '<a class="page-link" href="#" data-page="' + (pi.currentPage - 1) + '"> Prev </a>'
						   +  '</li>';

					for (let p = pi.startPage; p <= pi.endPage; p++) {
						const active = p === pi.currentPage ? 'active' : '';
						paging+= '<li class="page-item ' + active + '">' 
						      +    '<a class="page-link" href="#" data-page="' + p + '">' + p + '</a>' 
						      +  '</li>';
					}

					const nextDisabled = pi.currentPage == pi.maxPage ? 'disabled' : '';
					paging+= '<li class="page-item ' + nextDisabled + '">' 
						  +    '<a class="page-link" href="#" data-page="' + (pi.currentPage + 1) + '"> Next </a>'
						  +  '</li>';
				
	                $('#paging_area').html(paging);
          
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