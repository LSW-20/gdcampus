<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>${ selectedForm.apprType }</title>
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">

</head>
<body>
<div class="custom-form">
    <input type="hidden" name="apprType" value="${param.formType}"/>
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
            height:900
        });
      });
    </script>	
</body>
</html>