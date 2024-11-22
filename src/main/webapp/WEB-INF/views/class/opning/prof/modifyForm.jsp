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
						<h3>강의 상세페이지</h3>
					</div>
					<form action="${contextPath }/class/opning/prof/update.do" method="post" class="was-validated" id="addForm">
						
						<div class="float-right mb-5">
							<p>강의 번호 : ${c.classCode}</p>
						</div>
						<div class="mt-5 mb-3">
							
							<div class="table-responsive mb-4 ">
								<p class="text-danger">*보완요청 상태의 신청서입니다. 수정이 완료되면 저장 버튼을 눌러주세요.</p>

								<table class="table table-bordered mb-0" style="table-layout: fixed">
									<thead>
										<tr class="table-secondary">
											<th width="15%" scope="col" class="">신청자명</th>
											<th width="15%" scope="col">${ c.userNo }</th>
											<c:set var = "year" value = "${fn:substring(c.classCode, 0, 2)}" />
	     									<c:set var = "term" value = "${fn:substring(c.classCode, 3, 4)}" />
											<th width="20%" scope="col">개설년도</th>
											<th width="20%" scope="col">20${year}년도</th>
											<th width="15%" scope="col">개설학기</th>
											<th width="15%" scope="col">${term}학기</th>
										</tr>
									</thead>
								</table>
							</div>
						</div>

						<div class="mt-2 mb-5">
							
							<div class="m-3">
							
								<div class="form-group row">
	                                <label for="example-text-input1" class="col-md-2 col-form-label">강의명</label>
	                                <div class="col-md-5">
	                                    <input required class="form-control" type="text" id="example-text-input1" name="classTitle" value="${c.classTitle }">
	                                </div>
	                                
	                                <label for="example-text-input2" class="col-md-2 col-form-label">대상학과</label>
	                                <div class="col-md-3">
	                                   	<select class="custom-select" name="deptName" id="deptName">
											<c:forEach var="category" items="${deptList}">
	               								<option value="${category.stDeptNo}">
	                   								${category.deptName}
	               								</option>
	           								</c:forEach>
										</select>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="example-text-input1" class="col-md-2 col-form-label">강의유형</label>
	                                <div class="col-md-5">
	                                    <select class="custom-select" name="classType" id="classType">
											<option value="전공선택" ${c.classType == '전공선택' ? 'selected' : ''}>전공선택</option>
	               							<option value="전공필수" ${c.classType == '전공필수' ? 'selected' : ''}>전공필수</option>
	               							<option value="교양선택" ${c.classType == '교양선택' ? 'selected' : ''}>교양선택</option>
	               							<option value="교양필수" ${c.classType == '교양필수' ? 'selected' : ''}>교양필수</option>
										</select>
	                                </div>
	                                
	                                <label for="example-text-input2" class="col-md-2 col-form-label">진행방식</label>
	                                <div class="col-md-3">
	                                   <select class="custom-select" name="prgMethod" id="prgMethod">
											<option value="대면" ${c.prgMethod == '대면' ? 'selected' : ''}>대면</option>
	               							<option value="비대면" ${c.prgMethod == '비대면' ? 'selected' : ''}>비대면</option>
										</select>
	                                </div>
	                            </div>
	                            
	                            <div class="form-group row">
	                                <label for="example-text-input1" class="col-md-2 col-form-label">시수</label>
	                                <div class="col-md-5">
	                                    <p>${c.classHours }시간</p>
	                                </div>
	                                
	                                <label for="example-text-input2" class="col-md-2 col-form-label">대상학년</label>
	                                <div class="col-md-3">
		                                <select class="custom-select" name="targetGrade" id="taget">
											<option value="1"  ${c.targetGrade == 1 ? 'selected' : ''}>1학년</option>
		             						<option value="2"  ${c.targetGrade == 2 ? 'selected' : ''}>2학년</option>
		             						<option value="3"  ${c.targetGrade == 3 ? 'selected' : ''}>3학년</option>
		             						<option value="4"  ${c.targetGrade == 4 ? 'selected' : ''}>4학년</option>
		             						<option value="5"  ${c.targetGrade == 5 ? 'selected' : ''}>전체</option>
										</select>
	                              	</div>                           
	                            </div>    
	                                                   
							</div>
		
						</div>
						
						<hr>
							<div class="form-group mt-4 mb-4">
	                            <label>수업목표</label>
	                            <div>
	                                <textarea required class="form-control" rows="5" style="height: 131px;" name="classGoals">${c.classGoals }</textarea>
	                            </div>
	                        </div>
						<hr>
						<div class="form-group mt-4 mb-4">
	                            <label>운영방안</label>
	                            <div>
	                                <textarea required class="form-control" rows="5" style="height: 131px;" name="operationPlan">${c.operationPlan }</textarea>
	                            </div>
	                    </div>
						<h5>평가방식</h5>
						<div class=" mt-2 mb-4" >
							<table class="table table-bordered mb-0" style="table-layout: fixed">
								<tr class="table-secondary">
									<th width="17%">중간고사</th>
									<th width="17%">기말고사</th>
									<th width="17%">실습/과제</th>
									<th width="17%">출결(고정)</th>
									<th width="17%">기타</th>
									<th width="15%">합계</th>
								</tr>
								<tr style="background-color: #F2F2F2;">
									<td>
										<input type="number" class="allocation" id="middle">
									</td>
									<td>
										<input type="number" class="allocation" id="final">
									</td>
									<td>
										<input type="number" class="allocation" id="work">
									</td>
									<td>20</td>
									<td >
										<input type="number" class="allocation" id="etc">
									</td>
									<td id="sum"></td>								
		            			</tr>
	            			</table>
	            			<div class="d-flex flex-row-reverse text-danger">
	            				<p id="allowMsg" class="mt-1"></p>
	            			</div>
						</div>
						<h5>평가상세</h5>
						<hr>
						<div style="min-height:100px" id="detailBox">
	
						
	
						</div>
						<h5>교재</h5>
						<hr>
						<div class=" mt-2 mb-5 row">
							<div class="col">
								<label>주교재</label>
								<textarea required class="form-control" rows="2" style="height: 50px;" name="mainTextBook">${c.mainTextBook }</textarea>
							</div>
							<div class="col">
								<label>참고서적</label>
								<textarea class="form-control" rows="2" style="height: 50px;" name="refnBook">${c.refnBook }</textarea>
							</div>
						</div>
						<h5>${c.status} 사유</h5>
						<hr>
						<div class=" bg-light container border mt-2 mb-4" style="min-height:100px">
							${c.reason}
						</div>
						<div class="row mt-5 d-flex justify-content-center">
							<a class="btn btn-primary w-md mr-3 col-2" href="${contextPath }/class/opning/prof/list.do">취소</a>
							<button class="btn btn-primary w-md mr-3 col-2" id="registBtn">저장</button>
						</div>
						<input type="hidden" value="${c.classCode }" name="classCode">
						<input type="hidden" value="${c.evaList }" name="evaList">
					</form>
				</div>
			</div>
		</div>
		<!-- main-content 끝 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		var sum;
		var allOk = false;
		var detail = '';
		
		$(document).ready(function() {
			
			// 페이지가 로드되자마자 classCode 쪼개서 대상학과 selected되게 해주고
			// evaList 안에 EvaMethodDto를 활용해야함 (evaItem, allocation, evaDetail)
			// 일단 evaList를 빼서 전역변수로 선언 그리고 요소를 만들어줄때는 updateEvaList안에 담기게 만들어줌
			// 데이터를 보여주는건 했다고 치고
			
			// 저장하기 버튼 누르면 ajax요청으로 기존의 evaList는 이름 hidden에 담겨서 가고 updateEvaList 이름으로 수정된 애들이 넘어감
			// 컨트롤러에서 deleteEvaList 선언해두고 2중 for문 돌림
			//
		});
		
		$('#registBtn').on('click', function(){
			if(allOk == false){
				alert('평가방식이 잘못 작성되었습니다');
				return;
			}
			if(confirm('보완요청을 완료하시겠습니까?')){
				return true;
			}
		})
		
	    $('.allocation').on('blur', function() {
	    	$('#detailBox').html('');
	    	detail = '';
    		sum = 20;
    		var no = 0;
    		
	    	$(".allocation").each(function(){
	    		sum += Number($(this).val());
	    		

		    	console.log($(this).attr('id'));
		    	
		    	if($(this).val() != null && $(this).val() != ''){
		    		
		    		$(this).attr('name','evaList['+ no +'].allocation');
		    		var evaItem;
		    		
		    		if($(this).attr('id') == 'middle'){
		    			evaItem = '중간고사';
             	    }else if($(this).attr('id') == 'final'){
             	    	evaItem = '기말고사';
             	    }else if($(this).attr('id') == 'work'){
             	    	evaItem = '실습/과제'; 
             	    }else{
             	    	evaItem = '기타';
             	    };
		    		
		    		detail +='<div class="form-group mt-4 mb-4">'
		                   +  	'<label>'
		                   +     	evaItem
		                   +	'</label>'
		                   +	'<input type="hidden" name="evaList['+ no +'].evaItem" value="'+evaItem+'">'
		             	   + 	'<div>'
		             	   + 		'<textarea required class="form-control" rows="5" style="height: 80px;" id="'+$(this).attr('id')+'Dt" name="evaList['+ no++ +'].evaDetail"></textarea>'
		       			   +	'</div>'
		         		   + '</div>';
					console.log(detail);
		    	}else{
		    		$(this).attr('name','');
		    	}
	    					    			    
	    	})
	    	
	    	$('#detailBox').html(detail);
	    	
	    	$('#sum').html(sum);
	    	
	    	if(sum == 100){
	    		allOk = true;
	    		$('#allowMsg').html('');
	    	}else{
	    		allOk = false;
	    		$('#allowMsg').html('합계 100점이 되어야합니다.');
	    	}

	    });
	    
		</script>
	</div>
	
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
</body>
</html>