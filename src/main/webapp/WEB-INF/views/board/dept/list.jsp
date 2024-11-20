<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>부서관리</title>
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

				<div class="col-lg-12">
					<div class="mt-4">
						<h5 class=" mb-4">
							<i class="mdi mdi-arrow-right text-primary mr-1"></i> 상세정보
						</h5>
						
						<div class="mt-4 row d-flex justify-content-end">
							<button type="button" class="btn btn-primary w-md" onclick="fn_resetPwd()">비밀번호 초기화</button>
						</div>
						
						<form action="${contextPath}/board/category/deptDetail.do" method="post">
						<input type="hidden" name="userNo" value="${user.userNo}">
						<br><hr>	
							<div class="row mt-5">
								<div class="col-md-6">
									<div class="form-group">
										<label for="formrow-firstname-input">아이디</label> <span style="font-size: 10px">(수정불가)</span>
										<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly>
									</div>
								</div>
							</div>
						</form>	
			<div>
			    <h1>부서 목록</h1>
			    <table border="1">
			        <thead>
			            <tr>
			                <th>부서 번호</th>
			                <th>부서 이름</th>
			                <th>생성자</th>
			                <th>수정자</th>
			            </tr>
			        </thead>
			        <tbody>
			            <c:forEach var="category" items="${deptList}">
			            		<option value="${category.deptNo}" ${category.deptNo == user.deptNo ? 'selected' : ''}>
                    								${category.deptName}
       								</option>
			                <tr>
			                    <td>${dept.deptNo}</td>
			                    <td>${dept.deptName}</td>
			                    <td>${dept.createUser}</td>
			                    <td>${dept.modifyUser}</td>
			                </tr>
			            </c:forEach>
			        </tbody>
			    </table>
			   
			</div>
		</div>
</body>
</html>
