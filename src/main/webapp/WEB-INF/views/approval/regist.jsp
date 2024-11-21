<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>결재 작성폼</title>
    
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
            height: 1200px;
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
    
    <form id="approvalForm" action="${contextPath}/approval/insert" method="post">
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <div class="form-container">
                        <div class="approval-header">
                            <div class="btn-form">
                                <div class="draft-title">업무 기안</div> <br>
                                <button type="button" class="btn btn-primary" onclick="ApprovalModal.show()">결재선</button> &nbsp;
        												<button type="button" class="btn btn-success" onclick="ApprovalModal.submitForm()">결재요청</button>
                                <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
                            </div>
                        </div>

                        <!-- 결재선 정보 -->
                        <input type="hidden" id="approvalLine" name="approvalLine">
                        
                        <!-- 문서 양식 -->
                        <div class="approval-content">
                            <c:choose>
                                <c:when test="${param.formType eq 'purchase'}">
                                    <jsp:include page="/WEB-INF/views/approval/purchaseDraft.jsp"/>
                                </c:when>
                                <c:otherwise>
                                    <jsp:include page="/WEB-INF/views/approval/simpleDraft.jsp"/>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <!-- 결재선 모달 -->
		<div id="approvalModal" class="modal">
		    <div class="modal-content">
		        <h3>결재선 지정</h3>
		        <div class="modal-body">
		            <div class="org-tree-container">
		                <h5>조직도</h5>
		                <div id="orgTree"></div>
		            </div>
		            <div id="selectedApprovers">
		                <h5>결재선 (<span id="approverCount">0</span>/3)</h5>
		                <ul id="approversList"></ul>
		            </div>
		        </div>
		        <div class="text-center mt-3">
		            <button type="button" class="btn btn-primary" onclick="ApprovalModal.save()">확인</button>
		            <button type="button" class="btn btn-secondary" onclick="ApprovalModal.hide()">취소</button>
		        </div>
		    </div>
		</div>

    <!-- jstree 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    
    <script>
        const contextPath = "${contextPath}";
    </script>
    <script src="${contextPath}/js/approval-write.js"></script>
</body>
</html>