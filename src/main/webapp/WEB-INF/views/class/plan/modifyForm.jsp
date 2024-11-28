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
<title>주차별 수업계획서 수정페이지</title>
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
					<form action="${ contextPath}/class/plan/update.do" method="post" id="saveForm">
						<table class="table table-bordered  mb-0" style="table-layout: fixed">
							<thead>
								<tr><td colspan="12" class="text-center"><h5> 주차별수업계획</h5></td></tr>
							</thead>
							<tbody>
								<tr class="table-secondary">
									<td width="7%" colspan="1">주차</td>
									<td width="50%" colspan="6">내용</td>
									<td width="20%" colspan="2">진행방식</td>
									<td width="23%" colspan="3">준비물/과제</td>
								</tr>
								<c:forEach begin="1" end="16"  step="1" varStatus="num">
								<c:set var="status" value="n"/>
									<c:forEach var="plan" items="${originPlan }" varStatus="p">
										<c:if test="${plan.week == num.count}">
											<tr>
												<td width="7%" colspan="1">
													<input type="hidden" value="${plan.week }" name="planList[${num.index -1}].week">${plan.week}
												</td>
												<td width="50%" colspan="6">
													<input type="text" value="${plan.content}"name="planList[${num.index -1}].content">
												</td>
												<td width="20%" colspan="2">
													<input type="text" value="${plan.tchngMthd}"name="planList[${num.index -1}].tchngMthd">
												</td>
												<td width="23%" colspan="3">
													<input type="text" value="${plan.material}"name="planList[${ num.index -1}].material">
													<c:set var="status" value="y"/>
												</td>
											</tr>
										</c:if>
										
										<c:if test="${ p.last and status eq 'n' }">
											<tr>
												<td width="7%" colspan="1">
													<input type="hidden" name="planList[${num.index -1}].week" value="${num.count}">${num.count}
												</td>
												<td width="50%" colspan="6">
													<input type="text" name="planList[${num.index -1}].content">
												</td>
												<td width="20%" colspan="2">
													<input type="text" name="planList[${num.index -1}].tchngMthd">
												</td>
												<td width="23%" colspan="3">
													<input type="text" name="planList[${ num.index -1}].material">
												</td>
											</tr>
										</c:if>
										
									</c:forEach>
									
									
									<c:if test="${empty originPlan}">
										<tr>
											<td width="7%" colspan="1">
												<input type="hidden" name="planList[${num.index -1}].week" value="${num.count}">${num.count}
											</td>
											<td width="50%" colspan="6">
												<input type="text" name="planList[${num.index -1}].content">
											</td>
											<td width="20%" colspan="2">
												<input type="text" name="planList[${num.index -1}].tchngMthd">
											</td>
											<td width="23%" colspan="3">
												<input type="text" name="planList[${ num.index -1}].material">
											</td>
										</tr>
									</c:if>
									
								</c:forEach>
							</tbody>
						</table>
						<div class="mt-4 row d-flex justify-content-center">
							<a class="btn btn-primary w-md mr-3" href="javascript:window.history.back();" >돌아가기</a>
							<button type="button"class="btn btn-primary w-md mr-3" id="saveButton">저장</button>
						</div>	
						<input type="hidden" value="${classCode}" name="classCode">			
					</form>
				</div>
			</div>
		</div>
		<!-- main-content 끝 -->

		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		  document.getElementById("saveButton").addEventListener("click", function() {

			    const form = document.getElementById("saveForm");

			    const inputs = form.querySelectorAll("input");

			    inputs.forEach(input => {
			      if (!input.value.trim()) {
			        input.removeAttribute("name");
			      }
			    });

			    form.submit();
			  });
		</script>
	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
</body>
</html>