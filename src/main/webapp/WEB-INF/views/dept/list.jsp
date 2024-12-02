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
	min-height: 100vh; /* 화면 전체 높이 */
	display: flex;
	justify-content: center; /* 가로 가운데 정렬 */
	align-items: center; /* 세로 가운데 정렬 */
	background-color: #f8f9fa; /* 배경색 */
}

.page-content {
	width: 80%; /* 너비 */
	height: 80%; /* 높이 */
	background: #ffffff; /* 배경 흰색 */
	box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); /* 그림자 효과 */
	border-radius: 10px; /* 모서리 둥글게 */
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
	padding: 20px;
}

h1 {
	margin-bottom: 20px;
	text-align: center;
}

table {
	width: 100%;
	border-collapse: collapse;
	text-align: center;
}

table, th, td {
	border: 1px solid #ddd;
}

th, td {
	padding: 10px;
}

form {
	margin: 20px 0;
	display: flex;
	justify-content: center;
	align-items: center;
}

form input[type="text"] {
	margin-right: 10px;
	padding: 5px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

form button {
	padding: 5px 15px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

form button:hover {
	background-color: #0056b3;
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
	                <th>삭제</th>
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
