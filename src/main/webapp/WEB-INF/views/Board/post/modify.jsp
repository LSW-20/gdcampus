<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jstree CSS -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/themes/default/style.min.css" rel="stylesheet" />
    
    <!-- Summernote CSS -->
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.9.0/dist/summernote.min.css" rel="stylesheet">
   

    <style>
        .draft-title {
            font-size: 25px;
        }
        
        /* Modal Styles */
        .modal {
            display: none;
            position: fixed;
            z-index: 1050;
            left: 0;
            top: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0,0,0,0.5);
        }
        
        .modal-content {
            background-color: #fefefe;
            margin: 5% auto;
            padding: 20px;
            width: 70%;
            max-width: 800px;
            position: relative;
        }
        
				.modal-body {
				    display: flex;
				    gap: 20px;
				    padding: 15px;
				}
        
        #orgTree {
            height: 400px;
            overflow: auto;
            flex: 1;
            min-width: 250px;
            border: 1px solid #ddd;
            padding: 15px;
        }
        
#selectedApprovers {
    flex: 1;
    min-width: 250px;
    border: 1px solid #ddd;
    padding: 15px;
    border-radius: 4px;
}
        
#approversList {
    list-style: none;
    padding: 0;
    margin: 0;
    border: 1px solid #ddd;
    min-height: 100px;  /* 최소 높이 추가 */
}
        
#approversList li {
    padding: 10px;
    margin: 5px;
    background: #f8f9fa;
    border: 1px solid #ddd;
    border-radius: 4px;
    display: flex;          /* Flexbox 사용 */
    justify-content: space-between;  /* 내용물 양쪽 정렬 */
    align-items: center;    /* 세로 중앙 정렬 */
}

        .form-container {
            padding: 20px;
            margin: 20px;
            background: #fff;
            border-radius: 5px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
        }

        .approval-header {
            margin-bottom: 20px;
            border-bottom: 2px solid #eee;
            padding-bottom: 10px;
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
		
		<div class="container p-3">
     
          <h2 class="m-4">게시글 수정</h2>
          <br>

          <form id="modify-form" method="post" action="${ contextPath }/post/update.do" enctype="multipart/form-data">
              <input type="hidden" name="postNo" value="${ p.postNo }">
              <div class="form-group">
                  <label for="title">제목 </label>
                  <input type="text" class="form-control" id="title" name="postTitle" value="${ p.postTitle }" required><br>
                  
                  <label for="writer">작성자 </label>
                  <input type="text" class="form-control" id="writer" value="${ p.registDate }" readonly><br>
                  
                  <label for="upfile">첨부파일 </label>
                  <input type="file" class="form-control-file post" id="upfile" name="uploadFiles" multiple>
                  
                  <c:forEach var="at" items="${ p.attachList }">
                  	<div>
	                  	<a href="${contextPath}${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName }</a> 
	                  	<span class="origin_attach_del" data-fileno="${ at.fileNo }">x</span>
                  	</div>
                  </c:forEach>
                  
                  <br><br>

                  <label for="userName">내용 </label>
                  <textarea class="form-control" required name="postContent" id="content" rows="10" style="resize:none;">${ p.postContent }</textarea><br>
                  
              </div>
              <br>
              <div align="center">
                  <button type="submit" class="btn btn-primary">수정하기</button>
                  <button type="button" class="btn btn-danger" onclick="javascript:history.go(-1);">이전으로</button>
              </div>

          </form>
          
          <script>
          	$(document).ready(function(){
          		$(".origin_attach_del").on("click", function(){
          			
          			// 삭제할 첨부파일 번호를 submit시 넘기기위한 작업
          			// 수정하기 submit시 form요소내에 input type="hidden" 으로 첨부파일번호 숨기기
          			let hiddenEl = "<input type='hidden' name='delFileNo' value='" + $(this).data("fileno") + "'>";
          			$("#modify-form").append(hiddenEl);
          			
          			// 화면으로부터 삭제된거 처럼 보여지게 해당 첨부파일 링크 삭제 처리
          			$(this).parent().remove();
          			
          		})
          	})
          	
          </script>
          
        </div>

</body>
</html>