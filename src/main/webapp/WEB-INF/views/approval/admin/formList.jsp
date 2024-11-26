<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <title>전자결재 양식 관리</title>
    <style>
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }
        
        .page-title {
            font-size: 24px;
            font-weight: bold;
            margin-bottom: 20px;
            padding: 20px 0;
        }
        
        .approval-table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        
        .approval-table th,
        .approval-table td {
            border: 1px solid #ddd;
            padding: 12px;
            text-align: center;
        }
        
        .approval-table th {
            background-color: #f8f9fa;
            font-weight: 600;
        }
        
        .approval-table tr:hover {
            background-color: #f5f5f5;
        }
        
        .no-data {
            text-align: center;
            padding: 50px;
            color: #666;
            font-size: 16px;
        }
        
        .form-title {
            text-align: left;
            color: #333;
            text-decoration: none;
        }
        
        .form-title:hover {
            text-decoration: underline;
            color: #4B49AC;
        }
        
        .btn-area {
            margin-bottom: 20px;
        }
        
        .action-btns .btn {
            margin: 0 2px;
        }
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
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <h2 class="page-title">전자결재 양식 관리</h2>
                    <div class="btn-area">
                        <a class="btn btn-primary" style="float:right" href="${contextPath}/approval/admin/registForm">양식 등록</a>
                    </div>
                    <br>
                    
                    <c:choose>
                        <c:when test="${empty formList}">
                            <div class="no-data">
                                등록된 양식이 없습니다.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-centered datatable dt-responsive nowrap table-card-list table-check" style="border-collapse: collapse; border-spacing: 0 8px; width: 100%;">
                                <thead>
                                    <tr class="bg-transparent">
                                        <th style="width: 15%;">양식번호</th>
                                        <th style="width: 30%;">양식종류</th>
                                        <th style="width: 20%;">생성일</th>
                                        <th style="width: 10%;">생성자</th>
                                        <th style="width: 15%;">관리</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${formList}" var="form">
                                        <tr>
                                            <td>${form.apprNo}</td>
                                            <td>${form.apprType}</td>
                                            <td>
                                                <fmt:formatDate value="${form.createDate}" pattern="yyyy-MM-dd HH:mm"/>
                                            </td>
                                            <td>${form.createUser}</td>
                                            <td class="action-btns">
                                                <a class="px-3 text-primary edit-btn"
                                                        href="${contextPath}/approval/admin/detailForm/${form.apprNo}">
                                                    <i class="uil uil-pen font-size-18"></i>
                                                </a>
                                                <a class="px-3 text-danger edit-btn" 
                                                        onclick="deleteForm('${form.apprNo}')">
                                                    <i class="uil uil-trash font-size-18"></i>
                                                </a>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <!-- main-content 끝 -->
    </div>
    <!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
         <!-- Required datatable js -->
        <script src="${contextPath}/libs/datatables.net/js/jquery.dataTables.min.js"></script>
        <script src="${contextPath}/libs/datatables.net-bs4/js/dataTables.bootstrap4.min.js"></script>
        
        <!-- Responsive examples -->
        <script src="${contextPath}/libs/datatables.net-responsive/js/dataTables.responsive.min.js"></script>
        <script src="${contextPath}/libs/datatables.net-responsive-bs4/js/responsive.bootstrap4.min.js"></script>

        <!-- init js -->
        <script src="${contextPath}/js/pages/ecommerce-datatables.init.js"></script>    
    <script>
    function deleteForm(apprNo) {
        if(confirm('해당 양식을 삭제하시겠습니까?')) {
            location.href = '${contextPath}/approval/admin/deleteForm?apprNo=' + apprNo;
        }
    }
    </script>
    
</body>
</html>