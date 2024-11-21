<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결재문서 상세</title>
    <style>
        /* 이전 스타일 유지 */
        .button-area {
            margin: 20px 0;
            text-align: left;
        }
        
        .action-button {
            padding: 6px 12px;
            border: none;
            border-radius: 4px;
            margin-right: 5px;
            cursor: pointer;
        }
        
        .action-button.checked {
            background-color: #e7e6ff;
            color: #4B49AC;
        }
        
        .action-button:disabled {
            background-color: #f0f0f0;
            cursor: not-allowed;
        }
    </style>
</head>
<body>
    <!-- header, sidebar include -->
    
    <div class="main-content">
        <div class="page-content">
            <div class="container-fluid">
                <!-- 버튼 영역 -->
                <div class="button-area">
                    <!-- 결재 대기 문서함인 경우 -->
                    <c:if test="${type eq 'todo' && approval.currOrder eq approver.lineOrder}">
                        <button type="button" class="action-button checked">결재</button>
                        <button type="button" class="action-button checked">반려</button>
                        <button type="button" class="action-button checked">수정</button>
                        <button type="button" class="action-button">결재정보</button>
                    </c:if>
                    
                    <!-- 결재 예정 문서함인 경우 -->
                    <c:if test="${type eq 'upcoming'}">
                        <button type="button" class="action-button" disabled>결재</button>
                        <button type="button" class="action-button" disabled>반려</button>
                        <button type="button" class="action-button" disabled>수정</button>
                        <button type="button" class="action-button">결재정보</button>
                    </c:if>
                    
                    <!-- 내 기안 문서함인 경우 -->
                    <c:if test="${type eq 'myDoc'}">
                        <c:choose>
                            <c:when test="${approval.apprStatus eq '0'}"> <!-- 대기 상태 -->
                                <button type="button" class="action-button" onclick="editDocument()">수정</button>
                                <button type="button" class="action-button" onclick="deleteDocument()">삭제</button>
                            </c:when>
                            <c:otherwise>
                                <button type="button" class="action-button" disabled>결재</button>
                                <button type="button" class="action-button" disabled>반려</button>
                                <button type="button" class="action-button" disabled>수정</button>
                            </c:otherwise>
                        </c:choose>
                        <button type="button" class="action-button">결재정보</button>
                    </c:if>
                </div>
                
                <!-- 문서 내용 -->
                <div class="document-container">
                    <c:choose>
                        <c:when test="${approval.apprType eq '기안서'}">
                            <jsp:include page="simpleDraftDetail.jsp"/>
                        </c:when>
                        <c:when test="${approval.apprType eq '품의서'}">
                            <jsp:include page="purchaseDraftDetail.jsp"/>
                        </c:when>
                    </c:choose>
                </div>
            </div>
        </div>
    </div>

    <script>
        function approveDocument() {
            // 결재 처리 로직
        }
        
        function rejectDocument() {
            // 반려 처리 로직
        }
        
        function editDocument() {
            // 수정 처리 로직
        }
        
        function deleteDocument() {
            // 삭제 처리 로직
        }
    </script>
</body>
</html>