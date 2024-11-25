// DOM이 준비되면 실행
$(document).ready(function() {
	ApprovalModal.init();
});

// 모듈 패턴으로 전역 네임스페이스 오염 방지
const ApprovalModal = {
	init: function() {
		this.initTree();
		this.bindEvents();
		
		// 수정 모드인 경우 기존 결재선 복원
		if(typeof initialApprovers !== 'undefined' && initialApprovers.length > 0) {
		    initialApprovers.forEach(approver => {
		        this.addApprover(
		            approver.userNo,
		            approver.userName,
		            approver.rankName,
		            approver.deptName
		        );
		    });
		}		
	},

	// 조직도 트리 초기화
	initTree: function() {
		$('#orgTree').jstree({
			'core': {
				'data': {
					'url': `${contextPath}/tree/org`,
					'dataType': 'json'
				},
				'themes': {
					'responsive': false
				},
				'check_callback': true,  // 노드 조작 허용
				'multiple': false,       // 다중 선택 비활성화
				'animation': 0          // 애니메이션 비활성화
			},
			'types': {
				'department': {
					'icon': 'fas fa-building'
				},
				'user': {
					'icon': 'fas fa-user'
				}
			},
			'plugins': ['types'],
			'strings': {
				'Loading ...': '로딩중...'
			},
			'themes': {
				'name': 'default',
				'responsive': true,
				'dots': false,          // 점선 숨기기
				'icons': true           // 아이콘 표시
			}
		}).on('loaded.jstree', function() {
			console.log('Tree loaded successfully');  // 트리 로드 완료 확인
		}).on('select_node.jstree', function(e, data) {
			console.log('Node selected:', data);     // 노드 선택 이벤트 확인
		});
	},

	// 이벤트 바인딩
	bindEvents: function() {
		$('#orgTree').on('select_node.jstree', (e, data) => {
			console.log('Selected node:', data.node);

			if (data.node.type === 'user') {
				const userData = data.node.data;
				console.log('User data:', userData);

				if (userData) {
					// userNo를 문자열로 확실하게 처리
					this.addApprover(
						String(userData.userNo),
						String(userData.userName),
						String(userData.rankName),
						String(userData.deptName)
					);
				}
			}
		});
	},

	// 모달 표시
	show: function() {
		document.getElementById('approvalModal').style.display = 'block';
	},

	// 모달 숨김
	hide: function() {
		document.getElementById('approvalModal').style.display = 'none';
	},

	// 결재자 추가
	addApprover: function(userNo, userName, rankName, deptName) {
		console.log('approval-write 결재가추가:', { userNo, userName, rankName, deptName });

		let isDuplicate = false;

		// 이미 추가된 결재자 체크
		const existingApprover = document.querySelector(`#approversList li[data-user-id='${userNo}']`);
		if (existingApprover) {
			alert('이미 추가된 결재자입니다.');
			return;
		} else {

		}

		// 결재자 수 제한
		if (document.querySelectorAll('#approversList li').length >= 3) {
			alert('결재선은 최대 3명까지만 지정할 수 있습니다.');
			return;
		}

		// 결재자 HTML 생성
		const li = document.createElement('li');
		li.setAttribute('data-user-id', userNo);
		li.setAttribute('data-rank', rankName);
		li.setAttribute('data-dept', deptName);

		li.innerHTML = `
            <div class="d-flex justify-content-between align-items-center">
                <span>[${deptName}] ${userName} ${rankName}</span>
                <button type="button" class="btn btn-sm btn-danger" 
                    onclick="ApprovalModal.removeApprover('${userNo}')">삭제</button>
            </div>
        `;

		// 결재선에 추가
		document.querySelector('#approversList').appendChild(li);

		// 결재자 수 업데이트
		this.updateApproverCount();

		//console
		console.log('Trying to add:', { userNo, userName, rankName, deptName });


	},

	// 결재자 제거
	removeApprover: function(userNo) {
		const approver = document.querySelector(`#approversList li[data-user-id='${userNo}']`);
		if (approver) {
			approver.remove();
			this.updateApproverCount();
		}
	},

	// 결재자 수 업데이트
	updateApproverCount: function() {
		const count = document.querySelectorAll('#approversList li').length;
		const countElement = document.querySelector('#approverCount');
		if (countElement) {
			countElement.textContent = count;
		}
	},

	// 결재선 저장
	save: function() {
		const approversList = document.querySelectorAll('#approversList li');
		const approvers = Array.from(approversList).map((li, index) => ({
			userNo: li.getAttribute('data-user-id'),
			userName: li.querySelector('span').textContent.split(']')[1].trim().split(' ')[0],
			rankName: li.getAttribute('data-rank'),
			deptName: li.getAttribute('data-dept'),
			lineOrder: index + 1
		}));

		if (approvers.length === 0) {
			alert('결재자를 한 명 이상 선택해주세요.');
			return;
		}

		// hidden input에 저장
		document.getElementById('approvalLine').value = JSON.stringify(approvers);

		// 결재선 테이블 컨테이너 초기화
		const container = document.getElementById('approvalTablesContainer');
		container.innerHTML = '';		
		
		//각 결재자 별로 테이블 생성
		approvers.forEach((approver,index) =>{
			const table = document.createElement('table');
			table.className = 'approvalLineTable';
			
			table.innerHTML= `
				<tr class="approvalHeader">
					<th width="100%">${index+1}차결재</th>
					<input type="hidden" name="approvers[${index}].userNo" value="${approver.userNo}">
					<input type="hidden" name="approvers[${index}].lineOrder" value="${index+1}">
					<input type="hidden" name="approvers[${index}].createUser" value=${approver.userNo}					
				</tr>
				<tr class="approvalStamp">
				    <td>
				        <div class="stamp pending">대기</div>
				        ${approver.userName} ${approver.rankName}
				    </td>
				</tr>
				<tr class="approvalDate">
				    <td></td>
				</tr>				
			`;
			container.appendChild(table);
		});
		
		this.hide();
		console.log('저장된 결재선:', approvers);
	},

	// 필수값 체크
	checkRequiredFields: function() {
	    const apprType = document.querySelector('input[name="apprType"]').value;
	    
	    // 공통 필수값 체크
	    if(!document.querySelector('#approvalLine').value) {
	        alert('결재선을 지정해주세요.');
	        return false;
	    }

	    // 문서 타입별 필수값 체크
	    if(apprType === '품의서') {
	        if(!document.querySelector('input[name="purchDept"]').value) {
	            alert('담당부서를 입력해주세요.');
	            return false;
	        }
	        if(!document.querySelector('input[name="purchEmpName"]').value) {
	            alert('납품자를 입력해주세요.');
	            return false;
	        }
	        if(!document.querySelector('input[name="purchPurpose"]').value) {
	            alert('사용목적을 입력해주세요.');
	            return false;
	        }
	        if(!document.querySelector('input[name="purchDeadline"]').value) {
	            alert('희망납기일을 선택해주세요.');
	            return false;
	        }
	        if(document.querySelector('#totalAmount').textContent === '0') {
	            alert('구매 물품을 입력해주세요.');
	            return false;
	        }
	    } else if(apprType === '기안서') {
	        if(!document.querySelector('input[name="enforceDate"]').value) {
	            alert('시행일자를 선택해주세요.');
	            return false;
	        }
	        if(!document.querySelector('input[name="coopDept"]').value) {
	            alert('협조부서를 입력해주세요.');
	            return false;
	        }
	        if(!document.querySelector('input[name="apprTitle"]').value) {
	            alert('제목을 입력해주세요.');
	            return false;
	        }
	    } else if(apprType !== '기안서' && apprType!=='품의서'){
					if(!document.querySelector('input[name="apprTitle"]').value) {
					    alert('제목을 입력해주세요.');
					    return false;
					}
			}

	    return true;
	},	
	
	
	// 결재 요청 제출
	submitForm: function() {
		    if(this.checkRequiredFields()) {
		        if (confirm('결재를 요청하시겠습니까?')) {
		            document.getElementById('approvalForm').submit();
		        }
		    }
		}
};




/*-----------------------------*/


