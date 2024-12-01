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
    <title>결재예정문서함</title>
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
        
        .attach-icon {
            width: 16px;
            height: 16px;
            vertical-align: middle;
        }
        
        .paging_area {
            display: flex;
            justify-content: center;
            margin-top: 20px;
        }
        
        .paging_area a {
            color: black;
            padding: 8px 16px;
            text-decoration: none;
            border: 1px solid #ddd;
            margin: 0 4px;
        }
        
        .paging_area a.active {
            background-color: #4B49AC;
            color: white;
            border: 1px solid #4B49AC;
        }
        
        .paging_area a:hover:not(.active) {
            background-color: #ddd;
        }
        
        .appr-title {
            text-align: left;
            color: #333;
            text-decoration: none;
        }
        
        .appr-title:hover {
            text-decoration: underline;
            color: #4B49AC;
        }
        
        #paging_area {
            margin-top: 50px;
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
                    <h2 class="page-title">결재 예정 문서</h2>
 										<button class="btn btn-secondary" style="float:right" onclick="showFormModal()">결재작성</button>
                    <br>
                    
                    <c:choose>
                        <c:when test="${empty apprList}">
                            <div class="no-data">
                                결재 예정 문서가 없습니다.
                            </div>
                        </c:when>
                        <c:otherwise>
                            <table class="table table-centered datatable dt-responsive nowrap table-card-list table-check" style="border-collapse: collapse; border-spacing: 0 8px; width: 100%;">
                                <thead>
                                    <tr class="bg-transparent">
                                        <th>기안일</th>
                                        <th>결재양식</th>
                                        <th>제목</th>
                                        <th>기안자</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <c:forEach items="${apprList}" var="appr">
                                        <tr>
                                            <td>
                                                <fmt:formatDate value="${appr.apprDate}" pattern="yyyy-MM-dd"/>
                                            </td>
                                            <td>${appr.apprType}</td>
                                            <td>
                                                <a href="${contextPath}/approval/detail/${appr.apprNo}?type=upcoming" class="appr-title">
                                                    ${appr.apprTitle}
                                                </a>
                                            </td>
                                            <td>${appr.userName}</td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                            
                             <!-- 페이징 처리 -->
                            <ul id="paging_area" class="pagination d-flex justify-content-center">
                                <li class="page-item ${pi.currentPage == 1 ? 'disabled' : ''}">
                                    <a class="page-link" href="${contextPath}/approval/upComing?page=${pi.currentPage-1}">Prev</a>
                                </li>
                                
                                <c:forEach var="p" begin="${pi.startPage}" end="${pi.endPage}">
                                    <li class="page-item ${pi.currentPage == p ? 'active' : ''}">
                                        <a class="page-link" href="${contextPath}/approval/upComing?page=${p}">${p}</a>
                                    </li>
                                </c:forEach>
                                
                                <li class="page-item ${pi.currentPage == pi.maxPage || pi.endPage == 0 ? 'disabled' : ''}">
                                    <a class="page-link" href="${contextPath}/approval/upComing?page=${pi.currentPage+1}">Next</a>
                                </li>
                            </ul> 
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>
        <!-- main-content 끝 -->
    </div>
    <!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
<div class="modal fade" id="formSelectModal" tabindex="-1" aria-hidden="true">
    <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">결재 양식 선택</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal"></button>
            </div>
            <div class="modal-body">
                <div class="mb-4">
                    <h6 class="fw-bold">기본 양식</h6>
                    <div class="d-grid gap-2">
                        <button class="btn btn-outline-primary" onclick="selectForm('simpleDraft')">기안서</button>
                        <button class="btn btn-outline-primary" onclick="selectForm('purchaseDraft')">품의서</button>
                    </div>
                </div>
                
                <c:if test="${not empty formList}">
                    <div>
                        <h6 class="fw-bold">관리자 정의 양식</h6>
                        <div class="d-grid gap-2">
                            <c:forEach items="${formList}" var="formType">
                                <button class="btn btn-outline-secondary" onclick="selectForm('${formType.apprType}')">
                                    ${formType.apprType}
                                </button>
                            </c:forEach>
                        </div>
                    </div>
                </c:if>
            </div>
        </div>
    </div>
</div>    
<script>
// jQuery를 사용하는 버전
function showFormModal() {
    $('#formSelectModal').modal('show');
}

function selectForm(formType) {
    $('#formSelectModal').modal('hide');
    location.href = '${contextPath}/approval/regist?formType=' + formType;
}

// 모달이 완전히 숨겨진 후 페이지 이동하기 위한 이벤트 처리
$('#formSelectModal').on('hidden.bs.modal', function (e) {
    if(window.location.href.includes('formType=')) {
        window.location.href = window.location.href;
    }
});
</script>    
</body>
</html>