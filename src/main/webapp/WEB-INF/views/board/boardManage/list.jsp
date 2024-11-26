<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
				    <h1>게시글 목록</h1>
				    <table border="1">
				        <thead>
				            <tr>
				                <th>공지사항</th>
				                <th>자유게시판</th>
				            </tr>
				        </thead>
				        <tbody>
				            <c:forEach var="b" items="${boardManageList}">
				                <tr>
				                    <td>${b.boardNo}</td>
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
				     
</body>
</html>