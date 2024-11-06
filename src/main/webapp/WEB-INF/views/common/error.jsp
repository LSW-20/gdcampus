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
            <div align="center">	
                <img src="https://cdn2.iconfinder.com/data/icons/oops-404-error/64/208_balloon-bubble-chat-conversation-sorry-speech-512.png" width="300">
                <br><br>
                <h1 style="font-weight:bold">에러메세지</h1>
            </div>
          </div>
    
        </section>
        <!-- Section end -->
    
        <!-- Footer start -->
        <jsp:include page="/WEB-INF/views/common/footer.jsp" />
        <!-- Footer end -->
    
    </div>


</body>
</html>