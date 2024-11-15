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
            font-size : 25px;
        }
        .btn-form {
            margin-top : 100px;
            margin-left : 275px;
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
            margin: 15% auto;
            padding: 20px;
            width: 70%;
            max-width: 800px;
            position: relative;
        }
        
				.modal-body {
				    display: flex;
				    gap: 20px;
				}
        
				#orgTree {
				    height: 400px;
				    overflow: auto;
				}
        
				#orgTree, #selectedApprovers {
				    flex: 1;
				    min-width: 250px;
				}
        
        #approversList {
            list-style: none;
            padding: 0;
        }
        
        #approversList li {
            padding: 8px;
            margin: 5px 0;
            background: #f8f9fa;
            border: 1px solid #ddd;
            border-radius: 4px;
            display: flex;
            justify-content: space-between;
            align-items: center;
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
    
    <div class="btn-form">
        <div class="draft-title">업무 기안</div> <br>
        <button type="button" class="btn btn-primary" onclick="ApprovalModal.show()">결재선</button> &nbsp;
        <button type="button" class="btn btn-success" onclick="ApprovalModal.submitForm()">결재요청</button> &nbsp;
        <button type="button" class="btn btn-secondary" onclick="history.back()">취소</button>
    </div>

		<!-- 결재선 모달 -->
		<div id="approvalModal" class="modal">
		    <div class="modal-content">
		        <h3>결재선 지정</h3>
		        <div class="modal-body">
		            <div>
		                <h5>조직도</h5>
		                <div id="orgTree"></div>
		            </div>
		            <div id="selectedApprovers">
		                <h5>결재선</h5>
		                <ul id="approversList"></ul>
		            </div>
		        </div>
		        <div class="text-center mt-3">
		            <button type="button" class="btn btn-primary" onclick="ApprovalModal.save()">확인</button>
		            <button type="button" class="btn btn-secondary" onclick="ApprovalModal.hide()">취소</button>
		        </div>
		    </div>
		</div>
		
		<!-- 결재선 선택 정보를 저장할 hidden input -->
		<input type="hidden" id="approvalLine" name="approvalLine">
		
    <!-- 문서 양식 -->
    <c:choose>
        <c:when test="${param.formType eq 'purchase'}">
            <jsp:include page="/WEB-INF/views/approval/purchaseDraft.jsp"/>
        </c:when>
        <c:otherwise>
            <jsp:include page="/WEB-INF/views/approval/simpleDraft.jsp"/>
        </c:otherwise>
    </c:choose>

    <!-- jstree 라이브러리 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jstree/3.2.1/jstree.min.js"></script>
    
    <!-- approval-write.js를 모듈 패턴으로 수정 -->
    <script>
        // 모듈 패턴으로 전역 네임스페이스 오염 방지
        const ApprovalModal = {
            init: function() {
                this.initTree();
                this.bindEvents();
            },
            
            initTree: function() {
                $('#orgTree').jstree({
                    'core': {
                        'data': {
                            'url': `${contextPath}/tree/org`,  // URL 경로
                            'dataType': 'json',
                            'type': 'GET'
                        },
                        'themes': {
                            'responsive': false
                        }
                    },
                    'plugins': ['types'],
                    'types': {
                        'default': { 'icon': 'fas fa-folder' },
                        'user': { 'icon': 'fas fa-user' },
                        'department': { 'icon': 'fas fa-building' }
                    }
                });
            },
            
            bindEvents: function() {
                $('#orgTree').on('select_node.jstree', (e, data) => {
                    if(data.node.type === 'user') {
                        // 사용자 노드의 원본 데이터에서 필요한 정보 추출
                        const userData = data.node.original; // 서버에서 받은 원본 데이터
                        this.addApprover(
                            userData.id,         // userNo
                            userData.userName,   // 이름
                            userData.rankName,   // 직급
                            userData.deptName    // 부서
                        );
                    }
                });
            },
            
            show: function() {
                $('#approvalModal').show();
            },
            
            hide: function() {
                $('#approvalModal').hide();
            },
            
            addApprover: function(userId, userName, rankName, deptName) {
                // 이미 추가된 결재자인지 확인
                if($(`#approversList li[data-user-id="${userId}"]`).length > 0) {
                    alert('이미 추가된 결재자입니다.');
                    return;
                }
                
                // 결재자 수 제한 (예: 4명)
                if($('#approversList li').length >= 4) {
                    alert('결재선은 최대 4명까지만 지정할 수 있습니다.');
                    return;
                }

                const approverHtml = `
                    <li data-user-id="${userId}" data-rank="${rankName}" data-dept="${deptName}">
                        <div class="d-flex justify-content-between align-items-center">
                            <span>${deptName} ${userName} ${rankName}</span>
                            <button type="button" class="btn btn-sm btn-danger" 
                                onclick="ApprovalModal.removeApprover('${userId}')">삭제</button>
                        </div>
                    </li>
                `;
                
                $('#approversList').append(approverHtml);
            },

            removeApprover: function(userId) {
                $(`#approversList li[data-user-id="${userId}"]`).remove();
            },

            save: function() {
                const approvers = [];
                $('#approversList li').each(function(index) {
                    approvers.push({
                        userNo: $(this).data('user-id'),
                        userName: $(this).find('span').text(),
                        lineOrder: index + 1  // 순서 정보 추가
                    });
                });

                if(approvers.length === 0) {
                    alert('결재자를 한 명 이상 선택해주세요.');
                    return;
                }

                // hidden input에 결재선 정보 저장
                $('#approvalLine').val(JSON.stringify(approvers));
                
                this.hide();
            },
            
            submitForm: function() {
                if(confirm('결재를 요청하시겠습니까?')) {
                    // 결재 요청 처리
                    document.getElementById('approvalForm').submit();
                }
            }
        };

        // DOM 로드 완료 후 초기화
        $(document).ready(function() {
            ApprovalModal.init();
        });
    </script>
</body>
</html>