<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="purchase-form">
    <div class="title">구매품의서</div>        
    <div class="form-header">
        <div class="form-info">
            <table>
                <tr>
                    <th width="30%">기안자</th>
                    <td>${approval.userName}</td>
                </tr>
                <tr>
                    <th>소속</th>
                    <td>${approval.deptNo == 1 ? "인사" : "교무"}</td>
                </tr>
                <tr>
                    <th>기안일</th>
                    <td><fmt:formatDate value="${approval.apprDate}" pattern="yy/MM/dd"/></td>
                </tr>
                <tr>
                    <th>문서번호</th>
                    <td>${approval.apprNo}<input type="hidden" value="${approval.apprStatus}" name="apprStatus"></td>
                </tr>
            </table>
        </div>
        
        <!-- 결재선 테이블 영역 -->
        <div class="approval-line">
            <!-- 기안자 결재선 테이블 -->
            <table id="apprUserLineTable">
                <tr>
                    <th width="100%">기안</th>
                </tr>
                <tr>
                    <td>
                        <div class="stamp approved">승인</div>
                        ${approval.apprUser}
                    </td>
                </tr>
                <tr class="approvalDate">
                    <td><fmt:formatDate value="${approval.apprDate}" pattern="yyyy-MM-dd"/></td>
                </tr>
            </table>

            <!-- 결재자 테이블 영역 -->
            <div id="approvalTablesContainer">
                <c:forEach items="${approval.approvers}" var="approver" varStatus="status">
                    <table class="approvalLineTable">
                        <tr>
                            <th width="100%">${status.count}차 결재</th>
                        </tr>
                        <tr>
                            <td>
                            	<c:choose>
                                    <c:when test="${approver.lineStatus == 1}">
                                        <div class="stamp approved">승인</div>
                                    </c:when>
                                    <c:when test="${approver.lineStatus == 2}">
                                        <div class="stamp rejected">반려</div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="stamp pending">대기</div>
                                    </c:otherwise>
                                </c:choose>
                                ${approver.userName} ${approver.rankName}
                            </td>
                        </tr>
                        <tr class="approvalDate">
                            <td>
                                <fmt:formatDate value="${approver.lineDate}" pattern="yyyy-MM-dd"/>
                            </td>
                        </tr>
                    </table>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 구매 정보 -->
    <table id="purchInfo">
        <tr>
            <th>담당부서</th>
            <td>${approval.purchDraft.purchDept}</td>
            <th>납품자</th>
            <td>${approval.purchDraft.purchEmpName}</td>
        </tr>
        <tr>
            <th>사용목적</th>
            <td>${approval.purchDraft.purchPurpose}</td>
            <th>희망납기일</th>
            <td><fmt:formatDate value="${approval.purchDraft.purchDeadline}" pattern="yyyy-MM-dd"/></td>
        </tr>
    </table>

    <!-- 구매 물품 목록 -->
    <table id="purchaseTable" class="mt-3">
        <thead>
            <tr>
                <th width="70px">품번</th>
                <th>품명</th>
                <th>단위</th>
                <th>수량</th>
                <th>단가</th>
                <th>금액</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${approval.purchDraft.purchaseItems}" var="item">
                <tr>
                    <td>${item.productNo}</td>
                    <td>${item.productName}</td>
                    <td>${item.productUnit}</td>
                    <td>${item.productAmt}</td>
                    <td>${item.productPrice}</td>
                    <td>${item.productAmt * item.productPrice}</td>
                </tr>
            </c:forEach>
        </tbody>
        <tfoot>
            <tr class="total-row">
                <td colspan="5">합계</td>
                <td>${approval.purchDraft.purchTotal}</td>
            </tr>
        </tfoot>
    </table>

    <!-- 상세 내용 -->
    <div class="editor-section mt-3">
        <div class="content-area">
            ${approval.apprContent}
        </div>
    </div>
    
    <!-- 버튼 영역 -->
    <div class="button-area" style="margin-top: 20px; text-align: center;">
        <c:choose>
            <%-- 결재 대기 문서함 --%>
            <c:when test="${param.type eq 'todo'}">
                <button type="button" class="btn btn-primary" onclick="approveDocument()">결재</button>
                <button type="button" class="btn btn-danger" onclick="rejectDocument()">반려</button>
            </c:when>
            <%-- 결재 예정 문서함 --%>
            <c:when test="${param.type eq 'upcoming'}">
                <button type="button" class="btn btn-secondary" disabled>결재 예정</button>
            </c:when>
        </c:choose>
        <button type="button" class="btn btn-secondary" onclick="history.back()">목록</button>
    </div>
</div>
    <!-- Summernote JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
		<script src="${contextPath}/libs/summernote/summernote-bs4.min.js" defer></script>
		
<!-- <style>
    .purchase-form {
        width: 1000px;
        margin: 0 auto;
        padding: 20px;
    }
    
    .form-header {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }
    
    .approval-line {
        display: flex;
        gap: 10px;
    }
    
    #apprUserLineTable {
        width: 126px;
        margin-left: 150px;
        table-layout: fixed;
        border-collapse: collapse;
    }
    
    .approvalLineTable {
        width: 126px;
        table-layout: fixed;
        border-collapse: collapse;
    }
    
    .stamp {
        width: 50px;
        height: 50px;
        margin: 5px auto;
        border: 2px solid #000;
        border-radius: 50%;
        display: flex;
        align-items: center;
        justify-content: center;
        font-weight: bold;
    }
    
    .stamp.approved {
        border-color: #ff0000;
        color: #ff0000;
    }
    
    .stamp.rejected {
        border-color: #ff0000;
        color: #ff0000;
    }
    
    .stamp.pending {
        border-color: #ccc;
        color: #ccc;
    }
    
    .content-area {
        min-height: 300px;
        text-align: left;
    }
    
    .total-row {
        background-color: #f9f9f9;
        font-weight: bold;
    }
    
    table {
        width: 100%;
        border-collapse: collapse;
    }
    
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
</style> -->

<script>
/* function approveDocument() {
    if(confirm('해당 문서를 승인하시겠습니까?DraftDetail.jsp')) {
        $.ajax({
            url: '${contextPath}/approval/approve',
            type: 'POST',
            data: {
                apprNo: '${approval.apprNo}',
                apprStatus: '${approval.apprStatus}'
            },
            success: function(response) {
                if(response.success) {
                    alert('결재가 완료되었습니다.');
                    location.href = '${contextPath}/approval/todo';
                } else {
                    alert('결재 처리 중 오류가 발생했습니다.');
                }
            }
        });
    }
}

function rejectDocument() {
    const lineReason = prompt('반려 사유를 입력해주세요.');
    if(reason) {
        $.ajax({
            url: '${contextPath}/approval/reject',
            type: 'POST',
            data: {
                apprNo: '${approval.apprNo}',
                userNo: '${loginUser.userNo}',
                lineReason: lineReason
            },
            success: function(response) {
                if(response.success) {
                    alert('반려가 완료되었습니다.');
                    location.href = '${contextPath}/approval/todo';
                } else {
                    alert('반려 처리 중 오류가 발생했습니다.');
                }
            }
        });
    }
} */
</script>