<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>전자결재 홈</title>
    <style>
        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .approval-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-bottom: 20px;
        }

        .todo-documents {
            grid-column: 1 / -1;
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
        }

        .doc-section {
            border: 1px solid #ddd;
            padding: 20px;
            border-radius: 5px;
        }

        .section-title {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 15px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .doc-list {
            list-style: none;
            padding: 0;
            margin: 0;
        }

        .doc-item {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #eee;
        }

        .doc-link {
            color: #333;
            text-decoration: none;
        }

        .doc-link:hover {
            color: #4B49AC;
            text-decoration: underline;
        }

        .doc-date {
            color: #666;
            font-size: 0.9em;
        }

        .pagination {
            display: flex;
            justify-content: center;
            margin-top: 10px;
            margin-bottom: 20px;
        }

        .pagination button {
            padding: 5px 10px;
            margin: 0 5px;
            border: none;
            background: none;
            cursor: pointer;
            font-size: 20px;
        }

        .pagination button:disabled {
            color: #ccc;
            cursor: not-allowed;
        }

        .more-link {
            color: #666;
            font-size: 0.9em;
            text-decoration: none;
        }

        .more-link:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <div id="layout-wrapper">
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
        
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <!-- 결재 대기 문서 -->
                    <div class="todo-documents">
                        <div class="section-title">
                            결재 대기 문서
                            <span id="pageInfo">1/1</span>
                        </div>
                        <div id="todoDocsList">
                            <!-- 결재 대기 문서 목록이 동적으로 로드됨 -->
                        </div>
                        <div class="pagination">
                            <button onclick="prevPage()" id="prevBtn">&lt;</button>
                            <button onclick="nextPage()" id="nextBtn">&gt;</button>
                        </div>
                    </div>

                    <div class="approval-container">
                        <!-- 기안 진행 문서 -->
                        <div class="doc-section">
                            <div class="section-title">
                                기안 진행 문서
                                <a href="${contextPath}/approval/myDoc?status=1" class="more-link">more</a>
                            </div>
                            <ul class="doc-list">
                                <c:forEach items="${inProgressDocs}" var="doc">
                                    <li class="doc-item">
                                        <a href="${contextPath}/approval/detail/${doc.apprNo}" class="doc-link">
                                            ${doc.apprTitle}
                                        </a>
                                        <span class="doc-date">
                                            <fmt:formatDate value="${doc.apprDate}" pattern="yyyy-MM-dd"/>
                                        </span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>

                        <!-- 완료된 문서 -->
                        <div class="doc-section">
                            <div class="section-title">
                                완료 문서
                                <a href="${contextPath}/approval/myDoc?status=2" class="more-link">more</a>
                            </div>
                            <ul class="doc-list">
                                <c:forEach items="${completedDocs}" var="doc">
                                    <li class="doc-item">
                                        <a href="${contextPath}/approval/detail/${doc.apprNo}" class="doc-link">
                                            ${doc.apprTitle}
                                        </a>
                                        <span class="doc-date">
                                            <fmt:formatDate value="${doc.apprDate}" pattern="yyyy-MM-dd"/>
                                        </span>
                                    </li>
                                </c:forEach>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        let currentPage = 1;
        let maxPage = 1;

        // 페이지 로드시 실행
        document.addEventListener('DOMContentLoaded', function() {
            loadWaitingDocs(1);
        });

        // 결재 대기 문서 로드
        function loadWaitingDocs(page) {
            $.ajax({
                url: '${contextPath}/approval/todo',
                type: 'GET',
                data: { page: page },
                success: function(response) {
                    const todoDocsHtml = response.docs.map(doc => `
                        <div class="doc-item">
                            <a href="${contextPath}/approval/todo/\${doc.apprNo}" class="doc-link">
                                \${doc.apprTitle}
                            </a>
                            <span class="doc-date">\${formatDate(doc.apprDate)}</span>
                        </div>
                    `).join('');

                    $('#todoDocsList').html(todoDocsHtml);
                    maxPage = response.maxPage;
                    currentPage = page;
                    updatePageInfo();
                    updatePaginationButtons();
                }
            });
        }

        // 이전 페이지
        function prevPage() {
            if (currentPage > 1) {
                loadWaitingDocs(currentPage - 1);
            }
        }

        // 다음 페이지
        function nextPage() {
            if (currentPage < maxPage) {
                loadWaitingDocs(currentPage + 1);
            }
        }

        // 페이지 정보 업데이트
        function updatePageInfo() {
            document.getElementById('pageInfo').textContent = `${currentPage}/${maxPage}`;
        }

        // 페이지네이션 버튼 상태 업데이트
        function updatePaginationButtons() {
            document.getElementById('prevBtn').disabled = currentPage === 1;
            document.getElementById('nextBtn').disabled = currentPage === maxPage;
        }

        // 날짜 포맷팅
        function formatDate(dateString) {
            const date = new Date(dateString);
            return date.toLocaleDateString('ko-KR', {
                year: 'numeric',
                month: '2-digit',
                day: '2-digit'
            }).replace(/\./g, '-').replace(/ /g, '');
        }
    </script>
</body>
</html>