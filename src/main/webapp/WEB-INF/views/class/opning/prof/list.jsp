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
							<div class="form-inline float-md-right mb-3">
								<div class="search-box ml-2">
									<div class="position-relative mr-3">
										<button type="button" id="addBtn" class="btn btn-primary waves-effect waves-light" data-toggle="modal" data-target="#myModal">개설신청</button>
										<!-- 모달 시작 -->
		
										<div id="myModal" class="modal fade" tabindex="-1" aria-labelledby="myModalLabel" aria-hidden="true" role="dialog">
										    <div class="modal-dialog">
										        <div class="modal-content">
										            <div class="modal-header">
										                <h5 class="modal-title" id="myModalLabel"><span id="year"></span>년도 신청현황</h5>
										                <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="modal">
										                    <span aria-hidden="true">×</span>
										                </button>
										            </div>
										            <div class="modal-body">
										                <!-- 모달 내용 -->
										                <table class="table table-centered table-nowrap table-check mb-0" style="table-layout: fixed">
										                	<tr>
										                		<td>
										                			<div class="custom-control custom-radio">
				                                                        <input type="radio" id="term1" name="customRadio" class="custom-control-input" value="1">
				                                                        <label class="custom-control-label" for="term1">1학기</label>
				                                                    </div>
										                		</td>
										                		<td><div id="content1"></div></td>
										                	</tr>
										                	<tr>
										                		<td>
										                			<div class="custom-control custom-radio ">
				                                                        <input type="radio" id="term2" name="customRadio" class="custom-control-input" value="2">
				                                                        <label class="custom-control-label" for="term2">2학기</label>
				                                                    </div>
										                		</td>
										                		<td><div id="content2"></div></td>
										                	</tr>
										                </table>
										            </div>
										            <div class="modal-footer">
										            	<div id="checkMsg" style="color: red; font-size: 12px; text-align:left;"></div>
										                <button type="button" class="btn btn-light" data-dismiss="modal">취소</button>
										                <button type="button" class="btn btn-primary" disabled id="addFormBtn">개설신청</button>
										            </div>
										        </div>
										    </div>
										</div>
										<!-- 모달 끝 -->
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
		var sum1;
		var sum2;
		var yy;
		var limit;
		var num;
		var resultTerm;
		$('#addBtn').on('click', function(evt) {
	        //두개 다 조회해와서 내용 만들어줌 년도만 가지고 가서 1학기 2학기 둘다 구해옴
			var date = new Date();
			var oneYearLater = new Date(date.setFullYear(date.getFullYear() + 1));
		    var year = oneYearLater.getFullYear();
		    var year = String(year);
		    yy = year.substring(2,4);	
		    $('#year').html(yy);
		    
		    $.ajax({
				url: '${contextPath}/class/opning/prof/sum.do',
				type: 'get',
				data: {
					yy : yy,
				},
				success: function(res){
					sum1 = res.sum1;
					sum2 = res.sum2;
					$('#content1').html(sum1+'시간');
					$('#content2').html(sum2+'시간');
					
				}
			})
	    });
		
		$('input[name="customRadio"]').on('change', function(evt) {	      
		    //만약 눌린 값이 21보다 작으면 addFormBtn 활성화, limit구해서 갱신
		    resultTerm = $(this).val();
		    num = $(this).val() == 1 ? sum1 : sum2;
		    
		    if(num>=21){
		    	$('#addFormBtn').attr('disabled','');
		    	$('#checkMsg').html('총 수업시수가 21시간 이상 신청하실 수 없습니다.');
		    }else if(num==20){
		    	$('#addFormBtn').removeAttr('disabled');
		    	$('#checkMsg').html('');
		    	limit = 1;
		    }else if(num==19){
		    	$('#addFormBtn').removeAttr('disabled');
		    	$('#checkMsg').html('');
		    	limit = 2;
		    }else{
		    	$('#addFormBtn').removeAttr('disabled');
		    	$('#checkMsg').html('');
		    	limit = 3;
		    }
	    });
		
		$('#addFormBtn').on('click', function(evt) {
			yytt = yy+'0'+resultTerm+'_';
			location.href = '${contextPath}/class/opning/prof/addForm.do?limit='+limit+'&yytt='+yytt;
	    });
		
	
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
	            url: '${contextPath}/class/opning/prof/listContent.do', 
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
	                  

	                	tbody += '<tr>'
	                             +'<td onclick="location.href = \'' + '${contextPath}' + '/class/opning/prof/detail.do?classCode=' + cla.classCode + '\';">'+cla.classCode+'</td>'
	                             +'<td>'+cla.classTitle+'</td>'
	                             +'<td>'+cla.applDate+'</td>';
	                             
	                    if(cla.modifyDate != null){
	                    	tbody +='<td>'+cla.modifyDate+'</td>'
	                    }else{
	                    	tbody +='<td></td>'   	
	                    };                       
	                    tbody    +='<td>'+cla.status+'</td>'
	                             +'</tr>'
	                    ;
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