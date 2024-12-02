<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개설신청 관리</title>
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
							<h2>개설신청 목록</h2>
						</div>
						<div class="col-md-6">
							
						</div>
					</div>

					<div class="card-body mt-5">
						<div class="row mb-4">
							<div class="col-md-2">
								<div class="mb-3">
									<div class="select">
										<select class="custom-select" name="stat" id="stat">
											<option value="all">전체</option>
                							<option value="접수">접수</option>
                							<option value="보완요청">보완요청</option>
                							<option value="보완완료">보완완료</option>
                							<option value="반려">반려</option>
                							<option value="취소">취소</option>
                							<option value="승인">승인</option>
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
						<div class="table-responsive custom-table mb-4 ">
							<table class="table table-centered datatable dt-responsive nowrap table-card-list table-check" style="border-collapse: collapse; border-spacing: 0 8px; width: 100%;table-layout: fixed">
								<thead>
									<tr class="bg-transparent">
										<th width="20%" scope="col">과목코드</th>
										<th width="15%" scope="col">과목명</th>
										<th width="15%" scope="col">담당교수</th>
										<th width="15%" scope="col">신청일</th>
										<th width="15%" scope="col">수정일</th>
										<th width="15%" scope="col">상태</th>
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
		    
		    $('#stat, #search').on('change keyup', function() {
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
	            url: '${contextPath}/class/opning/staff/listContent.do', 
	            data: 
	            {
					status: $("#stat").val(),
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
	                  
	                	if(cla.status == '취소' || cla.status == '승인' || cla.status == '반려'){
	                		tbody += '<tr style="background-color: #F6F6F6">'
	                	}else{
	                		tbody += '<tr>'
	                	};
	                	
	                	tbody += '<td onclick="location.href = \'' + '${contextPath}' + '/class/opning/staff/detail.do?classCode=' + cla.classCode + '\';">'+cla.classCode+'</td>'
	                             +'<td>'+cla.classTitle+'</td>'
	                             +'<td>'+cla.userNo+'</td>'
	                             +'<td>'+cla.applDate+'</td>';
	                             
	                    if(cla.modifyDate != null){
	                    	tbody +='<td>'+cla.modifyDate+'</td>'
	                    }else{
	                    	tbody +='<td></td>'   	
	                    };                       
	                    if(cla.status == '보완완료'){
		                    tbody    +='<td style="color:blue;">'+cla.status+'</td>'
                            +'</tr>'
	                    }else if(cla.status == '취소' || cla.status == '반려'){
		                    tbody    +='<td style="color:red;">'+cla.status+'</td>'
                            +'</tr>'
	                    }else{
		                    tbody    +='<td>'+cla.status+'</td>'
                            +'</tr>'              	
	                    };
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