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
            height: 956px;
            border: 1px solid #ddd;
            padding: 20px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }
        
        .form-header {
            display: flex;
            justify-content: space-between;
            margin-bottom: -20px;
        }
        
        .form-info {
            width: 30%;
        }
        
        .approval-line {
            width: 60%;
				    display: contents;
				    gap: 10px;  /* 테이블 간 간격 */            
        }
        /* 결재선 */
				#apprUserLineTable {
				    width: 126px;  /* 기안자 테이블 너비 */
				    margin-left: 150px;
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
        #purchInfo input{
        	width:100%;
        }
        #productNo {
        	width: 30px;
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
                         <td><input type="hidden" name="deptNo" value="${loginUser.deptNo}">${ loginUser.deptName }</td>
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
				                <input type="hidden" name="apprUser" value=" ${loginUser.userNo}">
				                <input type="hidden" name="apprType" value="품의서">
				                <input type="hidden" name="createUser" value="${loginUser.userNo}">				                
					                
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
        <button type="button" class="btn" onclick="addRow()">추가</button>
        <button type="button" class="btn" onclick="deleteRow()">삭제</button>
    </div>
		
		<table id="purchInfo" border="1" width="955px">
      <tr>
          <th>제목</th>
          <td colspan="3"><input type="text" class="appr-title" name="apprTitle"></td>
      </tr>		
			<tr>
				<th>담당부서</th>
				<td><input type="text" name="purchDept"></td>
				<th>납품자</th>
				<td><input type="text" name="purchEmpName"></td>
			</tr>
			<tr>
				<th>사용목적</th>
				<td><input type="text" name="purchPurpose"></td>
				<th>희망납기일</th>
				<td><input type="date" name="purchDeadline"></td>
			</tr>								
		</table>
		
    <table id="purchaseTable" border="1" width="955px">
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
        <tbody id="tableBody">
            <tr>
        				<td><input type="text" style="width: 90%;" name="productNo" value="1" readonly></td>
                <td><input type="text" style="width: 90%;" name="productName"></td>
                <td><input type="text" style="width: 90%;" name="productUnit"></td>
                <td><input type="number" style="width: 90%;" onchange="calculateAmount(this)" name="productAmt"></td>
                <td><input type="number" style="width: 90%;" onchange="calculateAmount(this)" name="productPrice"></td>
                <td class="amount" >0
	                <input type="hidden" name="productPerPrice" value="0">
                </td>
            </tr>
        </tbody>
        <tfoot>
            <tr class="total-row">
                <td colspan="5">합계</td>
                <td id="totalAmount">0
                	<input type="hidden" name="purchTotal" value="0">
                </td>
            </tr>
        </tfoot>
    </table>

    <div class="editor-section">
        <textarea rows="10" id="summernote" style="width: 100%;" name="apprContent"></textarea>
    </div>

    <script>
        function addRow() {
            const tbody = document.getElementById('tableBody');
            const nextProductNo = tbody.getElementsByTagName('tr').length + 1;  // 다음 품번
            const newRow = tbody.insertRow();
            console.log('다음 품번:', nextProductNo);  // 품번이 제대로 계산되는지 확인
            newRow.innerHTML = 
                '<td><input type="text" style="width: 90%;" name="productNo" value="' + nextProductNo + '" readonly></td>' +
                '<td><input type="text" style="width: 90%;" name="productName"></td>' +
                '<td><input type="text" style="width: 90%;" name="productUnit"></td>' +
                '<td><input type="number" style="width: 90%;" onchange="calculateAmount(this)" name="productAmt"></td>' +
                '<td><input type="number" style="width: 90%;" onchange="calculateAmount(this)" name="productPrice"></td>' +
                '<td class="amount">0' +
                '    <input type="hidden" name="productPerPrice" value="0">' +
                '</td>';
            console.log('추가된 행의 품번:', newRow.querySelector('input[name="productNo"]').value);


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
            
            //금액표시 및 hidden input값 설정
            row.cells[5].childNodes[0].nodeValue = amount;  // 텍스트 노드 업데이트
            row.cells[5].querySelector('input[name="productPerPrice"]').value = amount;  // hidden input 업데이트
            
            calculateTotal();
        }

        function calculateTotal() {
            const amounts = document.getElementsByClassName('amount');
            let total = 0;
            for (let i = 0; i < amounts.length; i++) {
                total += parseInt(amounts[i].childNodes[0].nodeValue) || 0;  // 텍스트 노드에서 값 가져오기
            }
            
         		//합계 표시 및 hidden input 값 설정
            document.getElementById('totalAmount').childNodes[0].nodeValue = total;  // 텍스트 노드 업데이트
            document.querySelector('input[name="purchTotal"]').value = total;  // hidden input 업데이트
            
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
          placeholder: '구매사유'
        });
      });
    </script>   
</body>
</html>
