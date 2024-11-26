<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 강의 관리</title>
<style type="text/css">
.main-content {
	min-height: 900px;
}

.page-content {
	margin: auto;
	width: 75%;
}

.card-body {
	box-sizing: border-box;
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
					<div>
					
						<div class="card-body">
							<div class="row">
								<h2 class="col-6">수강생 목록</h2>
								<div class=" col-6 ">
									<a href="javascript:window.history.back();" class="btn btn-primary waves-effect waves-light float-md-right">돌아가기</a>
								</div>
							</div>
							<br>
							<hr>

							<p>수강 인원 : ${c.learnerList.size()}</p>
							<hr>
							<br>
							<div id="accordion" class="custom-accordion bg-white">
								<div class="card mb-1">
									<div class="card-header row m-1 bg-white" id="headingOne">
											<div class="col">이름</div>
											<div class="col">학년</div>
											<div class="col">학과</div>
											<div class="col">성적</div>
										</div>
								</div>
								
								<c:forEach items="${c.learnerList}" var="l">
                               	
                               	
                               		<div class="card mb-1 shadow-none">
										<a href="#collapse${l.learnerNo}" class="text-dark collapsed"
											data-toggle="collapse" aria-expanded="false"
											aria-controls="collapse${l.learnerNo}">
											<div class="card-header row m-1" id="headingOne">
												<div class="col">${l.stuName}</div>
												<div class="col">${l.grade == 5 ? '전체' : l.grade}학년</div>
												<div class="col">${l.department}</div>
												<c:choose>
													<c:when test="${ l.finalGrade eq null }">
														<div class="col" style="color: gray">미기입</div>
													</c:when>
													<c:otherwise>
														<div class="col" style="color: blue">${l.finalGrade}</div>
													</c:otherwise>
												</c:choose>
												<i class="mdi mdi-chevron-up float-right accor-down-icon"></i>
											</div>
										</a>
	
										<div id="collapse${l.learnerNo}" class="collapse"
											aria-labelledby="headingOne" data-parent="#accordion" style="">
											<div class="card-body">
												<div class="row">
													<p class="col text-center">중간고사</p>
													<p class="col text-center">기말고사</p>
													<p class="col text-center">실습/과제</p>
													<p class="col text-center">출결</p>
													<p class="col text-center">기타</p>
													<p class="col text-center">합계</p>
												</div>
												<div class="row">
													<c:set var ="sum" value ="0" />
													<p class="col text-center">${l.middleTest}</p>
													<c:set var ="sum" value ="${sum + l.middleTest }" />
													<p class="col text-center">${l.finalTestL}</p>
													<c:set var ="sum" value ="${sum + l.finalTestL }" />
													<p class="col text-center">${l.practice}</p>
													<c:set var ="sum" value ="${sum + l.practice }" />
													<p class="col text-center">${l.attendance}</p>
													<c:set var ="sum" value ="${sum + l.attendance }" />
													<p class="col text-center">${l.etc}</p>
													<c:set var ="sum" value ="${sum + l.etc }" />
													<p class="col text-center"><c:out value="${sum }" default="0"/></p>
												</div>
											</div>
										</div>
									</div>
                               	
                               	
                            	</c:forEach>
								
							</div>
						</div>

					</div>
				</div>
			</div>
		</div>
		<!-- main-content 끝 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
			
		</script>
	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
</body>
</html>