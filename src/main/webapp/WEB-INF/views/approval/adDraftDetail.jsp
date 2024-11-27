<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<div class="approval-form">
    <div class="title">${ approval.apprType }</div>        
    <div class="form-header">
        <div class="form-info">
            <table>
                <tr>
                    <th width="30%">기안자</th>
                    <td>${approval.userName}</td>
                </tr>
                <tr>
                    <th>소속</th>
                    <td>${approval.deptName}</td>
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
        
        <!-- 결재선 영역 -->
        <div class="approval-line">
            <!-- 기안자 결재선 테이블 -->
            <table id="apprUserLineTable">
                <tr>
                    <th width="100%">기안</th>
                </tr>
                <tr>
                    <td>
                        <div class="stamp approved">승인</div>
                         ${approval.userName} 
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
                            <th width="100%">${status.count}차결재</th>
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

    <!-- 문서 내용 -->
    <form id="docForm">
        <input type="hidden" name="apprType" value="${ approval.apprType }"/>
        <input type="hidden" name="apprNo" value="${approval.apprNo}"/>
        <input type="hidden" name="apprStatus" value="${approval.apprStatus}"/>
        <!-- 결재선 정보를 저장할 hidden input -->
        <input type="hidden" id="approvalLine" name="approvalLine"/>
        <input type="hidden" id="originalApprovalLine" name="originalApprovalLine"/>
                
        <table>
            <tr>
                <th>제목</th>
                <td>
                    <input type="text" class="appr-title" name="apprTitle" value="${approval.apprTitle}" readonly />
                </td>
            </tr>
            <tr>
                <td colspan="2" class="content-area">
                    <textarea id="summernote" name="apprContent" readonly>${approval.apprContent}</textarea>
                </td>
            </tr>
        </table>
    </form>
</div>
    <!-- Summernote JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
		<script src="${contextPath}/libs/summernote/summernote-bs4.min.js" defer></script>
<script>
    // 초기 결재선 정보를 JSON으로 변환하여 hidden input에 저장
    $(document).ready(function() {
        const approvers = [
            <c:forEach items="${approval.approvers}" var="approver" varStatus="status">
                {
                    userNo: '${approver.userNo}',
                    userName: '${approver.userName}',
                    rankName: '${approver.rankName}',
                    deptName: '${approver.deptName}',
                    lineOrder: ${approver.lineOrder},
                    lineStatus: ${approver.lineStatus}
                }${!status.last ? ',' : ''}
            </c:forEach>
        ];
        
        // 원본 결재선 정보 저장
        document.getElementById('originalApprovalLine').value = JSON.stringify(approvers);
        document.getElementById('approvalLine').value = JSON.stringify(approvers);
    });
</script>