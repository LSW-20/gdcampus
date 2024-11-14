// approval-write.js

// DOM이 준비되면 실행
$(document).ready(function() {
    initOrgTree();
});

// 모달 제어 함수들
window.showApprovalModal = function() {
    $('#approvalModal').show();
};

window.closeModal = function() {
    $('#approvalModal').hide();
};

// 조직도 트리 초기화
function initOrgTree() {
    $('#orgTree').jstree({
        'core': {
            'data': [
                { 
                    "id": "dept1",
                    "text": "인사부",
                    "type": "department",
                    "children": [
                        { "id": "user1", "text": "김인사", "type": "user" },
                        { "id": "user2", "text": "이인사", "type": "user" }
                    ]
                },
                {
                    "id": "dept2",
                    "text": "총무부",
                    "type": "department",
                    "children": [
                        { "id": "user3", "text": "박총무", "type": "user" },
                        { "id": "user4", "text": "최총무", "type": "user" }
                    ]
                }
            ],
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
    }).on('select_node.jstree', function(e, data) {
        if(data.node.type === 'user') {
            addApprover(data.node.id, data.node.text);
        }
    });
}

// 결재자 추가 함수
window.addApprover = function(userId, userName) {
    // 이미 추가된 결재자인지 확인
    if($('#approversList li[data-user-id="' + userId + '"]').length > 0) {
        alert('이미 추가된 결재자입니다.');
        return;
    }

    var approverHtml = 
        '<li data-user-id="' + userId + '">' +
            userName +
            ' <button type="button" class="btn-remove" onclick="removeApprover(this.parentElement)">×</button>' +
        '</li>';
    
    $('#approversList').append(approverHtml);
};

// 결재자 제거 함수
window.removeApprover = function(element) {
    $(element).remove();
};

// 결재선 저장
window.saveApprovalLine = function() {
    var approvers = [];
    $('#approversList li').each(function() {
        approvers.push({
            userId: $(this).data('user-id'),
            userName: $(this).contents().filter(function() {
                return this.nodeType === 3;
            }).text().trim()
        });
    });

    if(approvers.length === 0) {
        alert('결재자를 한 명 이상 선택해주세요.');
        return;
    }

    // 여기서 결재선 정보를 서버에 저장하거나 처리할 수 있습니다.
    console.log('선택된 결재자들:', approvers);
    
    closeModal();
};

// 결재 요청 함수
window.submitApproval = function() {
    if(confirm('결재를 요청하시겠습니까?')) {
        // 결재 요청 처리 로직
        document.getElementById('approvalForm').submit();
    }
};