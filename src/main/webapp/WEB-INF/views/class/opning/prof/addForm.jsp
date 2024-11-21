<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>강의 개설신청</title>
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
			<div class="page-content ">
				<div class="container-fluid mt-5">
					<div class="text-center">
						<h3>강의 개설 신청서</h3>
					</div>
					<div class="float-right mb-5">
						<p>신청일자 : ${c.applDate}</p>
						<p>limit : ${limit}</p>
						<p>classCode : ${classCode}</p>
					</div>
					<div class="mt-5 mb-3">
						
						<div class="table-responsive mb-4 ">
							<p class="text-danger">*기본 정보가 일치하는지 확인해주세요</p>
							<table class="table table-bordered mb-0" style="table-layout: fixed">
								<thead>
									<tr class="table-secondary">
										<th width="15%" scope="col">신청자명</th>
										<th width="15%" scope="col"class="text-primary">${ user.userName }</th>
										<c:set var = "year" value = "${fn:substring(classCode, 0, 2)}" />
     									<c:set var = "term" value = "${fn:substring(classCode, 3, 4)}" />
										<th width="20%" scope="col">개설년도</th>
										<th width="20%" scope="col" class="text-primary">20${year}년도</th>
										<th width="15%" scope="col">개설학기</th>
										<th width="15%" scope="col" class="text-primary">${term}학기</th>
									</tr>
								</thead>
							</table>
						</div>
	
					</div>
					<hr>
					<div class="mt-2 mb-3">
						
						<div class="m-3">
						
							<div class="form-group row">
                                <label for="example-text-input1" class="col-md-2 col-form-label">강의명</label>
                                <div class="col-md-5">
                                    <input class="form-control" type="text" value=" " id="example-text-input1">
                                </div>
                                
                                <label for="example-text-input2" class="col-md-2 col-form-label">대상학과</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" value=" " id="example-text-input2">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="example-text-input1" class="col-md-2 col-form-label">강의유형</label>
                                <div class="col-md-5">
                                    <input class="form-control" type="text" value=" " id="example-text-input1">
                                </div>
                                
                                <label for="example-text-input2" class="col-md-2 col-form-label">진행방식</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" value=" " id="example-text-input2">
                                </div>
                            </div>
                            
                            <div class="form-group row">
                                <label for="example-text-input1" class="col-md-2 col-form-label">시수</label>
                                <div class="col-md-5">
                                    <input class="form-control" type="text" value=" " id="example-text-input1">
                                </div>
                                
                                <label for="example-text-input2" class="col-md-2 col-form-label">대상학년</label>
                                <div class="col-md-3">
                                    <input class="form-control" type="text" value=" " id="example-text-input2">
                              	</div>                           
                            </div>    
                                                   
						</div>
	
					</div>
					
					<h5>수업목표</h5>
					<hr>
					<div class=" bg-light container border mt-2 mb-4" style="min-height:100px">
						${c.classGoals}
					</div>
					<h5>운영방안</h5>
					<hr>
					<div class=" bg-light container border mt-2 mb-4" style="min-height:100px">
						${c.operationPlan}
					</div>
					<h5>평가방식</h5>
					<div class=" mt-2 mb-4" >
						<table class="table table-bordered mb-0" style="table-layout: fixed">
							<tr class="table-secondary">
								<th width="17%">중간고사</th>
								<th width="17%">기말고사</th>
								<th width="17%">실습/과제</th>
								<th width="17%">출결</th>
								<th width="17%">기타</th>
								<th width="15%">합계</th>
							</tr>
							<tr style="background-color: #F2F2F2;">
								<c:set var ="sum" value ="20" />
									<td id="middle">
										<c:forEach var="eva" items="${c.evaList}">
											<c:if test="${eva.evaItem eq '중간고사' }">
												<c:set var ="sum" value ="${sum + eva.allocation}"/>
												${eva.allocation}
											</c:if>
										</c:forEach>
									</td>
									<td id="final">
										<c:forEach var="eva" items="${c.evaList}">
											<c:if test="${eva.evaItem eq '기말고사' }">
												<c:set var ="sum" value ="${sum + eva.allocation}"/>
												${eva.allocation}
											</c:if>
										</c:forEach>
									</td>
									<td id="work">
										<c:forEach var="eva" items="${c.evaList}">
											<c:if test="${eva.evaItem eq '실습/과제' }">
												<c:set var ="sum" value ="${sum + eva.allocation}"/>
												${eva.allocation}
											</c:if>
										</c:forEach>
									</td>
									<td>20</td>
									<td id="etc">
										<c:forEach var="eva" items="${c.evaList}">
											<c:if test="${eva.evaItem eq '기타' }">
												<c:set var ="sum" value ="${sum + eva.allocation}"/>
												${eva.allocation}
											</c:if>
										</c:forEach>
									</td>
									<td id="sum"><c:out value="${sum}"/></td>								
	            			</tr>
            			</table>
					</div>
					<h5>평가상세</h5>
					<hr>
					<div style="min-height:100px">
						<table class="table mb-0" style="table-layout: fixed">
							<c:forEach var="eva" items="${c.evaList}">
								<tr class="table-secondary">
									<th style="width:20%">${eva.evaItem}</th>
									<td style="background-color: #F2F2F2;">${eva.evaDetail eq null or "" ? "미기입" : eva.evaDetail}</td>
								</tr>
							</c:forEach>
						</table>
					</div>
					<h5>교재</h5>
					<hr>
					<div class=" mt-2 mb-4">
						<table class="table mb-0" style="table-layout: fixed">
							<tr class="table-secondary">
								<th width="20%">주교재</th>
								<td style="background-color: #F2F2F2;">${c.mainTextBook}</td>
							</tr>
							<tr class="table-secondary">
								<th width="20%">참고서적</th>
								<td style="background-color: #F2F2F2;">${c.refnBook eq null ? '' : c.refnBook}</td>
							</tr>
						</table>
					</div>
					<c:if test="${c.status eq '보완요청' or c.status  eq '반려' or  c.status  eq '취소' }">
						<h5>${c.status} 사유</h5>
						<hr>
						<div class=" bg-light container border mt-2 mb-4" style="min-height:100px">
							${c.reason}
						</div>
					</c:if>
					<div class="row"> 
						<div class="col-8">
							<div class="mt-1" id="reasonBox" hidden>
								취소사유
								<textarea required class="form-control" rows="5" id="reason"></textarea>
							</div>
						</div>
						<div class="col-4">
							<div class="float-sm-center">
								
								<div class="row mt-4">
								<c:if test="${c.status eq '보완완료' or c.status  eq '접수'or c.status  eq '보완요청'or c.status }">
									<div class="select col pl-0">							
											<a class="btn btn-primary w-md mr-3 col" id="opStatus">신청 취소</a>
										
										</div>
										<button type="button" class="btn btn-primary w-md mr-3 col" onclick="fn_updateStatus();">저장</button>
									</c:if>
								</div>
								
								<div class="row mt-4">
									<a class="btn btn-primary w-md mr-3 col" href="${contextPath }/class/opning/prof/list.do">목록</a>
								</div>
								<input type="hidden" value="${c.classCode }">
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!-- main-content 끝 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
	    $('#opStatus').on('click', function() {
	    	console.log('${c.evaList}');
	    	$('#reason').val('');
	    	$('#reasonBox').removeAttr('hidden');
	    });
		function fn_updateStatus(){
  			
  			if($('#reason').val() == ''){
  				alert('사유를 작성해주십시오.');
  				return;
  			}  				

  			
  			if(confirm('신청서를 취소 처리하시겠습니까?')){
  				
				$.ajax({
					url: '${contextPath}/class/opning/staff/update.do',
					type: 'post',
					data: {
						reason : $('#reason').val(),
						status : '취소',
						classCode : '${c.classCode}'
					},
					success: function(res){
						if(res == "SUCCESS"){
							location.reload('${c.classCode}');
						}else{
							alert("처리에 실패하였습니다.");
						}
					}
				})
  			
  			}
  		}
		</script>
	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
</body>
</html>