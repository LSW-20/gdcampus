<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
<meta charset="utf-8" />
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>인사관리</title>
<style type="text/css">
.main-content {
	min-height: 900px;
}

.page-content {
	margin: auto;
	width: 75%;
}

.card-body {
	height: 500px;
}
</style>
</head>


<body data-topbar="dark" data-sidebar="dark">
	<!-- body 태그에 data-topbar="dark"를 주면 헤더 다크모드. 없으면 라이트 모드. -->
	<!-- body 태그에 data-sidebar="dark"를 주면 사이드바 다크모드. 없애면 라이트 모드. -->



	<!-- 전체 영역(헤더, 사이드바, 내용) 시작 -->
	<div id="layout-wrapper">


		<!-- header 시작 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
		<!-- header 끝 -->


		<!-- sidebar 시작 -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />
		<!-- sidebar 끝 -->



		<!-- main-content 시작 -->
		<div class="main-content">
			<div class="page-content">

				<div class="col-lg-12">
					<div class="mt-4">
						<h5 class=" mb-4">
							<i class="mdi mdi-arrow-right text-primary mr-1"></i> 상세정보
						</h5>
						
						<div class="mt-4 row d-flex justify-content-end">
							<button type="button" class="btn btn-primary w-md" onclick="fn_resetPwd()" ${not empty user.leaveDate ? 'style="display:none"': '' }>비밀번호 초기화</button>
						</div>
						
						<form action="${contextPath}/user/staff/update.do" method="post">
						<input type="hidden" name="userNo" value="${user.userNo}">
						<br><hr>	
							<div class="row mt-5">
								<div class="col-md-6">
									<div class="form-group">
										<label for="formrow-firstname-input">아이디</label> <span style="font-size: 10px">(수정불가)</span>
										<input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>성별</label>
										<div class="d-flex">
											<div class="custom-control custom-radio mr-3">
												<input type="radio" id="M" name="gender" class="custom-control-input" value="M" ${user.gender == 'M' ? 'checked' : ''}> 
												<label class="custom-control-label" for="M">남</label>
											</div>
											<div class="custom-control custom-radio">
												<input type="radio" id="F" name="gender" class="custom-control-input" value="F" ${user.gender == 'F' ? 'checked' : ''}> 
												<label class="custom-control-label" for="F">여</label>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label for="email">이메일</label> 
										<input type="email" class="form-control" id="email" name="email" value="${user.email}"
										${not empty user.leaveDate ? 'readonly': '' }>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label for="userName">사원명</label> 
										<input type="text" class="form-control" id="userName" name="userName" value="${user.userName }"
										${not empty user.leaveDate ? 'readonly': '' }>
									</div>
								</div>
							</div>
							
							<div class="row">
								<div class="col-md-6">
									<div class="form-group">
										<label>부서</label>
										
										<select class="custom-select" name="deptNo" id="deptNo">
											<c:forEach var="category" items="${deptList}">
                								<option value="${category.deptNo}" ${category.deptNo == user.deptNo ? 'selected' : ''}>
                    								${category.deptName}
                								</option>
            								</c:forEach>
										</select>
									</div>
								</div>
								<div class="col-md-6">
									<div class="form-group">
										<label>직급</label>
										<select class="custom-select" name="rankNo" id="rankNo">
											<c:forEach var="category" items="${rankList}">
                								<option value="${category.rankNo}" ${category.rankNo == user.rankNo ? 'selected' : ''}>
                    								${category.rankName}
                								</option>
            								</c:forEach>
										</select>
									</div>
								</div>
							</div>
							<br><hr>
							<div class="row">
								<div class="col-md-6">
									입사일 : ${user.hireDate}
								</div>
								<div class="col-md-6">
								<c:if test="${not empty user.leaveDate}">
									<p class="m-0 p-0" style="color: red;">퇴사일 : ${user.leaveDate}</p>
								</c:if>
								</div>
							</div>
							<hr><br>		
							<div class="mt-4 row d-flex justify-content-center">
								<button type="submit" class="btn btn-primary w-md mr-3" ${not empty user.leaveDate ? 'style="display:none"': '' }>저장</button>
								<a class="btn btn-primary w-md mr-3" href="${contextPath }/user/staff/list.do">목록</a>
							</div>
						</form>
					</div>
				</div>

			</div>
		</div>
		<!-- main-content 끝 -->
		<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script>
		function fn_resetPwd(){
  			$.ajax({
  				url: '${contextPath}/user/resetPwd.do',
  				type: 'post',
  				data: {
  					userNo: '${user.userNo}'
  				},
  				success: function(res){
  					if(res == "SUCCESS"){
  						alert("사원의 비밀번호가 정상적으로 초기화되었습니다.");
  					}else{
  						alert("비밀번호 초기화에 실패하였습니다.");
  					}
  				}
  			})
  		}
		</script>

	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->



</body>
</html>