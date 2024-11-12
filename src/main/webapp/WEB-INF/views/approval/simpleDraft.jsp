<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>업무 기안</title>
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Malgun Gothic', sans-serif;
            margin: 0;
        }
        .approval-form {
            width: 1000px;
            height: 845px;
            margin-top: 35px;
            margin-left: 280px;
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
        /* simpleDraft별도 */
        textarea {
/*         	height: 300px;
        	width: 500px; */
        }        
    </style>
</head>
<body data-topbar="dark" data-sidebar="dark">
<%-- 	<!-- header 시작 -->
	<jsp:include page="/WEB-INF/views/common/header.jsp" />
	<!-- header 끝 -->
	
	<!-- sidebar 시작 -->
	<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
	<!-- sidebar 끝 --> --%>

    <div class="approval-form">
    <div class="title">업무 기안</div>        
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


        <table>
            <tr>
                <th width="20%">시행일자</th>
                <td width="30%"><input type="date" name="enforceDate"></td>
                <th width="20%">협조부서</th>
                <td width="30%"><input type="text" name="coopDept"></td>
            </tr>
            <tr>
                <th>제목</th>
                <td colspan="3"><input type="text" class="appr-title" name="apprTitle"></td>
            </tr>
            <tr>
                <td colspan="4" class="content-area">
                    <textarea id="summernote" name="apprContent"></textarea>
                </td>
            </tr>
        </table>
        
        <div style="margin-top: 20px;">
            <span style="color: #666;">첨부파일 0개 (0.0Byte)</span>
        </div>
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
            height:300,        	
          placeholder: '기안 내용'
        });
      });
    </script>     
</body>
</html>
