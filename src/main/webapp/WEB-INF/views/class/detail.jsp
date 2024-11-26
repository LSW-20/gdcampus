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
<title>내 강의 관리</title>
<style type="text/css">
.main-content {
	min-height: 900px;
}

.page-content {
	margin: auto;
	width: 75%;
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
						<h3>강의 상세 정보</h3>
					</div>

					<div class="mt-5 mb-3">
						
						<div class="table-responsive mb-4 ">
							<table class="table table-bordered mb-0" style="table-layout: fixed">
								<thead>
									<tr class="table-secondary">
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
					<div class="mt-2 mb-3">
						
						<div class="table-responsive mb-4 ">
							<table class="table table-bordered mb-0" style="table-layout: fixed; background-color: #F2F2F2;">
								<thead>
									<tr>
										<th width="15%" scope="col">강의명</th>
										<td width="15%" scope="col">${ c.classTitle }</td>
										<th width="20%" scope="col">대상학과</th>
										<td width="20%" scope="col">${c.deptName}</td>
									</tr>
									<tr>
										<th width="15%" scope="col">강의유형</th>
										<td width="15%" scope="col">${ c.classType }</td>
										<th width="20%" scope="col">진행방식</th>
										<td width="20%" scope="col">${c.prgMethod}</td>
									</tr>
									<tr>
										<th width="15%" scope="col">시수</th>
										<td width="15%" scope="col">${ c.classHours}</td>
										<th width="20%" scope="col">대상학년</th>
										<td width="20%" scope="col">${c.targetGrade eq 5 ? '전체' : c.targetGrade} 학년</td>
									</tr>
								</thead>
							</table>
						</div>
					</div>
					<br>
					<hr>
					<br>
					<div class="mb-5">
						<c:choose>
							<c:when test="${c.stuCount eq 0 }">
								<p class="pr-4 ml-4" style="color: gray">수강생 정보가 없습니다.</p>
							</c:when>
							<c:otherwise>
								<div class="row">
									<h5 class="pr-4 ml-4">수강인원 : ${c.stuCount}명</h5>
									<a href="${contextPath }/class/learner/list.do?classCode=${c.classCode}" style="color: gray">상세보기 > </a>
								</div>
								
								<div>
									<script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
									<canvas id="doughnut" height="150"></canvas>
								</div>
							</c:otherwise>
						</c:choose>
					</div>
					<div class="mt-5 row d-flex justify-content-center">
						<a class="btn btn-primary w-md mr-3" href="${contextPath }/class/list.do">목록</a>
					</div>
				</div>
			</div>
		</div>
		<!-- main-content 끝 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		
		<script>
		
		
	    var statusData = [
	        <c:forEach items="${chart}" var="c" varStatus="loop">
	            {
	                type: "${c.GRADE}",
	                cnt: ${c.COUNT}
	            }<c:if test="${!loop.last}">,</c:if>
	        </c:forEach>
	    ];
	    
	    
		new Chart(document.getElementById("doughnut"), {
		    type: 'doughnut',
		    data: {
		      labels: ["1학년", "2학년", "3학년", "4학년"],
		      datasets: [
		        {
		          label: "Population (millions)",
		          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9"],
		          data: statusData.map(item => item.cnt)
		        }
		      ]
		    },
		    options: {
		      title: {
		        display: true,
		        text: '학년 분포도'
		      }
		    }
		});
		</script>
	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
</body>
</html>