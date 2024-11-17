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
        .btn-form {
            margin-top: 100px;
            margin-left: 275px;
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
    
    <form id="approvalForm" action="${contextPath}/approval/regist" method="post">
        <div class="main-content">
            <div class="page-content">
                <div class="container-fluid">
                    <div class="form-container">
                        <div class="approval-header">
                            <div class="btn-form">
                                <div class="draft-title">업무 기안</div> <br>
                                <button type="button" class="btn btn-primary" onclick="ApprovalModal.show()">결재선</button> &nbsp;
                                <button type="button" class="btn btn-success" onclick="ApprovalModal.submitForm()">결재요청</button> &nbsp;
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
		                <h5>결재선 (<span id="approverCount">0</span>/4)</h5>
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
                            'url': `${contextPath}/tree/org`,
                            'dataType': 'json'
                        },
                        'themes': {
                            'responsive': false
                        }
                    },
                    'types': {
                        'department': {
                            'icon': 'fas fa-building'
                        },
                        'user': {
                            'icon': 'fas fa-user'
                        }
                    },
                    'plugins': ['types']
                });
            },
            
            bindEvents: function() {
                $('#orgTree').on('select_node.jstree', (e, data) => {
                    console.log('선택된노드:', data.node);  // 디버깅용
                    
                    if(data.node.type === 'user') {
                        const userData = data.node.data;
                        console.log('사원정보:', userData);  // 디버깅용
                        
                        if(userData) {
                            this.addApprover(
                                userData.userNo,
                                userData.userName,
                                userData.rankName,
                                userData.deptName
                            );
                        } else {
                            console.error('유저정보없음');
                        }
                    }
                });
            },
            
            show: function() {
                $('#approvalModal').show();
            },
            
            hide: function() {
                $('#approvalModal').hide();
            },
            
            addApprover: function(userNo, userName, rankName, deptName) {
                console.log('Trying to add:', { userNo, userName, rankName, deptName });

                // 중복 체크
                const existingApprovers = $('#approversList li');
                let isDuplicate = false;

                existingApprovers.each(function() {
                    if($(this).attr('data-user-id') === userNo) {
                        isDuplicate = true;
                        return false; // each 루프 중단
                    }
                });

                if(isDuplicate) {
                    alert('이미 추가된 결재자입니다.');
                    return;
                }

                // 결재자 수 제한
                if(existingApprovers.length >= 4) {
                    alert('결재선은 최대 4명까지만 지정할 수 있습니다.');
                    return;
                }

                // Template literal 사용하여 모든 값이 제대로 들어가는지 확인
                const approverHtml = 
                    <li data-user-id=${userNo} data-rank="${rankName}" data-dept="${deptName}">
                        <div class="d-flex justify-content-between align-items-center">
                            <span>[${deptName}] ${userName} ${rankName}</span>
                            <button type="button" class="btn btn-sm btn-danger" 
                                onclick="ApprovalModal.removeApprover('${userNo}')">삭제</button>
                        </div>
                    </li>
                ;

                console.log('Generated HTML:', approverHtml); // 생성된 HTML 확인
                
                $('#approversList').append(approverHtml);
                
                // 추가 후 확인
                const addedItem = $(`#approversList li[data-user-id="${userNo}"]`);
                console.log('Added item exists:', addedItem.length > 0);
                console.log('Added item data:', {
                    userNo: addedItem.attr('data-user-id'),
                    rankName: addedItem.attr('data-rank'),
                    deptName: addedItem.attr('data-dept')
                });
            },

            removeApprover: function(userNo) {
                console.log('Removing approver:', userNo);
                $(`#approversList li[data-user-id="${userNo}"]`).remove();
            },
            
            save: function() {
                const approvers = [];
                $('#approversList li').each(function(index) {
                    const $li = $(this);
                    approvers.push({
                        userNo: $li.data('user-id'),
                        userName: $li.find('span').text().split(']')[1].trim().split(' ')[0],
                        rankName: $li.data('rank'),
                        deptName: $li.data('dept'),
                        lineOrder: index + 1
                    });
                });

                if(approvers.length === 0) {
                    alert('결재자를 한 명 이상 선택해주세요.');
                    return;
                }

                $('#approvalLine').val(JSON.stringify(approvers));
                this.hide();
            },
            
            submitForm: function() {
                if(!$('#approvalLine').val()) {
                    alert('결재선을 지정해주세요.');
                    return;
                }

                if(confirm('결재를 요청하시겠습니까?')) {
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