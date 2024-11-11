<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>업무 기안</title>
    <style>
        .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
        }
        .form-table {
            width: 30%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .force-dept-table {
            width: 65%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        .force-dept-table td, .force-dept-table th {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }        
        .form-table td, .form-table th {
            border: 1px solid #000;
            padding: 8px;
            text-align: center;
        }
        .force-dept-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }
        .form-table th {
            background-color: #f2f2f2;
            font-weight: bold;
        }        
        .title {
            text-align: center;
            font-size: 24px;
            margin: 20px 0;
            font-weight: bold;
        }
        .editor-section {
            width: 80%;
            display: flex;
            height: 300px;
            border: 1px solid #000;
            margin-bottom: 20px;
        }
        .editor-section textarea {
            width: 100%;
            height: 100%;
            border: none;
            padding: 10px;
            box-sizing: border-box;
        }
        .signature-table {
            width: 30%;
            border-collapse: collapse;
        }
        .signature-table td, .signature-table th {
            border: 1px solid #000;
            padding: 10px;
            text-align: center;
        }
        .signature-table th {
            background-color: #f2f2f2;
            font-weight: bold;
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

    <div class="title">업무 기안</div>
    <form>
        <div class="container">
            <table class="form-table">
                <tr>
                    <th>기안자</th>
                    <td>홍길동</td>

                </tr>
                <tr>
                    <th>기안부서</th>
                    <td>총무부</td>

                </tr>
                <tr>
                    <th>기안일</th>
                    <td>2024-11-06(수)</td>                
                </tr>
                <tr>
                    <th>문서번호</th>
                    <td>12345</td>                
                </tr>
            </table>
            <table class="signature-table">
                <tr>
                    <th>부회장</th>
                    <th>부회장</th>
                </tr>
                <tr>
                    <td>신청</td>
                    <td>승인</td>
                </tr>
                <tr>
                    <td>김회장</td>
                    <td>김회장</td>
                </tr>
            </table>         
        </div>
        
				<div align="center">
		        <table class="force-dept-table">
		            <tr>
		                <th>시행일자</th>
		                <td><input type="date" name="startDate" /></td>
		                <th>협조부서</th>
		                <td><input type="text" name="cooperationDept" /></td>
		            </tr>
		            <tr>
		                <th>제목</th>
		                <td colspan="3"><input type="text" style="width: 100%;" name="title" /></td>
		            </tr>
		        </table>   				
				</div>


        <div class="editor-section">
            <textarea name="editorContent"></textarea>
        </div>
    </form>

    <div>파일첨부</div>
    <div style="border: 1px dashed #000; padding: 10px; text-align: center;">
        이 곳에 파일을 드래그 하세요. 또는 파일선택
    </div>
</body>
</html>
