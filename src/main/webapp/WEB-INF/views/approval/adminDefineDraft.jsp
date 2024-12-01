<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ selectedForm.apprType }</title>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
	<style>
    .approval-form {
        width: 1000px;
        /* height: 845px; */
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
				    width: 55%;
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
	</style>
</head>
<body>
<div class="approval-form">
		
        <div class="form-header">
            <div class="form-info">
                <table>
                    <tr>
                        <th width="30%">기안자</th>
                        <td>${loginUser.userName}</td>
                    </tr>
                    <tr>
                        <th>소속</th>
                         <td><input type="hidden" name="deptNo" value="${loginUser.deptNo}">${ loginUser.deptNo == 1 ? "인사" : "교무" }</td>
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
				                <input type="hidden" name="apprType" value="${param.formType}">
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

    <div class="form-type-display">
        <h3>${param.formType}</h3>
    </div>
    <table>
        <tr>
            <th>제목</th>
            <td>
                <input type="text" name="apprTitle" class="form-control">
            </td>
        </tr>
        <tr>
            <td colspan="2">
                <textarea id="summernote" name="apprContent">${ selectedForm.apprContent }</textarea>
            </td>
        </tr>
    </table>
</div>
    <!-- Summernote JS -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
		<script src="https://stackpath.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.js"></script>
		<script src="${contextPath}/libs/summernote/summernote-bs4.min.js" defer></script>
    <script>
    $(document).ready(function() {
        $('#summernote').summernote({
            width: 900,
            height:760,
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
        });
      });
    </script>	
</body>
</html>