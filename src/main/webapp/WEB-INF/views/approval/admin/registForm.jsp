<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>양식 생성</title>
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
    
    <style>
        .draft-title {
            font-size: 25px;
        }    
        body {
            font-family: 'Malgun Gothic', sans-serif;
            margin: 0;
        }
        .approval-form {
            width: 1000px;
            height: 1160px;
            border: 1px solid #ddd;
            margin-left:270px;
            margin-top: 95px;
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
            height: 893px;
            text-align: left;
            vertical-align: top;
            padding: 20px;
        }
        .appr-title
        {
          width: 600px;
        }               
    </style>
</head>
<body data-topbar="dark" data-sidebar="dark">
 	<!-- header 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- header 끝 -->
	
	<!-- sidebar 시작 -->
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<!-- sidebar 끝 -->

    <div class="approval-form">
    <div class="title">양식생성폼</div>        
    <form id="approvalForm" action="${contextPath}/approval/admin/insertForm" method="post">
           
                    <div class="form-container">
                        <div class="approval-header">
                            <div class="btn-form">
                                
        												<button type="button" class="btn btn-primary" onclick="ApprovalModal.submitForm()">양식생성</button>
                                <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
                            </div>
                        </div>
                        
                        <!-- 문서 양식 -->
                        <div class="approval-content">
									        <table>
									            <tr>
									                <th>문서명</th>
									                <td colspan="3"><input type="text" class="appr-type" name="apprType" style="width:100%;"></td>
									            </tr>
									            <tr>
									                <td colspan="4" class="content-area">
									                    <textarea id="summernote" name="apprContent"></textarea>
									                </td>
									            </tr>
									        </table>
                        </div>
                    </div>
            
    </form>



        

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
            height:800,        	
          placeholder: '양식 작성'
        });
      });
    </script>     
</body>
</html>
