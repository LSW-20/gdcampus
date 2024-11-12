<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>구디캠퍼스 메인</title>
	
<style>
    .chat{width:400px; margin:auto; padding:10px; border:1px solid lightgray;}
    .chat-area{height:500px; overflow: auto;}

     .chat-message{margin:10px 0px;}
     .chat-message.mine{display: flex; justify-content:flex-end;}
     
    .chat-message .send-message{
       padding: 5px 7px;
       border-radius: 10px;
       max-width: 190px;
       font-size:0.9em;
       white-space: pre-line;
    }
    .chat-message.other .send-message{background: lightgray;}
    .chat-message.mine .send-message{background: #FFE08C;}
 
    .chat-user {
       text-align:center;
       border-radius:10px;  
       background: lightgray;
       opacity: 0.5;
       margin: 20px 0px;
       color: black;
       line-height: 30px;
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
						<div class="container-fluid">

				      <div class="container border p-5 m-4 rounded">
				        <h2 class="m-4">채팅방</h2>
				       
				        <div class="chat">
				   
				          <div class="chat-area">
				         
				            <div class="chat-message mine">
				              <div class="send-message">내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지내가보낸 메세지</div>
				            </div>  
				           
				            <div class="chat-message other">
				              <span class="send-user">상대방</span>
				              <div class="send-message">남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지남이보낸 메세지</div>
				            </div>
				           
				            <div class="chat-user entry">
				              xxx님이 들어왔습니다.
				            </div>
				           
				            <div class="chat-user exit">
				              xxx님이 나갔습니다.
				            </div>        
				           
				          </div>
				         
				          <div class="input-area">
				         
				            <div class="form-group">
				                <textarea class="form-control" rows="3" id="message" style="resize:none"></textarea>
				            </div>
				           
				            <button type="button" class="btn btn-sm btn-secondary btn-block">전송하기</button>
				            <button type="button" class="btn btn-sm btn-danger btn-block">퇴장하기</button>
				           
				          </div>  
				         
				        </div>
				      </div>
				      
						</div>
				</div>
		</div>            
		<!-- main-content 끝 -->




	</div>
	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->



</body>
</html>