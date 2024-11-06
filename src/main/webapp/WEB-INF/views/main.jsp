<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

  <div class="container p-3">

    <!-- Header, Nav start -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <!-- Header, Nav end -->


    <!-- Section start -->
    <section class="row m-3" style="min-height: 500px">

      <div class="container border p-5 m-4 rounded">
        <h2 class="m-4">구디캠퍼스 프로젝트</h2>
        
      	<p>메인페이지가 잘 뜨는지 확인용입니다</p>
      
      </div>

    </section>
    <!-- Section end -->
     

    <!-- Footer start -->
		<jsp:include page="/WEB-INF/views/common/footer.jsp" />
    <!-- Footer end -->

  </div>
  
</body>
</html>