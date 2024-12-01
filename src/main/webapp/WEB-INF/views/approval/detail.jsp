<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결재 문서 상세</title>
    
    <!-- jstree CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" rel="stylesheet" />
    
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
   
<style>
    .main-content {
        margin-left: 250px;
        padding: 20px;
    }

    .detail-container {
        background-color: #fff;
        padding: 20px;
        border-radius: 5px;
        box-shadow: 0 0 10px rgba(0,0,0,0.1);
    }

    .button-area {
        margin: 20px 0;
        padding: 10px;
        border-bottom: 1px solid #ddd;
    }

    .action-button {
        padding: 8px 16px;
        margin-right: 5px;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }

    .action-button.primary {
        background-color: #4B49AC;
        color: white;
    }

    .action-button.danger {
        background-color: #dc3545;
        color: white;
    }

    .action-button:disabled {
        background-color: #ccc;
        cursor: not-allowed;
    }

    /* Modal Styles */
    .modal {
        display: none;
        position: fixed;
        z-index: 1050;
        left: 0;
        top: 0;
        width: 100%;
        height: 100%;
        background-color: rgba(0,0,0,0.5);
    }

    .modal-content {
        background-color: #fefefe;
        margin: 5% auto;
        padding: 20px;
        width: 70%;
        max-width: 800px;
        position: relative;
    }

    .modal-body {
        display: flex;
        gap: 20px;
        padding: 15px;
    }

    .approval-form, .purchase-form {
        width: 1000px;
        margin: 0 auto;
        padding: 20px;
    }

    .form-header {
        display: flex;
        /* justify-content: space-between; */
        margin-bottom: 20px;
    }

    .form-info {
        width: 30%;
    }

    .approval-line {
        display: flex;
        gap: 10px;
    }

    #apprUserLineTable {
        width: 126px;
        margin-left: 50px;
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

    .total-row {
        background-color: #f9f9f9;
        font-weight: bold;
    }

    input[type="text"],
    input[type="date"] {
        width: 90%;
        padding: 5px;
    }

    input[readonly] {
        background-color: #f8f9fa;
    }

    .title {
        font-size: 35px;
        text-align: center;
        margin-bottom: 20px;
        font-weight: bold;
    }

    .editor-section {
        margin-top: 20px;
    }

    .approvalDate {
        height: 36.5px;
    }

    #purchaseTable {
        margin-top: 20px;
    }
     /* 결재자 테이블 영역 가로 배치 */
     #approvalTablesContainer {
         display: flex;
         flex-wrap: wrap;
         gap: 10px;
     }    
</style>

