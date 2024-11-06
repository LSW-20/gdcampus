<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    

<!-- Bootstrap 사용을 위한 CDN -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"></script>
<!-- ------------------------- -->

<style>
	header{height: 50px}
	header a{color:black;}
	header .profile-img{width:30px;}
		
	    .page-link {
	        color: #6c757d; 
	        background-color: #fff;
	        border: 1px solid #ccc; 
	    }
	    .page-item.active .page-link {
	        z-index: 1;
	        color: #555;
	        font-weight:bold;
	        background-color: #f1f1f1;
	        border-color: #ccc;
	    }
	    .page-link:focus, .page-link:hover {
	        color: #000;
	        background-color: #fafafa; 
	        border-color: #ccc;
	    }
</style>

<script>
	if('${alertMsg}' != ''){
		alert('${alertMsg}');
		if('${historyBackYN}' == 'Y'){
			history.back();
		}
	}
</script>



<header class="row m-3">
	<div class="col-3 d-flex justify-content-center align-items-center">
	    <!-- <a href="${contextPath}"><img src="${ contextPath }/resources/images/goodee_logo.png" width="100px"></a> -->
			<a href="${contextPath == '' ? '/' : contextPath}"><img src="${ contextPath }/resources/images/goodee_logo.png" width="100px"></a>
			<!-- <a href="${contextPath == '' ? '/' : contextPath}"><img src="${contextPath}/images/goodee_logo.png" width="100px"></a> -->
	</div>
	<div class="col-5"></div>
	<div class="col-4 d-flex justify-content-center align-items-center">
	
		
		<c:choose>
			<c:when test="${ empty loginUser }">
		    <!-- case1. 로그인전 --> 
		    <a href="${contextPath}/member/signup.do">회원가입</a> &nbsp;|&nbsp;
		    <a href="#" data-toggle="modal" data-target="#loginModal">로그인</a> 
	    </c:when>
	    
	    <c:otherwise>
		    <!-- case2. 로그인후 -->
		    <div>
		    <img class="profile-img" src="${ contextPath }<c:out value='${loginUser.profileURL}' default='/resources/images/defaultProfile.png' />">&nbsp;
		    <a href="${contextPath}/member/myinfo.do">${loginUser.userName}님</a> &nbsp;|&nbsp;
		    <a href="${contextPath}/member/signout.do">로그아웃</a>
		    </div>
	    </c:otherwise>
	  </c:choose>  
	
	</div>
</header>
<nav class="navbar m-3 navbar-expand-sm bg-dark navbar-dark d-flex justify-content-center">
<ul class="navbar-nav">
    <li class="nav-item">
    <!-- <a class="nav-link" href="${contextPath}">Home</a> -->
		<a class="nav-link" href="${contextPath == '' ? '/' : contextPath}">Home</a>
		
    </li>
    <li class="nav-item">
    <a class="nav-link" href="${contextPath}/notice/list.do">공지사항</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="${contextPath}/board/list.do">일반게시판</a>
    </li>
    <li class="nav-item">
    <a class="nav-link" href="#">사진게시판</a>
    </li>
</ul>
</nav>

<!-- 로그인 클릭 시 뜨는 모달 (기존에는 안보이다가 위의 a 클릭시 보임) -->
<div class="modal fade" id="loginModal">
    <div class="modal-dialog modal-sm">
        <div class="modal-content">
        <!-- Modal Header -->
        <div class="modal-header">
            <h4 class="modal-title">Login</h4>
            <button type="button" class="close" data-dismiss="modal">&times;</button> 
        </div>

        <form action="${contextPath}/member/signin.do" method="post">
            <!-- Modal Body -->
            <div class="modal-body">
                <label for="userId" class="mr-sm-2">ID :</label>
                <input type="text" class="form-control mb-2 mr-sm-2" placeholder="Enter ID" id="userId" name="userId" required> <br>
                <label for="userPwd" class="mr-sm-2">Password:</label>
                <input type="password" class="form-control mb-2 mr-sm-2" placeholder="Enter password" id="userPwd" name="userPwd" required>
            </div>
            
            <!-- Modal footer -->
            <div class="modal-footer">
                <button type="submit" class="btn btn-primary">로그인</button>
                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
            </div>
        </form>
        </div>
    </div>
</div>