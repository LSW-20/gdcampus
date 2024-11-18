<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>구매품의서</title>
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
    
    <style type="text/css">
        body {
            font-family: 'Malgun Gothic', sans-serif;
            margin: 0;
        }
        .purchase-form {
            width: 1000px;
            height: 845px;
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
				    display: flex;
				    gap: 10px;  /* 테이블 간 간격 */            
        }
        /* 결재선 */
				#apprUserLineTable {
				    width: 126px;  /* 기안자 테이블 너비 */
				    margin-left: -140px;
				    table-layout: fixed;
				    border-collapse: collapse;
				}
				#approvalTablesContainer {
				    display: flex;
				    gap: 0px;
				}        
				.approvalLineTable {
				    width: 126px;  /* 결재선 테이블 너비 */
				    table-layout: fixed;
				    border-collapse: collapse;
				}
				.approvalHeader, .approvalDate{
						height: 36.5px;
				}	
				
				.approval-line table th,
				.approval-line table td {
				    border: 1px solid #ddd;
				    padding: 8px;
				    text-align: center;
				}          
        table {
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
				    font-weight: bold;
        }
				/* 미결재 상태의 스타일 */
				.approval-stamp.pending {
				    border-color: #ccc;
				    color: #ccc;
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
            font-size: 35px;
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
        /* 결재도장 */
				.stamp.approved {
				    border-color: #ff0000;
				    color: #ff0000;
				}
				
				.stamp.pending {
				    border-color: #ccc;
				    color: #ccc;
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
      <%-- <jsp:include page="/WEB-INF/views/common/header.jsp" /> --%>
      <!-- header 끝 -->

      <!-- sidebar 시작 -->
      <%-- <jsp:include page="/WEB-INF/views/common/sidebar.jsp" /> --%>
      <!-- sidebar 끝 -->
      <!-- main-content 시작 -->
		<!-- 결재 공통부분 start -->
		<div class="purchase-form">
    <div class="title">구매품의서</div>        
        <div class="form-header">
            <div class="form-info">
                <table>
                    <tr>
                        <th width="30%">기안자</th>
                        <td>${loginUser.userName}</td>
                    </tr>
                    <tr>
                        <th>소속</th>
                         <td>${loginUser.deptNo}</td>
                    </tr>
                    <tr>
                        <th>기안일</th>
                        <td><fmt:formatDate value="${now}" pattern="yy/MM/dd"/></td>
                    </tr>
                    <tr>
                        <th>문서번호</th>
                        <td>${apprNo}</td>
                    </tr>
                </table>
            </div>
            
					<div class="approval-line">
					
				    <!-- 기안자 결재선 테이블 -->
				    <table id="apprUserLineTable">
				        <tr>
				            <th width="100%">기안</th>
				        </tr>
				        <tr>
				            <td>
				                <div class="stamp">승인</div>
				                ${loginUser.userName} ${loginUser.rankName}
				            </td>
				        </tr>
				        <tr>
				            <td><fmt:formatDate value="${now}" pattern="yyyy-MM-dd"/></td>
				        </tr>
				    </table>

				    <!-- 결재선 테이블들이 동적으로 추가될 컨테이너 -->
				    <div id="approvalTablesContainer">
				        <!-- 여기에 결재선 테이블들이 동적으로 추가 -->
				    </div>					     
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
        <textarea rows="10" id="summernote" style="width: 100%;" name="apprContent"></textarea>
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
          placeholder: '기안 내용'
        });
      });
    </script>   
</body>
</html>
