<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>기안 문서함</title>
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
        
        .tab-menu {
            margin-bottom: 20px;
            border-bottom: 1px solid #ddd;
        }
        
        .tab-menu button {
            padding: 10px 20px;
            margin-right: 5px;
            border: none;
            background: none;
            cursor: pointer;
        }
        
        .tab-menu button.active {
            border-bottom: 2px solid #4B49AC;
            color: #4B49AC;
            font-weight: bold;
        }
        
        .status-badge {
            padding: 5px 10px;
            border-radius: 15px;
            font-size: 12px;
            font-weight: bold;
        }
        
        .status-pending {
            background-color: #ffd700;
            color: #000;
        }
        
        .status-progress {
            background-color: #87CEEB;
            color: #000;
        }
        
        .status-approved {
            background-color: #90EE90;
            color: #000;
        }
        
        .status-rejected {
            background-color: #FFB6C1;
            color: #000;
        }

        .doc-link {
            color: #333;
            text-decoration: none;
        }
        
        .doc-link:hover {
            color: #4B49AC;
            text-decoration: underline;
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
        #paging_area {
        	margin-top: 50px;
        }        
    </style>
</head>
<body data-topbar="dark" data-sidebar="dark">
    <div id="layout-wrapper">
        <!-- header 시작 -->
        <jsp:include page="/WEB-INF/views/common/header.jsp" />
        <!-- header 끝 -->
        
        <!-- sidebar 시작 -->
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
        <!-- sidebar 끝 -->
        
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <h2 class="page-title">기안 문서함</h2>
 										<button class="btn btn-secondary" style="float:right" onclick="showFormModal()">결재작성</button>
                    
                    <div class="tab-menu">
                        <button class="${ empty param.status ? 'active' : '' }" data-status="all">전체</button>
                        <button class="${param.status eq '0' ? 'active' : ''}" data-status="0">대기</button>
                        <button class="${param.status eq '1' ? 'active' : ''}" data-status="1">진행</button>
                        <button class="${param.status eq '2' ? 'active' : ''}" data-status="2">승인</button>
                        <button class="${param.status eq '3' ? 'active' : ''}" data-status="3">반려</button>
                    </div>
                    
                    <table class="table table-centered datatable dt-responsive nowrap table-card-list table-check" style="border-collapse: collapse; border-spacing: 0 8px; width: 100%;">
                        <thead>
                            <tr class="bg-transparent">
                                <th>기안일</th>
                                <th>결재 양식</th>
                                <th>제목</th>
                                <!-- <th>첨부파일</th> -->
                                <th>문서 번호</th>
                                <th>결재 상태</th>
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
                                        <a href="${contextPath}/approval/detail/${appr.apprNo}?type=myDoc" class="doc-link">
                                            ${appr.apprTitle}
                                        </a>
                                    </td>
<%--                                     <td>
                                        <c:if test="${not empty appr.attachCount}">
                                            <i class="fas fa-paperclip"></i> ${appr.attachCount}
                                        </c:if>
                                    </td> --%>
                                    <td>구디캠퍼스-${appr.apprNo}</td>
                                    <td>
                                        <c:choose>
                                            <c:when test="${appr.apprStatus eq '0'}">
                                                <span class="status-badge status-pending">대기</span>
                                            </c:when>
                                            <c:when test="${appr.apprStatus eq '1'}">
                                                <span class="status-badge status-progress">진행중</span>
                                            </c:when>
                                            <c:when test="${appr.apprStatus eq '2'}">
                                                <span class="status-badge status-approved">승인</span>
                                            </c:when>
                                            <c:when test="${appr.apprStatus eq '3'}">
                                                <span class="status-badge status-rejected">반려</span>
                                            </c:when>
                                        </c:choose>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <!-- 페이징 -->
                     <!-- http://localhost:9999/approval/myDoc?status=0?page=2 -->
								      <ul id="paging_area" class="pagination d-flex justify-content-center">
								          <li class="page-item ${ pi.currentPage == 1 ? 'disabled' : '' }">
								          	<a class="page-link" href="${ contextPath }/approval/myDoc?page=${pi.currentPage-1}">Prev</a>
								          </li>
								          
								          <c:forEach var="p" begin="${ pi.startPage }" end="${ pi.endPage }">
								          	<li class="page-item ${ pi.currentPage == p ? 'active' : '' }">
								          		<a class="page-link" href="${ contextPath }/approval/myDoc?page=${p}">${ p }</a>
								          	</li>
								          </c:forEach>
								   
							 								<li class="page-item ${pi.currentPage == pi.maxPage || pi.currentPage == 1 ? 'disabled' : ''}">
								          	<a class="page-link" href="${ contextPath }/approval/myDoc?page=${pi.currentPage+1}">Next</a>
								          </li>
								      </ul>
                   
 
 
                </div>
            </div>
        </div>
    </div>
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

		<!-- 검색 기능만을 위한 초기화 코드 추가 -->
		<script>
		    	//tab메뉴 클릭 이벤트 처리
    	document.querySelectorAll('.tab-menu button').forEach(button =>{
    		button.addEventListener('click', function(){
    			//모든 버튼 active제거
    			document.querySelectorAll('.tab-menu button').forEach(btn =>{
    				btn.classList.remove('active');
    			});
    			
    			//클릭퇸버튼에 active추가
    			this.classList.add('active');
    			
    			//해당문서목록요청
    			const status = this.dataset.status;
    			location.href = '${contextPath}/approval/myDoc'+(status === 'all' ? '' : '?status='+status);
    		});
    	});

    	//결재양식선택모달
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