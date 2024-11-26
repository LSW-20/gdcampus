<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!DOCTYPE html>
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


	    <h1>부서 목록</h1>
	    <table border="1">
	        <thead>
	            <tr>
	                <th>부서 번호</th>
	                <th>부서 이름</th>
	                <th>생성일</th>
	                <th>생성자</th>
	                <th>수정일</th>
	                <th>수정자</th>
	                <th></th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="d" items="${deptList}">
	                <tr>
	                    <td>${d.deptNo}</td>
	                    <td>${d.deptName}</td>
	                    <td>${d.createDate}</td>
	                    <td>${d.createUser}</td>
	                    <td>${d.modifyDate }</td>
	                    <td>${d.modifyUser}</td>
	                    <td>
	                    	<form action="${contextPath}/dept/delete" method="post">
	                    		<input type="hidden" name="deptNo" value="${d.deptNo}">
	                    		<button type="submit">삭제</button>
	                    	</form>
	                    </td>
	                </tr>
	            </c:forEach>
	         </tbody>
	     </table>
				     
				     <br><br><br>
				     
				     <div>
				     		<form action="${contextPath}/dept/add" method="post"> 
				     				<input type="text" placeholder="부서 이름 입력" name="deptName" required>
				     				<button type='submit'>부서 추가</button>
				     		</form>
				     </div>
				     
			   
			   </div>
			</div>
		</div>
		
</body>
</html>