</head>
<body data-topbar="dark" data-sidebar="dark">
    <div id="layout-wrapper">
        <!-- header -->
        <jsp:include page="/WEB-INF/views/common/header.jsp"/>
        
        <!-- sidebar -->
        <jsp:include page="/WEB-INF/views/common/sidebar.jsp"/>
        
        <!-- 본문 시작 -->
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <div class="detail-container">
                        <!-- 문서함 종류에 따른 버튼 영역 -->
                        <div class="button-area">
                            <c:choose>
                                <%-- 내 기안 문서함 (대기 상태일 때만 수정/삭제 가능) --%>
                                <c:when test="${type eq 'myDoc' && approval.apprStatus eq '0'}">
                                    <button type="button" class="action-button primary" onclick="enableEdit()">수정</button>
                                    <button type="button" class="action-button danger" onclick="deleteDoc()">삭제</button>
                                </c:when>
                                
                                <%-- 결재 대기 문서함 --%>
                                <c:when test="${type eq 'todo'}">
                                    <button type="button" class="action-button primary" onclick="approveDoc()">결재</button>
                                    <button type="button" class="action-button danger" onclick="rejectDoc()">반려</button>
                                </c:when>
                                
                                <%-- 결재 예정 문서함 --%>
                                <c:when test="${type eq 'upcoming'}">
                                    <button type="button" class="action-button" disabled>결재 예정</button>
                                </c:when>
                                
                                <%-- 내결재함 --%>
                                <c:when test="${type eq 'approved'}">
                                	<button type="button" class="action-button" disabled>결재 완료</button>
                                </c:when>
                            </c:choose>
                            <button type="button" class="action-button" onclick="history.back()">목록</button>
                        </div>

                        <!-- 문서 내용 -->
                        <c:choose>
                            <c:when test="${approval.apprType eq '기안서'}">
                                <jsp:include page="simpleDraftDetail.jsp"/>
                            </c:when>
                            <c:when test="${approval.apprType eq '품의서'}">
                                <jsp:include page="purchaseDraftDetail.jsp"/>
                            </c:when>
										        <c:otherwise>
										            <!-- 관리자 정의 양식인 경우 -->
																<jsp:include page="adDraftDetail.jsp"/>
										        </c:otherwise>                            
                        </c:choose>
													<!-- 반려 상태일 때만 반려사유 표시 -->
													<c:if test="${approval.apprStatus eq '3'}">
													    <div style="margin-top: 30px; border: 2px solid #dc3545; padding: 20px; border-radius: 5px;">
													        <h4 style="color: #dc3545; margin-bottom: 15px;">⚠️ 반려 사유</h4>
													        <div style="background-color: #fff3f3; padding: 15px; border-radius: 3px;">
													            <c:set var="firstRejecter" value="${null}" />
													            
													            <!-- 최초 반려자 찾기 -->
													            <c:forEach items="${approval.approvers}" var="approver">
													                <c:if test="${approver.lineStatus eq '2' && (firstRejecter eq null || approver.lineOrder < firstRejecter.lineOrder)}">
													                    <c:set var="firstRejecter" value="${approver}" />
													                </c:if>
													            </c:forEach>
													            
													            <!-- 최초 반려자의 정보만 표시 -->
													            <c:if test="${firstRejecter ne null}">
													                <div style="margin-bottom: 10px;">
													                    <strong style="color: #333;">반려 일자 : ${firstRejecter.lineDate}</strong>
													                    <div style="margin-top: 5px; color: #dc3545;">
													                        ${firstRejecter.lineReason}
													                    </div>
													                </div>
													            </c:if>
													        </div>
													    </div>
													</c:if>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <!-- 결재선 모달 (수정 시에만 사용) -->
    <div id="approvalModal" class="modal">
        <div class="modal-content">
            <h3>결재선 지정</h3>
            <div class="modal-body">
                <div class="org-tree-container">
                    <h5>조직도</h5>
                    <div id="orgTree"></div>
                </div>
                <div id="selectedApprovers">
                    <h5>결재선 (<span id="approverCount">0</span>/3)</h5>
                    <ul id="approversList"></ul>
                </div>
            </div>
            <div class="text-center mt-3">
                <button type="button" class="action-button primary" onclick="ApprovalModal.save()">확인</button>
                <button type="button" class="action-button" onclick="ApprovalModal.hide()">취소</button>
            </div>
        </div>
    </div>

    
    <!-- Summernote JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
		<script src="${contextPath}/libs/summernote/summernote-bs4.min.js" defer></script>
	 
    <script>
        const contextPath = "${contextPath}";
        /* const initialApprovers = ${approval.approvers != null ? approval.approvers : '[]'}; */        
        let isEditMode = false;

        $(document).ready(function() {
            $('#summernote').summernote({
                width: 900,
                height:300,
                callbacks: {
                    onInit: function() {
                        // 에디터 영역의 기본 스타일 설정
                        $('.note-editable').css({
                            'color': '#000000',
                            'background-color': '#ffffff'
                        });
                        // 테이블 스타일 설정
                        $('.note-editable table').css({
                            'color': '#000000',
                            'border-color': '#000000'
                        });
                        $('.note-editable td, .note-editable th').css({
                            'border-color': '#000000',
                            'color': '#000000'
                        });
                    }
                },                
                disable: true
            });
            $('#summernote').summernote('disable');
        });
        
        // 수정 모드 활성화
        function enableEdit() {
            isEditMode = true;
            
            // readonly 해제
            document.querySelectorAll('input[readonly], textarea[readonly]')
                .forEach(el => el.removeAttribute('readonly'));
            
            // summernote 활성화
            $('#summernote').summernote('enable');
            
				    // 문서 종류에 따른 추가 처리
				    const apprType = document.querySelector('input[name="apprType"]').value;
				    if(apprType === '품의서') {
				        enablePurchaseEdit(); // 품의서인 경우 추가 활성화
				    }	
				    
            // 버튼 영역 변경
            document.querySelector('.button-area').innerHTML = `
                <button type="button" class="action-button primary" onclick="ApprovalModal.show()">결재선 수정</button>            
                <button type="button" class="action-button primary" onclick="saveDoc()">저장</button>
                <button type="button" class="action-button" onclick="cancelEdit()">취소</button>
            `;
            
				    // 기존 결재선 정보를 모달에 설정
				    const originalApprovers = JSON.parse(document.getElementById('originalApprovalLine').value);
				    if (originalApprovers.length > 0) {
				        document.getElementById('approversList').innerHTML = ''; // 기존 목록 초기화
				        originalApprovers.forEach(approver => {
				            ApprovalModal.addApprover(
				                approver.userNo,
				                approver.userName,
				                approver.rankName,
				                approver.deptName
				            );
				        });
				    }			    
        }

     // 품의서 물품 정보 수집 함수 추가
        function collectPurchaseItems() {
            const items = [];
            const rows = document.querySelectorAll('#purchaseTable tbody tr');
            
            rows.forEach((row, index) => {
                items.push({
                    productNo: row.querySelector('input[name$=".productNo"]').value,
                    productName: row.querySelector('input[name$=".productName"]').value,
                    productUnit: row.querySelector('input[name$=".productUnit"]').value,
                    productAmt: row.querySelector('input[name$=".productAmt"]').value,
                    productPrice: row.querySelector('input[name$=".productPrice"]').value,
                    updateYn: row.querySelector('input[name$=".updateYn"]')?.value || 'true'
                });
            });
            
            return items;
        }        
        
        //수정사항 저장
				function saveDoc() {
				    if(!ApprovalModal.checkRequiredFields()) {
				        return;
				    }
				    
				    if(confirm('수정사항을 저장하시겠습니까?')) {
				        // form data 수집
				        const formData = $('#docForm').serializeArray();
				        
				        // 결재선 정보를 JSON 문자열로 변환
				        const approvers = JSON.parse(document.getElementById('approvalLine').value);
				        const approversData = approvers.map((approver, index) => ({
				            userNo: approver.userNo,
				            lineOrder: index + 1,
				            createUser: approver.userNo
				        }));
				        
				        const requestData = {
				            apprNo: formData.find(item => item.name === 'apprNo')?.value,
				            apprType: formData.find(item => item.name === 'apprType')?.value,
				            apprTitle: formData.find(item => item.name === 'apprTitle')?.value,
				            apprContent: formData.find(item => item.name === 'apprContent')?.value,
				            approvers: approversData
				        };
				
				        // 기안서인 경우
				        if(requestData.apprType === '기안서') {
				            requestData.draft = {
				                enforceDate: formData.find(item => item.name === 'enforceDate')?.value,
				                coopDept: formData.find(item => item.name === 'coopDept')?.value
				            };
				        }
				        // 품의서인 경우
				        else if(requestData.apprType === '품의서') {
				            const purchaseItems = collectPurchaseItems(); // 품의서 물품 정보 수집 함수
				            requestData.purchDraft = {
				                purchDept: formData.find(item => item.name === 'purchDraft.purchDept')?.value,
				                purchEmpName: formData.find(item => item.name === 'purchDraft.purchEmpName')?.value,
				                purchPurpose: formData.find(item => item.name === 'purchDraft.purchPurpose')?.value,
				                purchDeadline: formData.find(item => item.name === 'purchDraft.purchDeadline')?.value,
				                purchTotal: formData.find(item => item.name === 'purchDraft.purchTotal')?.value,
				                purchaseItems: purchaseItems
				            };
				        }
				        
				        $.ajax({
				            url: `${contextPath}/approval/update`,
				            type: 'POST',
				            contentType: 'application/json',
				            data: JSON.stringify(requestData),
				            success: function(response) {
				                if(response.success) {
				                    alert('수정이 완료되었습니다.');
				                    location.reload();
				                } else {
				                    alert('수정 중 오류가 발생했습니다.');
				                }
				            },
				            error: function(xhr, status, error) {
				                console.error('Update failed:', error);
				                alert('수정 중 오류가 발생했습니다.');
				            }
				        });
				    }
				}
        
        
        // 수정 취소
        function cancelEdit() {
            if(confirm('수정을 취소하시겠습니까?')) {
                location.reload();
            }
        }
        
        // 문서 삭제
        function deleteDoc() {
            if(confirm('문서를 삭제하시겠습니까?')) {
                $.ajax({
                    url: '${contextPath}/approval/delete',
                    type: 'POST',
                    data: { apprNo: '${approval.apprNo}' },
                    dataType: 'json',
                    success: function(result) {
                        if(result.success) {
                            alert('삭제되었습니다.');
                            location.href = '${contextPath}/approval/home';
                        } else {
                            alert('삭제 실패');
                        }
                    }
                });
            }
        }
        
        // 결재 승인
        function approveDoc() {
            if(confirm('결재를 올리시겠습니까?')) {
                $.ajax({
                    url: '${contextPath}/approval/approve',
                    type: 'POST',
                    data: { 
                        apprNo: '${approval.apprNo}'
                       ,apprStatus: '${approval.apprStatus}'
                    },
                    success: function(result) {
                        if(result.success) {
                            alert('결재가 완료되었습니다.');
                            location.href = '${contextPath}/approval/todo';
                        } else {
                            alert('결재 실패');
                        }
                    }
                });
            }
        }
        
        // 결재 반려
        function rejectDoc() {
            const reason = prompt('반려 사유를 입력해주세요.(선택사항)');
            if(reason !== null) {
                $.ajax({
                    url: '${contextPath}/approval/reject',
                    type: 'POST',
                    data: { 
                        apprNo: '${approval.apprNo}',
                        lineReason: reason
                    },
                    success: function(result) {
                        if(result.success) {
                            alert('반려되었습니다.');
                            location.href = '${contextPath}/approval/todo';
                        } else {
                            alert('반려 처리 실패');
                        }
                    }
                });
            }
        }
    </script>
    <!-- jstree -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    <!-- 결재선 관련 JS -->
    <script src="${contextPath}/js/approval-write.js"></script>
</body>
</html>