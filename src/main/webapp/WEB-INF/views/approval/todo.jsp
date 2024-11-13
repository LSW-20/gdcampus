<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결재대기함</title>
    <style>

    </style>
</head>
<body data-topbar="dark" data-sidebar="dark">
    <!-- 전체 영역(헤더, 사이드바, 내용) 시작 -->
    <div id="layout-wrapper">
        <!-- header 시작 -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <!-- header 끝 -->

        <!-- sidebar 시작 -->
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
        <!-- sidebar 끝 -->

        <!-- main-content 시작 -->

        <!-- main-content 끝 -->
    </div>
    <!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
</body>
</html>
