<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="approval-form">
    <div class="title">업무 기안</div>        
    <div class="form-header">
        <div class="form-info">
            <table>
                <tr>
                    <th width="30%">기안자</th>
                    <td>${approval.apprUser}</td>
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
                    <td>${approval.apprNo}</td>
                </tr>
            </table>
        </div>
        
<!-- 결재선 테이블 영역 -->
<div class="approval-line">
    <!-- 기안자 결재선 테이블 -->
    <table id="apprUserLineTable">
        <tr class="approvalHeader">
            <th width="100%">기안</th>
        </tr>
        <tr class="approvalStamp">
            <td>
                <div class="stamp approved">승인</div>
                ${approval.userName} ${approval.rankName}
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
                <tr class="approvalHeader">
                    <th width="100%">${status.count}차결재</th>
                </tr>
                <tr class="approvalStamp">
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

<!-- 관련 스타일 추가 -->
<style>
    #apprUserLineTable {
        width: 126px;  /* js와 동일한 너비 */
        margin-left: -140px; /* js와 동일한 위치 조정 */
        table-layout: fixed;
        border-collapse: collapse;
    }
    
    #approvalTablesContainer {
        display: flex;
        gap: 0px;
    }
    
    .approvalLineTable {
        width: 126px;  /* js와 동일한 너비 */
        table-layout: fixed;
        border-collapse: collapse;
    }
    
    .approvalHeader, 
    .approvalDate {
        height: 36.5px;
    }
    
    .stamp {
        width: 50px;
        height: 50px;
        margin: 5px auto;
        border: 2px solid;
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
</style>

<script>
function approveDocument() {
    if(confirm('해당 문서를 승인하시겠습니까?')) {
        // 승인 처리 로직
    }
}

function rejectDocument() {
    // 반려 사유 입력 모달 표시 등의 로직
}
</script>