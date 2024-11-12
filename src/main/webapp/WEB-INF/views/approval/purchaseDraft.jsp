<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구매품의서</title>
    <style type="text/css">
        body {
            font-family: 'Malgun Gothic', sans-serif;
            margin: 0;
        }
        .purchase-form {
            width: 1000px;
            height: 845px;
            margin: 180px auto;
            border: 1px solid #ddd;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        
        .form-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: 20px;
        }
        
        .form-info {
            width: 30%;
        }
        
        .approval-line {
            width: 60%;
        }
        
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        
        th {
            background-color: #f5f5f5;
        }
        
        .stamp {
            width: 50px;
            height: 50px;
            margin: 5px auto;
            border: 2px solid #ff0000;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: #ff0000;
            font-weight: bold;
        }
				/* 미결재 상태의 스타일 */
				.approval-stamp.pending {
				    border-color: #ccc;
				    color: #ccc;
				}
				
				/* 반려 상태의 스타일 */
				.approval-stamp.rejected {
				    border-color: #ff0000;
				    color: #ff0000;
				}        
        .title {
            font-size: 24px;
            text-align: center;
            margin-bottom: 20px;
            font-weight: bold;
        }
        
        .content-area {
            min-height: 300px;
            text-align: left;
            vertical-align: top;
            padding: 20px;
        }
        .appr-title
        {
          width: 600px;
        }    
        
        /* 품의서 별도 style */
        .btn-section {
            text-align: right;
            margin: 10px 0;
        }
        .btn {
            padding: 5px 10px;
            margin-left: 5px;
            cursor: pointer;
        }
        .total-row {
            background-color: #f9f9f9;
            font-weight: bold;
        }    
        .editor-section {
            border: 1px solid #ddd;
            padding: 10px;
            margin-top: 20px;
        }
        .toolbar {
            border: 1px solid #ddd;
            padding: 5px;
            margin-bottom: 5px;
        }            
    </style>
</head>
<body data-topbar="dark" data-sidebar="dark">
  <!-- 전체 영역(헤더, 사이드바, 내용) 시작 -->
  <div id="layout-wrapper">
      <!-- header 시작 -->
      <jsp:include page="/WEB-INF/views/common/header.jsp" />
      <!-- header 끝 -->

      <!-- sidebar 시작 -->
      <jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
      <!-- sidebar 끝 -->
      <!-- main-content 시작 -->
		<div class="purchase-form">
		<!-- 결재 공통부분 start -->
    <div class="title">구매품의서</div>        
        <div class="form-header">
            <div class="form-info">
                <table>
                    <tr>
                        <th width="30%">기안자</th>
                        <td>apprName</td>
                    </tr>
                    <tr>
                        <th>소속</th>
                        <td>deptName</td>
                    </tr>
                    <tr>
                        <th>기안일</th>
                        <td>apprDate</td>
                    </tr>
                    <tr>
                        <th>문서번호</th>
                        <td>apprNo</td>
                    </tr>
                </table>
            </div>
            
            <div class="approval-line">
                <table>
                    <tr>
                        <th width="50%">신청</th>
                        <th width="50%">대표이사</th>
                    </tr>
                    <tr>
                        <td>
                            <div class="stamp">승인</div>
                            loginUser
                        </td>
                        <td>
                            <div class="stamp">승인</div>
                            userNo
                        </td>
                    </tr>
                    <tr>
                        <td>lineDate</td>
                        <td>lineDate</td>
                    </tr>
                </table>
            </div>
        </div>				
				<!-- 결재 공통부분 end -->
    <div class="btn-section">
        <button class="btn" onclick="addRow()">추가</button>
        <button class="btn" onclick="deleteRow()">삭제</button>
    </div>

    <table id="purchaseTable" border="1">
        <thead>
            <tr>
                <th>품번</th>
                <th>품명</th>
                <th>단위</th>
                <th>수량</th>
                <th>단가</th>
                <th>금액</th>
            </tr>
        </thead>
        <tbody id="tableBody">
            <tr>
                <td>1</td>
                <td><input type="text" style="width: 90%;"></td>
                <td><input type="text" style="width: 90%;"></td>
                <td><input type="number" style="width: 90%;" onchange="calculateAmount(this)"></td>
                <td><input type="number" style="width: 90%;" onchange="calculateAmount(this)"></td>
                <td class="amount">0</td>
            </tr>
        </tbody>
        <tfoot>
            <tr class="total-row">
                <td colspan="5">합계</td>
                <td id="totalAmount">0</td>
            </tr>
        </tfoot>
    </table>

    <div class="editor-section">
        <textarea rows="10" style="width: 100%;" placeholder="구매사유를 입력하세요." name="apprTitle"></textarea>
    </div>

    <script>
        function addRow() {
            const tbody = document.getElementById('tableBody');
            const rowCount = tbody.getElementsByTagName('tr').length;
            const newRow = tbody.insertRow();
            
            newRow.innerHTML = `
                <td>${rowCount + 1}</td>
                <td><input type="text" style="width: 90%;"></td>
                <td><input type="text" style="width: 90%;"></td>
                <td><input type="number" style="width: 90%;" onchange="calculateAmount(this)"></td>
                <td><input type="number" style="width: 90%;" onchange="calculateAmount(this)"></td>
                <td class="amount">0</td>
            `;
        }

        function deleteRow() {
            const tbody = document.getElementById('tableBody');
            if (tbody.rows.length > 1) {
                tbody.deleteRow(-1);
            }
            calculateTotal();
        }

        function calculateAmount(input) {
            const row = input.parentElement.parentElement;
            const quantity = parseInt(row.cells[3].getElementsByTagName('input')[0].value) || 0;
            const price = parseInt(row.cells[4].getElementsByTagName('input')[0].value) || 0;
            const amount = quantity * price;
            row.cells[5].textContent = amount;
            calculateTotal();
        }

        function calculateTotal() {
            const amounts = document.getElementsByClassName('amount');
            let total = 0;
            for (let i = 0; i < amounts.length; i++) {
                total += parseInt(amounts[i].textContent) || 0;
            }
            document.getElementById('totalAmount').textContent = total;
        }
    </script>				
				
				
		</div>
				
				


  <!-- main-content 끝 -->
  </div>
  <!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->
</body>
</html>
