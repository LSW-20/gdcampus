<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<jsp:useBean id="now" class="java.util.Date" />

<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>양식 상세</title>
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
        .appr-type {
          width: 600px;
        }
        
        table {
            border-collapse: collapse;
            margin-bottom: 20px;
            width: 100%;
        }
        
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: center;
        }
        
        th {
            background-color: #f5f5f5;
            width: 15%;
        }
        
        .btn-area {
            text-align: right;
            margin-bottom: 20px;
        }
        
        .modified-info {
            margin-bottom: 20px;
            color: #666;
            font-size: 14px;
            text-align: right;
        }  
        
        /* 수정모드가 아닐 때 summernote 읽기 전용 스타일 */
        .note-editor.note-frame.disabled {
            border: 1px solid #ddd !important;
        }
        .note-editor.note-frame.disabled .note-editing-area {
            background-color: #f8f9fa;
        }
        .note-editor.note-frame.disabled .note-toolbar {
            display: none;
        }               
    </style>
</head>
<body data-topbar="dark" data-sidebar="dark">
    <!-- header, sidebar include ... -->

    <div class="approval-form">
        <div class="title">양식상세</div>        
        <form id="approvalForm" action="${contextPath}/approval/admin/updateForm" method="post">
            <input type="hidden" name="apprNo" value="${apprForm.apprNo}">
            
            <div class="form-container">
                <div class="btn-area">
                    <button type="button" id="editBtn" class="btn btn-primary" onclick="toggleEdit()">수정하기</button>
                    <button type="submit" id="submitBtn" class="btn btn-success" style="display:none;">수정완료</button>
                    <button type="button" id="cancelBtn" class="btn btn-danger" style="display:none;" 
                            onclick="cancelEdit()">취소</button>
                    <button type="button" class="btn btn-secondary" onclick="history.back()">목록</button>
                </div>
                
                <c:if test="${not empty apprForm.modifyDate}">
                    <div class="modified-info">
                        최종 수정일: <fmt:formatDate value="${apprForm.modifyDate}" pattern="yyyy-MM-dd HH:mm"/>
                        &nbsp;|&nbsp; 
                        수정자: ${apprForm.modifyUser}
                    </div>
                </c:if>
                
                <!-- 문서 양식 -->
                <div class="approval-content">
                    <table>
                        <tr>
                            <th>문서명</th>
                            <td>
                                <input type="text" class="appr-type" name="apprType" 
                                       value="${apprForm.apprType}" style="width:100%;" disabled>
                            </td>
                        </tr>
                        <tr>
                            <td colspan="2" class="content-area">
                                <textarea id="summernote" name="apprContent">${apprForm.apprContent}</textarea>
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
    
    <script>
    let editor;
    
    $(document).ready(function() {
        // Summernote 초기화 (읽기 전용으로)
        editor = $('#summernote').summernote({
            width: 900,
            height: 800,
            toolbar: [],
            disableResizeEditor: true
        });
        
        // 초기에는 읽기 전용으로 설정
        $('#summernote').summernote('disable');
        $('.note-editor').addClass('disabled');
        
        // form submit 전 validation
        $("#approvalForm").on("submit", function(e) {
            if(!$("input[name='apprType']").val().trim()) {
                alert("문서명을 입력해주세요.");
                e.preventDefault();
                return false;
            }
            
            if(!$('#summernote').val().trim()) {
                alert("양식 내용을 입력해주세요.");
                e.preventDefault();
                return false;
            }
        });
    });
    
    // 수정모드 토글
    function toggleEdit() {
        // 수정 버튼 숨기고 완료/취소 버튼 표시
        $('#editBtn').hide();
        $('#submitBtn, #cancelBtn').show();
        
        // input과 에디터 활성화
        $('input[name="apprType"]').prop('disabled', false);
        $('#summernote').summernote('enable');
        
        // 에디터 툴바 표시
        $('.note-toolbar').show();
        $('.note-editor').removeClass('disabled');
        
        // 에디터 설정 변경
        $('#summernote').summernote('destroy');
        $('#summernote').summernote({
            width: 900,
            height: 800,
            placeholder: '양식 작성'
        });
    }
    
    // 수정 취소
    function cancelEdit() {
        if(confirm('수정을 취소하시겠습니까?')) {
            location.reload(); // 페이지 새로고침
        }
    }
    </script>     
</body>
</html>