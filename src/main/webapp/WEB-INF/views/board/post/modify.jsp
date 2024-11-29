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

          <form id="modify-form" method="post" action="${ contextPath }/board/post/modify" enctype="multipart/form-data">
              <input type="hidden" name="postNo" value="${p.postNo }">
              <div class="form-group">
                  <label for="title">제목 </label>
                  <input type="text" class="form-control" id="title" name="postTitle" value="${ p.postTitle }" required><br>
                  
                  <label for="writer">작성일 </label>
                  <input type="text" class="form-control" id="registDate" value="${ p.registDate }" readonly><br>
                  
                  <label for="upfile">첨부파일 </label>
                  <input type="file" class="form-control-file post" id="uploadFiles" name="uploadFiles" multiple>
                  
                  <c:forEach var="at" items="${p.attachList}">
                  	<div>
	                  	<a href="${contextPath}${at.filePath}/${at.filesystemName}" download="${ at.originalName }">${ at.originalName}</a> 
	                  	<span class="origin_attach_del" data-fileno="${ at.fileNo }">x</span>
                  	</div>
                  </c:forEach>
                  
                  <br><br>

                  <label for="postName">내용 </label>
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
          			let hiddenEl = "<input type='hidden' name='postNo' value='" + $(this).data("fileno") + "'>";
          			$("#modify-form").append(hiddenEl); // 자손요소로 추가
          			
          			// 화면으로부터 삭제된거 처럼 보여지게 해당 첨부파일 링크 삭제 처리
          			$(this).parent().remove();
          			
          		})
          	})
          	
          	//
          	//  모든 order-window-2-menu 클래스를 가진 요소에 대해 이벤트 리스너 추가
							  document.querySelectorAll('.order-window-2-menu').forEach(function(element) {
							    element.addEventListener('mouseover', function() {
							      // 마우스를 올렸을 때 커서를 포인터로 변경
							      this.style.cursor = 'pointer';
							    });
							
							    element.addEventListener('mouseout', function() {
							      // 마우스를 벗어났을 때 커서를 기본값으로 변경
							      this.style.cursor = 'default';
							    })
							  })
          </script>
          
          <!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->

<!-- JAVASCRIPT -->
        <script src="${contextPath }/libs/jquery/jquery.min.js"></script>
        <script src="${contextPath }/libs/metismenu/metisMenu.min.js"></script>
        <script src="${contextPath }/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath }/libs/simplebar/simplebar.min.js"></script>
        <script src="${contextPath }/libs/waypoints/lib/jquery.waypoints.min.js"></script>

        <!-- plugin js -->
        <script src="${contextPath }/libs/moment/min/moment.min.js"></script>
        <script src="${contextPath }/libs/jquery-ui-dist/jquery-ui.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/core/main.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/bootstrap/main.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/daygrid/main.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/timegrid/main.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/interaction/main.min.js"></script>

        <!-- Calendar init -->
        <script src="${contextPath }/js/pages/calendar.init.js"></script>
        <script src="${contextPath }/js/app.js"></script>
          
          
        </div>

</body>
</html>