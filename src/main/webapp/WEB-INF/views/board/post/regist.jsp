<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<jsp:include page="/WEB-INF/views/common/header.jsp" />
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8" />
        <title>Invoice List | Drezon - Responsive Bootstrap 4 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- bootstrap-datepicker css -->
        <link href="assets/libs/bootstrap-datepicker/css/bootstrap-datepicker.min.css" rel="stylesheet">

        <!-- DataTables -->
        <link href="assets/libs/datatables.net-bs4/css/dataTables.bootstrap4.min.css" rel="stylesheet" type="text/css" />

        <!-- Responsive datatable examples -->
        <link href="assets/libs/datatables.net-responsive-bs4/css/responsive.bootstrap4.min.css" rel="stylesheet" type="text/css" /> 

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
</head>
<body data-sidebar="dark">
	<div id="layout-wrapper">
		<!-- header 시작 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <!-- header 끝 -->


		<!-- sidebar 시작 -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />				
		<!-- sidebar 끝 -->		
<style>
  /* 기본 스타일링 */
  .row { display: flex; flex-direction: row; }
  .column { display: flex; flex-direction: column; }
  .center { display: flex; align-items: center; justify-content: center; text-align: center; }

  /* 색상 설정 */
  .bgc-fff { background-color: #fff; }
  .bgc-F8FCFF { background-color: #F8FCFF; }

  /* 게시판 헤더 */
  .head-nav { height: 56px; display: flex; align-items: center; padding-left: 30px; }
  .head-nav ul li { margin: 0px 5px; }
  
  .title-container {
    padding: 20px 0;
    font-size: 24px;
    border-bottom: 1px solid #eee;
    margin-bottom: 20px;
}

 /* 공지사항 제목 */
#boardTitle {width: 70%;padding: 10px;margin-bottom: 20px;border-radius:0px; border-style:none; border-bottom: 1px solid #eee;font-size: 32px;}
  /* 버튼스타일 */
  button{cursor: pointer; }
  .btnContainer{display: flex;justify-content: space-evenly;}
  .btnSimple{border: solid 1px #e0e0e0;background-color:#fff; }
  
  /* 첨부파일 스타일 */
  .file-upload { border: 1px solid #e0e0e0; padding: 10px; margin-bottom: 20px; border-radius: 4px; display: flex; align-items: center;}
  .file-upload input[type="file"] { display: none; }
  .file-upload label { cursor: pointer; background-color: #e0e0e0; padding: 8px 20px; border-radius: 4px;  font-size: 12px;}
  /* 첨부된 파일 목록 스타일 */
  .file-item {display: inline-block;background-color: #f2f2f2;padding: 5px;margin: 5px;border-radius: 4px;font-size: 8px;}
  /* 파일 제거 버튼 스타일 */
  .remove-file {margin-left: 5px;color: red;cursor: pointer;}
  
</style>
<section class="max1920px">
	<jsp:include page="/WEB-INF/views/common/side-nav.jsp" />
	<div class="main-section bgc-F8FCFF">		
        <div class="section-shadow bgc-fff head-nav">
            <ul class="row">
                <li>게시판</li>
                <li>|</li>
                <li>${loginMember.dept.deptName } 게시판</li>
            </ul>
        </div>
		<form action="" method="post" enctype="multipart/form-data">
			<div class="section-shadow bgc-fff" style="padding: 20px">
			    <input type="text" value="" id="boardTitle" placeholder="제목" required/>
				<div>
					<jsp:include page="/WEB-INF/views/smarteditor/newPost.jsp" />
				</div>
				<div class="file-upload">
				    <label for="file">첨부파일 선택</label>
				    <input type="file" id="file" name="file" multiple>
				    <span class="file-list" id="file-name"><p class="file-item">선택된 첨부파일이 표시됩니다.</p></span>
				</div>
			    <div style="text-align: right;">
				    <button type="button" onclick="insertContent();">등록</button>
				    <button type="button" onclick="cancle();" class="btnSimple">취소</button>
			    </div>
			</div>
		</form>
	</div>
</section>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script type="text/javascript">
var selectedFiles = [];
$(document).ready(function() {
    // 파일명 표시 및 제거 버튼 추가
    $(".file-upload input[type='file']").change(function() {
        var fileList = $(".file-list");
        fileList.empty();  // 기존 목록 초기화

        Array.from(this.files).forEach(function(file) {
            var fileName = file.name;
            var fileItem = $('<span class="file-item">' + fileName + ' <span class="remove-file">x</span></span>');          
            fileItem.find(".remove-file").click(function() {
                var index = selectedFiles.indexOf(file);  // 해당 파일의 인덱스 찾기
                if (index > -1) {
                    selectedFiles.splice(index, 1);  // 배열에서 해당 파일 제거
                }
                $(this).parent().remove();
            });
            fileList.append(fileItem);
         	//selectedFiles 배열에 선택한 파일 추가
            selectedFiles.push(file);
        });
    });

});

function insertContent() {
    oEditors.getById["editorTxt"].exec("UPDATE_CONTENTS_FIELD", []);
    
    var formData = new FormData();
    formData.append("content", $("#editorTxt").val());
    formData.append("title", $("#boardTitle").val());

    $.each(selectedFiles, function(i, file) {
        formData.append("file", file);
    });

    $.ajax({
        url: "${path}/board/insertBoardEnd",
        type: "POST",
        data: formData,
        contentType: false,
        processData: false,
        success: function(response) {
            if(response.status === "success") {
                alert("게시글이 성공적으로 등록되었습니다.");
                location.href = "${path}/board/boardList";
            } else {
                alert("게시글 등록에 실패하였습니다.");
            }
        }
    });
}
	function cancle(){
		if(confirm('게시글 작성을 취소하시겠습니까?')){
			location.href = "${path}/post/postList";
		}
	}

</script>

</body>
</html>