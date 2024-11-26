<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<form id="docForm">
	<!-- 기본 정보 hidden input -->
	<input type="hidden" name="apprNo" value="${approval.apprNo}"/>
	<input type="hidden" name="apprType" value="품의서"/>
	<input type="hidden" name="apprStatus" value="${approval.apprStatus}"/>
  <!-- 결재선 정보를 저장할 hidden input -->
  <input type="hidden" id="approvalLine" name="approvalLine"/>
  <input type="hidden" id="originalApprovalLine" name="originalApprovalLine"/>
	
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
    	 		<th>제목</th>
    	 		<td colspan="3"><input style="width:95%; "type="text" name="apprTitle" value="${ approval.apprTitle }" readonly></td>
    	 </tr>
	     <tr>
	         <th>담당부서</th>
	         <td><input type="text" name="purchDraft.purchDept" value="${approval.purchDraft.purchDept}" readonly/></td>
	         <th>납품자</th>
	         <td><input type="text" name="purchDraft.purchEmpName" value="${approval.purchDraft.purchEmpName}" readonly/></td>
	     </tr>
	     <tr>
	         <th>사용목적</th>
	         <td><input type="text" name="purchDraft.purchPurpose" value="${approval.purchDraft.purchPurpose}" readonly/></td>
	         <th>희망납기일</th>
	         <td><input type="date" name="purchDraft.purchDeadline" value="<fmt:formatDate value='${approval.purchDraft.purchDeadline}' pattern='yyyy-MM-dd'/>" readonly/></td>
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
                <c:forEach items="${approval.purchDraft.purchaseItems}" var="item" varStatus="status">
                    <tr>
                        <td>
                            <input type="hidden" name="purchaseItems[${status.index}].updateYn" value="false"/>
                            <input type="text" name="purchaseItems[${status.index}].productNo" value="${item.productNo}" readonly/>
                        </td>
                        <td><input type="text" name="purchaseItems[${status.index}].productName" value="${item.productName}" readonly/></td>
                        <td><input type="text" name="purchaseItems[${status.index}].productUnit" value="${item.productUnit}" readonly/></td>
                        <td><input type="number" name="purchaseItems[${status.index}].productAmt" value="${item.productAmt}" readonly class="calc-amt"/></td>
                        <td><input type="number" name="purchaseItems[${status.index}].productPrice" value="${item.productPrice}" readonly class="calc-price"/></td>
                        <td class="item-total">${item.productAmt * item.productPrice}</td>
                    </tr>
                </c:forEach>
            </tbody>
        <tfoot>
	        <tr class="total-row">
	            <td colspan="5">합계</td>
	            <td id="totalAmount">${approval.purchDraft.purchTotal}</td>
	        </tr>
        </tfoot>
    </table>
		<input type="hidden" name="purchDraft.purchTotal" value="${approval.purchDraft.purchTotal}"/>
    
    <!-- 상세 내용 -->
    <div class="editor-section mt-3">
        <div class="content-area">
            <textarea id="summernote" name="apprContent" readonly>${approval.apprContent}</textarea>
        </div>
    </div>
    </div>
</form>    
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
		
    // 물품 행 추가 버튼 (수정 모드일 때만 보임)
    function addItemRow() {
        const tbody = document.querySelector('#purchaseTable tbody');
        const newIndex = tbody.children.length;
        const tr = document.createElement('tr');
        
        tr.innerHTML = `
            <td><input type="text" name="purchaseItems[${newIndex}].productNo" required/></td>
            <td><input type="text" name="purchaseItems[${newIndex}].productName" required/></td>
            <td><input type="text" name="purchaseItems[${newIndex}].productUnit" required/></td>
            <td><input type="number" name="purchaseItems[${newIndex}].productAmt" required class="calc-amt"/></td>
            <td><input type="number" name="purchaseItems[${newIndex}].productPrice" required class="calc-price"/></td>
            <td class="item-total">0</td>
        `;
        
        tbody.appendChild(tr);
    }
document.addEventListener('DOMContentLoaded', function() {

    // 금액 자동 계산
    function calculateTotal() {
        let total = 0;
        
        document.querySelectorAll('#purchaseTable tbody tr').forEach(tr => {
            const amt = parseFloat(tr.querySelector('.calc-amt').value) || 0;
            const price = parseFloat(tr.querySelector('.calc-price').value) || 0;
            const itemTotal = amt * price;
            
            tr.querySelector('.item-total').textContent = itemTotal;
            total += itemTotal;
        });

        document.getElementById('totalAmount').textContent = total;
        document.querySelector('input[name="purchDraft.purchTotal"]').value = total;
    }

    // 이벤트 리스너
    document.getElementById('purchaseTable').addEventListener('input', function(e) {
        if (e.target.matches('.calc-amt, .calc-price')) {
            calculateTotal();
        }
    });
});

// 품의서 수정 모드 활성화 (detail.jsp의 enableEdit()에서 호출)
function enablePurchaseEdit() {
    // readonly 해제
    document.querySelectorAll('#docForm input[readonly], #docForm textarea[readonly]')
        .forEach(el => el.removeAttribute('readonly'));
        
    // 물품 추가 버튼 표시
    const table = document.getElementById('purchaseTable');
    const addButton = document.createElement('button');
    addButton.type = 'button';
    addButton.className = 'action-button primary';
    addButton.textContent = '물품 추가';
    addButton.onclick = addItemRow;  // 전역 함수 참조
    table.parentNode.insertBefore(addButton, table);

    // updateYn 값 설정
    document.querySelectorAll('input[name$=".updateYn"]')
        .forEach(input => input.value = "true");
}
</script>		
