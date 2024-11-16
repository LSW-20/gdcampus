<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.origin_attach_del{
		color:gray;
		font-size:0.8em;
		cursor:pointer;
	}
</style>
</head>
<body>
	<div class="container p-3">

      <!-- Header, Nav start -->
      <jsp:include page="/WEB-INF/views/common/header.jsp"/>
      <!-- Header, Nav end -->
  
      <!-- Section start -->
      <section class="row m-3" style="min-height: 500px">
  
        <div class="container border p-5 m-4 rounded">
          <h2 class="m-4">게시글 수정</h2>
          <br>

          <form id="modify-form" method="post" action="${ contextPath }/board/update.do" enctype="multipart/form-data">
              <input type="hidden" name="boardNo" value="${ b.boardNo }">
              <div class="form-group">
                  <label for="title">제목 </label>
                  <input type="text" class="form-control" id="title" name="boardTitle" value="${ b.boardTitle }" required><br>
                  
                  <label for="writer">작성자 </label>
                  <input type="text" class="form-control" id="writer" value="${ b.boardWriter }" readonly><br>
                  
                  <label for="upfile">첨부파일 </label>
                  <input type="file" class="form-control-file border" id="upfile" name="uploadFiles" multiple>
                  
                  <c:forEach var="at" items="${ b.attachList }">
                  	<div>
	                  	<a href="${contextPath}${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName }</a> 
	                  	<span class="origin_attach_del" data-fileno="${ at.fileNo }">x</span>
                  	</div>
                  </c:forEach>
                  
                  <br><br>

                  <label for="userName">내용 </label>
                  <textarea class="form-control" required name="boardContent" id="content" rows="10" style="resize:none;">${ b.boardContent }</textarea><br>
                  
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
  
      </section>
      <!-- Section end -->
  
      <!-- Footer start -->
      <jsp:include page="/WEB-INF/views/common/footer.jsp"/>
      <!-- Footer end -->
  
  </div>
</body>
</html>