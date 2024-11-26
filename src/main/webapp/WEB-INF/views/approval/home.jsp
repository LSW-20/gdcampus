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
/* 카드 컨테이너: 가로로 카드들이 나란히 정렬되고, 여러 줄로 흐를 수 있게 flex 레이아웃 설정 */
.doc-card-container {
    display: flex;
    flex-wrap: wrap;
    gap: 20px;
    justify-content: flex-start; /* 카드들이 왼쪽 정렬되도록 설정 */
}

/* 카드 스타일 */
.doc-card {
    width: 22%; /* 카드의 너비를 설정 (화면에 4개 정도가 보이도록 설정) */
    min-width: 200px; /* 최소 너비 설정 (너무 작아지지 않도록) */
    border: 1px solid #ddd;
    border-radius: 5px;
    padding: 15px;
    box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
    text-align: left; /* 카드 내용 글자들을 왼쪽 정렬 */
    margin-bottom: 20px;
    background-color: #fff; /* 카드 배경색 추가 */
}

/* 카드 제목 스타일 */
.doc-card h3 {
    font-size: 1.2em;
    margin-bottom: 8px;
}

/* 카드 내의 문서 정보 스타일 */
.doc-card .doc-info {
    color: #666;
    font-size: 0.9em;
    margin-bottom: 15px;
}

/* 결재하기 버튼 스타일 - 중앙 정렬 */
.doc-card button {
    padding: 10px;
    font-size: 1em;
    border: none;
    background-color: #4B49AC;
    color: white;
    border-radius: 4px;
    cursor: pointer;
    display: block;      /* 버튼을 블록 요소로 설정 */
    margin: 0 auto;      /* 버튼을 수평 중앙 정렬 */
}

.doc-card button:hover {
    background-color: #3a389f;
}

        .main-content {
            margin-left: 250px;
            padding: 20px;
        }

        .approval-container {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;
            margin-top: 20px;
            height: 300px;
        }

        .todo-documents {
        		height: 300px;
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
            margin-top: 10px; /* 결재 대기 문서 영역과 일정한 간격을 둠 */
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
<body data-topbar="dark" data-sidebar="dark">
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
                        <div id="todoDocsList" class="doc-card-container">
                            <!-- 결재 대기 문서 목록이 동적으로 로드됨 -->
                        </div>
                    </div>
                    <div class="pagination">
                        <button onclick="prevPage()" id="prevBtn">&lt;</button>
                        <button onclick="nextPage()" id="nextBtn">&gt;</button>
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
                                        <a href="${contextPath}/approval/detail/${doc.apprNo}?type=myDoc" class="doc-link">
                                            ${doc.apprTitle}
                                        </a>
                                        <span class="doc-date">
                                            ${doc.apprDate}
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
                                        <a href="${contextPath}/approval/detail/${doc.apprNo}?type=myDoc" class="doc-link">
                                            ${doc.apprTitle}
                                        </a>
                                        <span class="doc-date">
                                            ${doc.apprDate}
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
                url: '${contextPath}/approval/todo/list',
                type: 'GET',
                data: { page: page },
                success: function(response) {
                    const todoDocsHtml = response.docs.map(doc => `
                        <div class="doc-card">
                            <p class="doc-title" style="font-weight: bold;">\${doc.apprTitle}</p>
                            <div class="doc-info">
                                <div>기안자: \${doc.apprUser}</div>
                                <div>기안일: \${doc.apprDate}</div>
                                <div>결재양식: \${doc.apprType}</div>
                            </div>
                            <button onclick="location.href='${contextPath}/approval/detail/\${doc.apprNo}?type=todo'">결재하기</button>
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
    </script>
</body>
</html>