<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결재 작성폼</title>
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
		
		<style>
			.draft-title {
				font-size : 25px;	
			}
			.btn-form {
				margin-top : 100px;
				margin-left : 275px;
			}
		</style>
		
</head>
<body data-topbar="dark" data-sidebar="dark">
    <!-- header 시작 -->
    <jsp:include page="/WEB-INF/views/common/header.jsp" /> 
    <!-- header 끝 -->

    <!-- sidebar 시작 -->
    <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
    <!-- sidebar 끝 -->
    <div class="btn-form">
	    <div class="draft-title">업무 기안</div> <br> 
    	<button>결재요청</button> &nbsp;
    	<button>취소</button> &nbsp;
    	<button>결재선</button>
    </div>
    
     
    <jsp:include page="/WEB-INF/views/approval/simpleDraft.jsp" />

</body>
</html>