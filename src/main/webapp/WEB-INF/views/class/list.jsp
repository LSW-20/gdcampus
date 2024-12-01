<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 강의 목록</title>
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
							<h2>내 강의 목록</h2>
						</div>
						<div class="col-md-6">
							
						</div>
					</div>

					<div class="card-body mt-5">
						<div class="row mb-4">
							<div class="col-md-2">
								<div class="mb-3">
									<div class="select">																											
									
										<select class="custom-select" name="year" id="year">
											<c:set var="today" value="<%=new java.util.Date()%>" />
											<c:set var="date"><fmt:formatDate value="${today}" pattern="yyyy" /></c:set>
									        <option value="${date - 1 }">${date - 1 }년</option>
									        <option value="${date }" selected>${date}년</option>
									        <option value="${date + 1 }">${date + 1 }년</option>
										</select>
									</div>
								</div>
							</div>
							<div class="col-md-2">
				
							</div>

							<div class="col-md-8">
								<div class="form-inline float-md-right mb-3">
									<div class="search-box ml-2">
										<div class="position-relative">
											<input type="text" id="search"
												class="form-control rounded bg-light border-0"
												placeholder="교과목명"> <i
												class="mdi mdi-magnify search-icon"></i>
										</div>
									</div>
								</div>
							</div>


						</div>
						<!-- end row -->
						<div class="row">
							<div class="table-responsive custom-table  col-8">
								<table class="table table-centered datatable dt-responsive nowrap table-card-list table-check" style="border-collapse: collapse; border-spacing: 0 8px; width: 100%;table-layout: fixed">
									<thead>
										<tr class="bg-transparent">
											<th width="20%" scope="col">강의명</th>
											<th width="15%" scope="col">학기</th>
											<th width="15%" scope="col">유형</th>
											<th width="15%" scope="col">학년</th>
											<th width="15%" scope="col">시수</th>
										</tr>
									</thead>
									<tbody id="output">
										
	
									</tbody>
								</table>
								<div class="float-sm-center">
									<ul id="paging_area" class="pagination d-flex justify-content-center mt-5">
										
									</ul>
								</div>
							</div>
							<div class="col-4 container border p-3 bg-white" style="height: 400px;">
							</div>
						</div>
					</div>
					
					<div class="row mt-4">
						<div class="col-sm-12">

							
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
		    
		    $('#year, #search').on('change keyup', function() {
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
	            url: '${contextPath}/class/listContent.do', 
	            data: 
	            {
	            	year: $("#year").val(),
					keyword:$('#search').val(),
					page: page					
				},
	            type: 'GET',
	            dataType: 'json',
	            success: function(response) {
	
	                var pi = response.pi;       
	                var classList = response.classList; 
	                
	                var tbody = '';

	                // 각 사용자 데이터를 테이블에 추가
	                classList.forEach(function(cla) {
	                  

	                	tbody += '<tr>'
	                             +'<td style="cursor: pointer" onclick="location.href = \'' + '${contextPath}' + '/class/detail.do?classCode=' + cla.classCode + '\';">'+cla.classTitle+'</td>'
	                             +'<td>'+(cla.classCode).substr(3,1)+'학기</td>'
	                             +'<td>'+cla.classType+'</td>'
	                             +'<td>'+cla.targetGrade+'학년</td>'
	                             +'<td>'+cla.classHours+'시간</td>';
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