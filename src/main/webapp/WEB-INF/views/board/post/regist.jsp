<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
				<div class="row justify-content-md-center">
					<div class="mt-5">
						<h3>게시글 추가</h3>
					</div>
				</div>
				<div class="col-lg-12">
					<hr>
					<div class="mt-5">
						<form action="${contextPath}/post//insert.do" method="post"
							class="was-validated">

							<div class="row justify-content-md-center">
								<div class="col-md-6">
									<div class="form-group">
										<label for="userName"></label> 
										<input type="text" class="form-control" id="userName" name="userName" required>
										<div class="invalid-feedback">
											<p>이름을 작성해주세요</p>
										</div>
									</div>
								</div>
							</div>
							<div class="row justify-content-md-center">
								<div class="col-md-6">
									<div class="form-group">
										<label for="email">이메일</label> 
										<input type="email" class="form-control" id="email" name="email" required>
										<div class="invalid-feedback">
											<p>이메일을 작성해주세요</p>
										</div>
									</div>
								</div>
							</div>

							<div class="row justify-content-md-center">
								<div class="col-md-6">
									<div class="form-group">
										<label>부서</label>
										<div class="select">
											<select class="custom-select" name="deptNo" id="deptNo">
												<c:forEach var="category" items="${deptList}">
													<option value="${category.deptNo}">
														${category.deptName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="row justify-content-md-center">
								<div class="col-md-6">
									<div class="form-group">
										<label>직급</label>
										<div class="select">
											<select class="custom-select" name="rankNo" id="rankNo">
												<c:forEach var="category" items="${rankList}">
													<option value="${category.rankNo}">
														${category.rankName}</option>
												</c:forEach>
											</select>
										</div>
									</div>
								</div>
							</div>
							<div class="row justify-content-md-center">
								<div class="col-md-6">
									<div class="form-group">
										<label>성별</label>
										<div class="d-flex">
											<div class="custom-control custom-radio mr-3">
												<input type="radio" id="M" name="gender" value="M"
													class="custom-control-input" checked> <label
													class="custom-control-label" for="M">남</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" id="F" name="gender" value="F"
													class="custom-control-input"> <label
													class="custom-control-label" for="F">여</label>
											</div>
										</div>
									</div>
								</div>
							</div>
							<hr>
							<div class="mt-4 row d-flex justify-content-center">
								<button type="submit" class="btn btn-primary w-md mr-3">추가</button>
								<a class="btn btn-primary w-md mr-3" href="${contextPath }/user/staff/list.do">취소</a>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		<!-- main-content 끝 -->

  <script src="${ contextPath }/resources/js/fileValidate.js"></script>

	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
  
  
</body>
</html>