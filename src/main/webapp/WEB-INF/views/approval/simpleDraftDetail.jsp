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
                    <td>${approval.apprNo}</td>
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
                         ${loginUser.userName} ${loginUser.rankName}
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
                                <c:if test="${type eq 'myDoc' && approval.apprStatus eq '0'}">
                                    <button type="button" class="approver-edit-btn" style="display: none;" 
                                            onclick="ApprovalModal.show()">결재선 수정</button>
                                </c:if>
                            </td>
                        </tr>
                    </table>
                </c:forEach>
            </div>
        </div>
    </div>

    <!-- 문서 내용 -->
    <form id="docForm">
        <input type="hidden" name="apprType" value="기안서"/>
        <table>
            <tr>
                <th width="20%">시행일자</th>
                <td width="30%">
                    <input type="date" name="enforceDate" value="<fmt:formatDate value='${approval.draft.enforceDate}' pattern='yyyy-MM-dd'/>" readonly />
                </td>
                <th width="20%">협조부서</th>
                <td width="30%">
                    <input type="text" name="coopDept" value="${approval.draft.coopDept}" readonly />
                </td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3">
                    <input type="text" class="appr-title" name="apprTitle" value="${approval.apprTitle}" readonly />
                </td>
            </tr>
            <tr>
                <td colspan="4" class="content-area">
                    <textarea id="summernote" name="apprContent" readonly>${approval.apprContent}</textarea>
                </td>
            </tr>
        </table>
    </form>
</div>

<%-- <style>
    .approval-form {
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
        margin-left: -140px;
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
    
    table {
        width: 100%;
        border-collapse: collapse;
    }
    
    th, td {
        border: 1px solid #ddd;
        padding: 8px;
        text-align: center;
    }
    
    .content-area {
        min-height: 300px;
        text-align: left;
    }
    
    input[type="text"],
    input[type="date"] {
        width: 90%;
        padding: 5px;
    }
    
    input[readonly] {
        background-color: #f8f9fa;
    }
</style>
    <!-- Summernote JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
		<script src="${contextPath}/libs/summernote/summernote-bs4.min.js" defer></script>
	
<script>
    $(document).ready(function() {
        $('#summernote').summernote({
            width: 900,
            height:300,
            toolbar: [],
            disable: true
        });
        $('#summernote').summernote('disable');
    });
</script> --%>