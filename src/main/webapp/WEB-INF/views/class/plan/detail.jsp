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
<title>개설신청 관리</title>
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
					<div class="mt-4 row d-flex justify-content-end m-4">
						<button class="btn btn-primary" onclick="downloadPDF()">PDF로 다운로드</button>
					</div>				
					<div class="container border p-3 bg-white" id="pdfArea" style="min-width: 1100px;">
						<div class="row ">
							<div class="col-8 d-flex align-items-center justify-content-center">
								<h3 class="text-decoration-underline">강의 계획서</h3>
							</div>
							<div class="col-4">
							    <div class="row m-3 border-bottom border-secondary">
							      <div class="col ">교수명</div>
							      <div class="col ">${ c.userNo }</div>
							    </div>
							    <div class="row m-3 border-bottom border-secondary">
							      <div class="col ">이메일</div>
							      <div class="col ">${ email }</div>
							    </div>
							    <div class="row m-3 border-bottom border-secondary">
							      <div class="col ">연구실</div>
							      <div class="col ">어칼까</div>
							    </div>
							</div>
						</div>
						
						<div class="mt-5 mb-3 ">				
							<div class="container border border-secondary table-responsive mb-4 p-0">
								<table class="table table-bordered  mb-0" style="table-layout: fixed">
									<thead>
										<tr class="table-secondary">
											<th scope="col">강의명</th>
											<th colspan="2" scope="col">${ c.classTitle }</th>
											<c:set var = "year" value = "${fn:substring(c.classCode, 0, 2)}" />
	     									<c:set var = "term" value = "${fn:substring(c.classCode, 3, 4)}" />
											<th scope="col">개설년도/학기</th>
											<th colspan="2" scope="col">20${year}년도 ${term}학기</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td scope="col">유형</td>
											<td scope="col">${ c.classType }</td>
											<td scope="col">진행방식</td>
											<td scope="col">${ c.prgMethod }</td>
											<td scope="col">강의코드</td>
											<td scope="col">${ c.classCode }</td>
										</tr>
										<tr>
											<td scope="col">대상학과</td>
											<td scope="col">${ c.deptName }</td>
											<td scope="col">대상학년</td>
											<td scope="col">${c.targetGrade eq 5 ? '전체' : c.targetGrade} 학년</td>
											<td scope="col">시수</td>
											<td scope="col">${ c.classHours }</td>
										</tr>
										<tr style="background-color: #F2F2F2;"><td colspan="6" class="text-center"><h5> 평가방식</h5></td></tr>
										
										<tr class="table-secondary">
											<th width="17%">중간고사</th>
											<th width="17%">기말고사</th>
											<th width="17%">실습/과제</th>
											<th width="17%">출결</th>
											<th width="17%">기타</th>
											<th width="15%">합계</th>
										</tr>
										<tr">
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
				            			
				            			<c:if test="${not empty c.evaList}">
											<tr style="background-color: #F2F2F2;">
												<td colspan="6" class="text-center">
													<h5> 평가상세</h5>
												</td>
											</tr>
												<c:forEach var="eva" items="${c.evaList}">
													<tr >
														<td colspan="1">${eva.evaItem}</td>
														<td colspan="5">${eva.evaDetail eq null or "" ? "미기입" : eva.evaDetail}</td>
													</tr>
												</c:forEach>						
										</c:if>
				            			<tr>
				            				<td colspan="1" style="background-color: #F2F2F2;">수업목표</td>
				            				<td colspan="5">${c.classGoals}</td>
				            			</tr>
				            			<tr>
				            				<td colspan="1" style="background-color: #F2F2F2;">운영방안</td>
				            				<td colspan="5">${c.operationPlan}</td>
				            			</tr>
				            			<tr>
				            				<td colspan="1" style="background-color: #F2F2F2;">주교재</td>
				            				<td colspan="2">${c.mainTextBook}</td>
				            				<td colspan="1" style="background-color: #F2F2F2;">참고자료</td>
				            				<td colspan="2">${c.refnBook}</td>
				            			</tr>
									</tbody>
								</table >
								
								<c:if test="${not empty plan }">
									<br>
									<hr>
									<br>
									<table class="table table-bordered  mb-0" style="table-layout: fixed">
										<thead>
											<tr style="background-color: #F2F2F2;"><td colspan="12" class="text-center"><h5> 주차별수업계획</h5></td></tr>

										</thead>
										<tbody>
											<tr class="table-secondary">
												<td width="7%" colspan="1">주차</td>
												<td width="50%" colspan="6">내용</td>
												<td width="20%" colspan="2">진행방식</td>
												<td width="23%" colspan="3">준비물/과제</td>
											</tr>
											<c:forEach var="c" items="${plan}">
												<tr>
													<td width="7%" colspan="1">${c.week}주차</td>
													<td width="50%" colspan="6">${c.content}</td>
													<td width="20%" colspan="2">${c.tchngMthd}</td>
													<td width="23%" colspan="3">${c.material}</td>
												</tr>
											</c:forEach>
										</tbody>
									</table>
								</c:if>
							</div>	
						</div>
						
					</div>
					<div class="mt-4 row d-flex justify-content-center">
						<a class="btn btn-primary w-md mr-3" href="javascript:window.history.back();" >돌아가기</a>
						<a class="btn btn-primary w-md mr-3" href="${ contextPath}/class/plan/modifyForm.do?classCode=${c.classCode}">수업계획 수정</a>
					</div>				
							
				</div>
			</div>
		</div>
		<!-- main-content 끝 -->
		<script src="https://cdnjs.cloudflare.com/ajax/libs/jspdf/2.3.1/jspdf.umd.min.js"></script>
		<script src="https://cdnjs.cloudflare.com/ajax/libs/html2canvas/1.3.2/html2canvas.min.js"></script>
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
	        function downloadPDF() {
	            const element =document.querySelector("#pdfArea");
	  
	            html2canvas(element).then((canvas) => {
	                const imgData = canvas.toDataURL('image/png', 1.5);
	                const pdf = new jspdf.jsPDF("p", "mm", "a4");
	                const imgProps= pdf.getImageProperties(imgData);
	                const pdfWidth = pdf.internal.pageSize.getWidth();
	                const pdfHeight = (imgProps.height * pdfWidth) / imgProps.width;
	  
	                pdf.addImage(imgData, 'PNG', 0, 0, pdfWidth, pdfHeight);
	                pdf.save("download.pdf");
	            });
	        }
		</script>
	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
</body>
</html>