<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<!doctype html>
<html>
<head>
	<meta charset="utf-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
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

							<br><br>

               <div class="d-lg-flex mb-4">
               
               		 <!-- 왼쪽 채팅방 목록 시작 -->
                   <div class="chat-leftsidebar card">
                   
                     <br>
                       <div class="p-3 px-4">
                           <div class="media">
                               <div class="align-self-center mr-3">
                                   <img src="${contextPath}/images/users/avatar-4.jpg" class="avatar-sm rounded-circle" alt="">
                               </div>
                               <div class="media-body">
                                   <h5 class="font-size-16 mt-0 mb-1"><a href="#" class="text-dark">${loginUser.userName}<i class="mdi mdi-circle text-success align-middle font-size-10 ml-1"></i></a></h5>
																	 <p class="text-muted mb-0">${description}</p>
																	 <%-- 사번이 A시작이면 관리자, B시작이면 부서명 + 직급명, C시작이면 소속학과 + 교수 --%>
                               </div>
                           </div>
                       </div>



                       <div class="pb-3">
                           <div data-simplebar style="max-height: 520px;">
                               <div class="p-4 border-top">
                                   <div>
                                       <div class="float-right">
                                           <a href="#" class="text-primary" data-toggle="modal" data-target="#GroupChat"><i class="mdi mdi-plus"></i>그룹 채팅방 생성</a>
                                       </div>
                                       <h5 class="font-size-16 mb-3"><i class="uil uil-users-alt mr-1"></i>그룹 채팅</h5>

                                       <ul class="list-unstyled chat-list group-list">
                                       
                                       
                                          <c:forEach var="map" items="${list2}">
                                          		<c:if test="${map['chatRoomDto'].roomType eq 'G'}">
                                          		
																									<li>
																									    <a href="#">
																									        <div class="media align-items-center">
																									            <div class="avatar-xs mr-3">
																									                <span class="avatar-title rounded-circle bg-soft-primary text-primary">
																									                    G
																									                </span>
																									            </div>
																									            
																									            <div class="media-body">
																									                <h5 class="font-size-14 mb-0">${map['chatRoomDto'].roomName} &nbsp;&nbsp;(${map['count']}명)  </h5>
																									            </div>
																									        </div>
																									    </a>
																									</li>

																							</c:if>
																					</c:forEach>
                                       

                                       </ul>
                                   </div>
                               </div>
                               
                               

                               <div class="p-4 border-top">
                                   <div>
                                       <div class="float-right">
                                           <a href="#" class="text-primary" data-toggle="modal" data-target="#OneToOneChat"><i class="mdi mdi-plus"></i>1:1 채팅방 생성</a>
                                       </div>
                                       <h5 class="font-size-16 mb-3"><i class="uil uil-user mr-1"></i>1:1 채팅</h5>

                                       <ul class="list-unstyled chat-list">
                                       
                                       
                                       
                                       
                                       
                                          <c:forEach var="map" items="${list2}">
                                          		<c:if test="${map['chatRoomDto'].roomType eq 'O'}">                                          		

			                                           <li>
			                                               <a href="#">
			                                                   <div class="media">
			                                                       
			                                                       <div class="user-img online align-self-center mr-3">
			                                                           <img src="${contextPath}/images/users/avatar-1.jpg" class="rounded-circle avatar-xs" alt="">
			                                                       </div>
			                                                       
			                                                       <div class="media-body overflow-hidden">
			                                                           <h5 class="text-truncate font-size-14 mb-1">
			                                                           	 ${map['counterpartName']} (${map['counterpartNo']})
			                                                           </h5>
			                                                           <p class="text-truncate mb-0">Hey! there I'm available</p>
			                                                       </div>
			                                                       <div class="font-size-11">02 min</div>
			                                                   </div>
			                                               </a>
			                                           </li>

																							</c:if>
																					</c:forEach>                                       
                                       
                                       
                                     
                                       
                                       
                                       

                                           
                                           <li class="unread">
                                               <a href="#">
                                                   <div class="media">
                                                       <div class="user-img online align-self-center mr-3">
                                                           <img src="${contextPath}/images/defaultProfile.png" class="rounded-circle avatar-xs" alt="">
                                                       </div>
                                                       
                                                       <div class="media-body overflow-hidden">
                                                           <h5 class="text-truncate font-size-14 mb-1">Galen Rizo</h5>
                                                           <p class="text-truncate mb-0">I've finished it! See you so</p>
                                                       </div>
                                                       <div class="font-size-11">10 min</div>
                                                       <div class="unread-message">
                                                           <span class="badge badge-danger badge-pill">01</span>
                                                       </div>
                                                   </div>
                                               </a>
                                           </li>



                                           
                                       </ul>
                                   </div>
                               </div>
                           </div>
                       </div>

                   </div>
               		 <!-- 왼쪽 채팅방 목록 끝 -->

									

									 <!-- 오른쪽 채팅방 영역 시작 -->	
                   <div class="w-100 user-chat mt-4 mt-sm-0 ml-lg-1">
                       <div class="card">
                           <div class="chat-conversation">
                               <div class="p-3 px-lg-4 border-bottom">
                                   <div class="row">
                                       <div class="col-xl-4 col-7">
                                           <div class="media align-items-center">
                                                       <div class="user-img online align-self-center mr-3">
                                                           <img src="${contextPath}/images/defaultProfile.png" class="rounded-circle avatar-xs" alt="">
                                                       </div>
                                               <div class="media-body">
                                                   <h5 class="font-size-16 mb-1 text-truncate"><a href="#" class="text-dark">1번 채팅방</a></h5>
                                                   <p class="text-muted text-truncate mb-0"><i class="uil uil-users-alt mr-1"></i> 12 Members</p>
                                               </div>
                                           </div>
                                       </div>
                                       <div class="col-xl-8 col-5">
                                           <ul class="list-inline user-chat-nav text-right mb-0">
                                               <li class="list-inline-item">
                                                   <div class="dropdown">
                                                       <button class="btn nav-btn dropdown-toggle" type="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                           <i class="uil uil-search"></i>
                                                       </button>
                                                       <div class="dropdown-menu dropdown-menu-right dropdown-menu-md p-2">
                                                           <form class="p-2">
                                                               <div>
                                                                   <input type="text" class="form-control rounded" placeholder="Search...">
                                                               </div>
                                                           </form>
                                                       </div>
                                                   </div>
                                               </li>
                                               <i data-feather="plus"></i> &nbsp;
																							 <i data-feather="x"></i>
                                           </ul>
                                       </div>
                                   </div>
                               </div>

                               <div class="card-body">
                                   <div data-simplebar style="max-height: 520px;">
                                       <ul class="conversation-list p-0">

                                           <li class="clearfix">
                                               <div class="media">
                                                   <img src="${contextPath}/images/users/avatar-2.jpg" class="avatar-xs rounded-circle align-self-end" alt="...">
                                                   <div class="media-body">
                                                       <div class="conversation-text">
                                                           <div class="ctext-wrap">
                                                               <a href="#" class="user-name">James Clark</a></h6>
                                                               <p>Good morning everyone !</p>
                                                           </div>
                                                           <div class="msg-seen">
                                                               <p class="text-muted font-size-12 mb-0 t mt-1"><i class="mdi mdi-clock-outline"></i> 09:01AM <i class="mdi mdi-check-all text-success ml-1"></i></p>
                                                           </div>
                                                           <a href="#" class="chat-share-icon"><i class="mdi mdi-reply font-size-20 ml-2"></i></a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="clearfix odd">
                                               <div class="media">
                                                   <div class="media-body">
                                                       <div class="conversation-text">
                                                           <div class="ctext-wrap">
                                                               <p>Good morning everyone !</p>
                                                           </div>
                                                           <div class="msg-seen">
                                                               <p class="text-muted font-size-12 mb-0 t mt-1"><i class="mdi mdi-clock-outline"></i> 09:02AM <i class="mdi mdi-check-all text-success ml-1"></i></p>
                                                           </div>
                                                       </div>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="clearfix">
                                               <div class="media">
                                                   <img src="assets/images/users/avatar-1.jpg" class="avatar-xs rounded-circle align-self-end" alt="...">
                                                   <div class="media-body">
                                                       <div class="conversation-text">
                                                           <div class="ctext-wrap">
                                                               <a href="#" class="user-name">Marie White</a></h6>
                                                               <p>Hello!</p>
                                                           </div>
                                                           <div class="msg-seen">
                                                               <p class="text-muted font-size-12 mb-0 t mt-1"><i class="mdi mdi-clock-outline"></i> 09:02AM <i class="mdi mdi-check-all text-success ml-1"></i></p>
                                                           </div>
                                                           <a href="#" class="chat-share-icon"><i class="mdi mdi-reply font-size-20 ml-2"></i></a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="clearfix">
                                               <div class="media">
                                                   <img src="assets/images/users/avatar-3.jpg" class="avatar-xs rounded-circle align-self-end" alt="...">
                                                   <div class="media-body">
                                                       <div class="conversation-text">
                                                           <div class="ctext-wrap">
                                                               <a href="#" class="user-name">Helen Pitts</a></h6>
                                                               <p>What about our next meeting?</p>
                                                           </div>
                                                           <div class="msg-seen">
                                                               <p class="text-muted font-size-12 mb-0 t mt-1"><i class="mdi mdi-clock-outline"></i> 09:03AM <i class="mdi mdi-check-all text-success ml-1"></i></p>
                                                           </div>
                                                           <a href="#" class="chat-share-icon"><i class="mdi mdi-reply font-size-20 ml-2"></i></a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="clearfix">
                                               <div class="media">
                                                   <img src="assets/images/users/avatar-4.jpg" class="avatar-xs rounded-circle align-self-end" alt="...">
                                                   <div class="media-body">
                                                       <div class="conversation-text">
                                                           <div class="ctext-wrap">
                                                               <a href="#" class="user-name">Kimber Rivera</a></h6>
                                                               <p>Next meeting tomorrow 10.00AM</p>
                                                           </div>
                                                           <div class="msg-seen">
                                                               <p class="text-muted font-size-12 mb-0 t mt-1"><i class="mdi mdi-clock-outline"></i> 09:04AM <i class="mdi mdi-check-all text-success ml-1"></i></p>
                                                           </div>
                                                           <a href="#" class="chat-share-icon"><i class="mdi mdi-reply font-size-20 ml-2"></i></a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="clearfix odd">
                                               <div class="media">
                                                   <div class="media-body">
                                                       <div class="conversation-text">
                                                           <div class="ctext-wrap">
                                                               <p>Wow that's great</p>
                                                           </div>
                                                           <div class="msg-seen">
                                                               <p class="text-muted font-size-12 mb-0 t mt-1"><i class="mdi mdi-clock-outline"></i> 09:05AM <i class="mdi mdi-check-all text-success ml-1"></i></p>
                                                           </div>
                                                       </div>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="clearfix">
                                               <div class="media">
                                                   <img src="assets/images/users/avatar-3.jpg" class="avatar-xs rounded-circle align-self-end" alt="...">
                                                   <div class="media-body">
                                                       <div class="conversation-text">
                                                           <div class="ctext-wrap">
                                                               <a href="#" class="user-name">Rodney Perry</a></h6>
                                                               <p>img-1.jpg & img-2.jpg images for a New Projects</p>
                                                               <div class="mt-2">
                                                                   <a href="#">
                                                                       <img src="assets/images/small/img-1.jpg" alt="" class="rounded img-fluid">
                                                                   </a>
                                                                   <a href="#">
                                                                       <img src="assets/images/small/img-2.jpg" alt="" class="rounded img-fluid">
                                                                   </a>
                                                               </div>
                                                           </div>
                                                           <div class="msg-seen">
                                                               <p class="text-muted font-size-12 mb-0 t mt-1"><i class="mdi mdi-clock-outline"></i> 09:06AM <i class="mdi mdi-check-all text-success ml-1"></i></p>
                                                           </div>
                                                           <a href="#" class="chat-share-icon"><i class="mdi mdi-reply font-size-20 ml-2"></i></a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="clearfix odd">
                                               <div class="media">
                                                   <div class="media-body">
                                                       <div class="conversation-text">
                                                           <div class="ctext-wrap">
                                                               <p>It looks very nice.</p>
                                                           </div>
                                                           <div class="msg-seen">
                                                               <p class="text-muted font-size-12 mb-0 t mt-1"><i class="mdi mdi-clock-outline"></i> 09:06AM <i class="mdi mdi-check-all text-success ml-1"></i></p>
                                                           </div>
                                                       </div>
                                                   </div>
                                               </div>
                                           </li>
                                           <li class="clearfix">
                                               <div class="media">
                                                   <img src="assets/images/users/avatar-4.jpg" class="avatar-xs rounded-circle align-self-end" alt="...">
                                                   <div class="media-body">
                                                       <div class="conversation-text">
                                                           <div class="ctext-wrap">
                                                               <a href="#" class="user-name">Kimber Rivera</a></h6>
                                                               <p>Thank you. 😊</p>
                                                           </div>
                                                           <div class="msg-seen">
                                                               <p class="text-muted font-size-12 mb-0 t mt-1"><i class="mdi mdi-clock-outline"></i> 09:07AM <i class="mdi mdi-check-all text-success ml-1"></i></p>
                                                           </div>
                                                           <a href="#" class="chat-share-icon"><i class="mdi mdi-reply font-size-20 ml-2"></i></a>
                                                       </div>
                                                   </div>
                                               </div>
                                           </li>
                                       </ul>
                                   </div>
                                   <div class="row align-items-center pt-2 chat-input-box">
                                       <div class="col-xl-10 col-md-8 col-8 chat-inputbar">
                                           <input type="text" class="form-control chat-input" placeholder="이곳에 메세지를 입력하세요.">
                                       </div>
                                       <div class="col-xl-2 col-md-4 col-4">
                                           <button type="submit" class="btn btn-block btn-primary"><span class="d-sm-inline-block d-none">Send</span> 
                                               <i class="uil uil-message ml-sm-1 ml-0"></i>
                                           </button>
                                       </div>
                                   </div>
                               </div>
                           </div>
                       </div>
                   </div>
                   <!-- 오른쪽 채팅방 영역 시작 -->	

               </div>
               <!-- End d-lg-flex  -->
               
               
       
               
               
               
               
                <div class="d-lg-flex mb-4">
               
               		 <!-- 왼쪽 채팅방 목록 시작 -->
                   <div class="chat-leftsidebar card">
                   
                     <br>
                       <div class="p-3 px-4">
                           <div class="media">
                               <div class="align-self-center mr-3">
                                   <img src="${contextPath}/images/users/avatar-4.jpg" class="avatar-sm rounded-circle" alt="">
                               </div>
                               <div class="media-body">
                                   <h5 class="font-size-16 mt-0 mb-1"><a href="#" class="text-dark">임상우<i class="mdi mdi-circle text-success align-middle font-size-10 ml-1"></i></a></h5>
																	 <p class="text-muted mb-0">인사팀 사원</p>
																	 <%-- 사번이 A시작이면 관리자, B시작이면 부서명 + 직급명, C시작이면 소속학과 + 교수 --%>
                               </div>
                           </div>
                       </div>



                       <div class="pb-3">
                           <div data-simplebar style="max-height: 520px;">
                               <div class="p-4 border-top">
                                   <div>
                                       <div class="float-right">
                                           <a href="" class="text-primary"><i class="mdi mdi-plus"></i>그룹 채팅방 생성</a>
                                       </div>
                                       <h5 class="font-size-16 mb-3"><i class="uil uil-users-alt mr-1"></i>그룹 채팅</h5>

                                       <ul class="list-unstyled chat-list group-list">
                                           <li>
                                               <a href="#">
                                                   <div class="media align-items-center">
                                                       <div class="avatar-xs mr-3">
                                                           <span class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                               G
                                                           </span>
                                                       </div>
                                                       
                                                       <div class="media-body">
                                                           <h5 class="font-size-14 mb-0">1번 채팅방</h5>
                                                       </div>
                                                   </div>
                                               </a>
                                           </li>
                                           <li class="active">
                                               <a href="#">
                                                   <div class="media align-items-center">
                                                       <div class="avatar-xs mr-3">
                                                           <span class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                               G
                                                           </span>
                                                       </div>
                                                       
                                                       <div class="media-body">
                                                           <h5 class="font-size-14 mb-0">2번 채팅방</h5>
                                                       </div>
                                                   </div>
                                               </a>
                                           </li>
                                           <li>
                                               <a href="#">
                                                   <div class="media align-items-center">
                                                       <div class="avatar-xs mr-3">
                                                           <span class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                               G
                                                           </span>
                                                       </div>
                                                       
                                                       <div class="media-body">
                                                           <h5 class="font-size-14 mb-0">3번 채팅방</h5>
                                                       </div>
                                                   </div>
                                               </a>
                                           </li>
                                           <li>
                                               <a href="#">
                                                   <div class="media align-items-center">
                                                       <div class="avatar-xs mr-3">
                                                           <span class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                               G
                                                           </span>
                                                       </div>
                                                       
                                                       <div class="media-body">
                                                           <h5 class="font-size-14 mb-0">4번 채팅방</h5>
                                                       </div>
                                                   </div>
                                               </a>
                                           </li>
                                       </ul>
                                   </div>
                               </div>

                               <div class="p-4 border-top">
                                   <div>
                                       <div class="float-right">
                                           <a href="" class="text-primary"><i class="mdi mdi-plus"></i>1:1 채팅방 생성</a>
                                       </div>
                                       <h5 class="font-size-16 mb-3"><i class="uil uil-user mr-1"></i>1:1 채팅</h5>

                                       <ul class="list-unstyled chat-list">
                                           <li>
                                               <a href="#">
                                                   <div class="media">
                                                       
                                                       <div class="user-img online align-self-center mr-3">
                                                           <img src="${contextPath}/images/users/avatar-2.jpg" class="rounded-circle avatar-xs" alt="">
                                                           <span class="user-status"></span>
                                                       </div>
                                                       
                                                       <div class="media-body overflow-hidden">
                                                           <h5 class="text-truncate font-size-14 mb-1">James Clark</h5>
                                                           <p class="text-truncate mb-0">Hey! there I'm available</p>
                                                       </div>
                                                       <div class="font-size-11">02 min</div>
                                                   </div>
                                               </a>
                                           </li>
                                           <li class="unread">
                                               <a href="#">
                                                   <div class="media">
                                                       <div class="user-img online align-self-center mr-3">
                                                           <div class="avatar-xs align-self-center">
                                                               <span class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                                   기본 프사
                                                               </span>
                                                           </div>
                                                           <span class="user-status"></span>
                                                       </div>
                                                       
                                                       <div class="media-body overflow-hidden">
                                                           <h5 class="text-truncate font-size-14 mb-1">Galen Rizo</h5>
                                                           <p class="text-truncate mb-0">I've finished it! See you so</p>
                                                       </div>
                                                       <div class="font-size-11">10 min</div>
                                                       <div class="unread-message">
                                                           <span class="badge badge-danger badge-pill">01</span>
                                                       </div>
                                                   </div>
                                               </a>
                                           </li>
                                           <li>
                                               <a href="#">
                                                   <div class="media">
                                                       <div class="user-img away align-self-center mr-3">
                                                           <img src="${contextPath}/images/users/avatar-3.jpg" class="rounded-circle avatar-xs" alt="">
                                                           <span class="user-status"></span>
                                                       </div>
                                                       
                                                       <div class="media-body overflow-hidden">
                                                           <h5 class="text-truncate font-size-14 mb-1">Helen Pitts</h5>
                                                           <p class="text-truncate mb-0">This theme is awesome!</p>
                                                       </div>
                                                       <div class="font-size-11">22 min</div>
                                                   </div>
                                               </a>
                                           </li>
                                           <li>
                                               <a href="#">
                                                   <div class="media">
                                                       
                                                       <div class="user-img align-self-center mr-3">
                                                           <img src="${contextPath}/images/users/avatar-4.jpg" class="rounded-circle avatar-xs" alt="">
                                                           <span class="user-status"></span>
                                                       </div>
                                                       
                                                       <div class="media-body overflow-hidden">
                                                           <h5 class="text-truncate font-size-14 mb-1">Annie Holder</h5>
                                                           <p class="text-truncate mb-0">Nice to meet you</p>
                                                       </div>
                                                       <div class="font-size-11">01 Hr</div>
                                                   </div>
                                               </a>
                                           </li>
                                           <li>
                                               <a href="#">
                                                   <div class="media">
                                                       
                                                       <div class="user-img online align-self-center mr-3">
                                                           <div class="avatar-xs align-self-center">
                                                               <span class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                                   기본 프사
                                                               </span>
                                                           </div>
                                                           <span class="user-status"></span>
                                                       </div>
                                                       
                                                       <div class="media-body overflow-hidden">
                                                           <h5 class="text-truncate font-size-14 mb-1">Vernon Smith</h5>
                                                           <p class="text-truncate mb-0">Wow that's great</p>
                                                       </div>
                                                       <div class="font-size-11">04 Hrs</div>
                                                   </div>
                                               </a>
                                           </li>

                                           
                                       </ul>
                                   </div>
                               </div>
                           </div>
                       </div>

                   </div>
               		 <!-- 왼쪽 채팅방 목록 끝 -->

									

									 <!-- 오른쪽 채팅방 영역 시작 -->	

                   <!-- 오른쪽 채팅방 영역 시작 -->	

               </div>
               <!-- End d-lg-flex  -->              
               
               
               
							<!-- 그룹 채팅방 생성 modal -->
							<div class="modal fade" id="GroupChat">
							    <div class="modal-dialog modal-sm">
							        <div class="modal-content">
							        
								        <!-- Modal Header -->
								        <div class="modal-header">
								            <h4 class="modal-title">그룹 채팅방 생성</h4>
								            <button type="button" class="close" data-dismiss="modal">&times;</button> 
								        </div>
								
								        <form action="${contextPath}/chat/makeGroupChat" method="post" onsubmit="return validateSelection()">
								            <!-- Modal Body -->
								            <div class="modal-body">
								            		<br>
								            		<label for="title" class="mr-sm-2"><div style="font-weight: bold;">채팅방 제목 :</div></label>
								                <input type="text" class="mb-2 mr-sm-2" placeholder="필수 입력(최대 글자수 13자)" id="title" name="title" maxlength="13" required> <br><br><br>

																<div style="text-align: center; font-weight: bold;">
																	&lt;&lt;초대 인원 선택 (최소 1명 이상)&gt;&gt; <br><br>
																</div>
																
																관리자 <br>
																<table>
				                          <c:forEach var="userDto" items="${adminList}">
				                            <c:if test="${userDto.userNo != loginUser.userNo}">
					                          	<tr>
																				<td><input type="checkbox" name="selectedUsers" value="${userDto.userNo}"></td>
					                          		<td>${userDto.userNo}</td>
																	    	<td>${userDto.userName}</td>
																	    </tr>		
																	  </c:if>    	                          	
				                          </c:forEach>
																</table>
																<br>
																
																
																교수 <br>
																<table>
				                          <c:forEach var="userDto" items="${professorList}">
				                            <c:if test="${userDto.userNo != loginUser.userNo}">
					                          	<tr>
																				<td><input type="checkbox" name="selectedUsers" value="${userDto.userNo}"></td>					                          	
					                          		<td>${userDto.userNo}</td>
																	    	<td>${userDto.userName}</td>
																	    	<td>${userDto.deptName}</td>
																	    </tr>		
																	  </c:if>    	                          	
				                          </c:forEach>
																</table>
																<br>
																
			                          
			                          <c:forEach var="dept" items="${deptList}">
			                          	부서 : ${dept} <br>
			                          	<table>
			                          		
			                          		<c:forEach var="userDto" items="${deptMap[dept]}">
				                          		<c:if test="${userDto.userNo != loginUser.userNo}">
						                          	<tr>
																					<td><input type="checkbox" name="selectedUsers" value="${userDto.userNo}"></td>					                          	
						                          		<td>${userDto.userNo}</td>
																		    	<td>${userDto.userName}</td>
																		    	<td>${userDto.rankName}</td>
																		    </tr>
																		  </c:if>  
																    </c:forEach>
			                          		
			                          	</table>
			                          	<br>
			                          </c:forEach>                    

								            </div>
								            
								            <!-- Modal footer -->
								            <div class="modal-footer">
								                <button type="submit" class="btn btn-primary">생성</button>
								                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								            </div>
								        </form>
							        
							        </div>
							    </div>
							</div>
              <script> <!-- 그룹 채팅방 생성 modal 0명 선택 방지. -->
					    function validateSelection() {
					        const checkboxes = document.querySelectorAll('input[name="selectedUsers"]:checked');
					        if (checkboxes.length === 0) {
					            alert("최소 한 명 이상의 사용자를 선택해야 합니다.");
					            return false; // 폼 제출 방지
					        }
					        return true; // 폼 제출 허용
					    }
							</script>
							
 
 
							<!-- 1대1 채팅방 생성 modal -->
							<div class="modal fade" id="OneToOneChat">
							    <div class="modal-dialog modal-sm">
							        <div class="modal-content">
							        
								        <!-- Modal Header -->
								        <div class="modal-header">
								            <h4 class="modal-title">1대1 채팅방 생성</h4>
								            <button type="button" class="close" data-dismiss="modal">&times;</button> 
								        </div>
								
								        <form action="${contextPath}/chat/makeOneToOneChat" method="post">
								            <!-- Modal Body -->
								            <div class="modal-body">
								            		<br>

																<div style="text-align: center; font-weight: bold;">
																	&lt;&lt;초대 인원 선택 (1명)&gt;&gt; <br><br>
																</div>
																
																관리자 <br>
																<table>
				                          <c:forEach var="userDto" items="${adminList}">
				                            <c:if test="${userDto.userNo != loginUser.userNo}">				                          
					                          	<tr>
					                          		<td><input type="radio" name="selectedUser" value="${userDto.userNo}" required></td>
					                          		<td>${userDto.userNo}</td>
																	    	<td>${userDto.userName}</td>
																	    </tr>		
																	  </c:if>    	                          	
				                          </c:forEach>
																</table>
																<br>
																
																
																교수 <br>
																<table>
				                          <c:forEach var="userDto" items="${professorList}">
				                            <c:if test="${userDto.userNo != loginUser.userNo}">				                          
					                          	<tr>
					                          		<td><input type="radio" name="selectedUser" value="${userDto.userNo}" required></td>	                          	
					                          		<td>${userDto.userNo}</td>
																	    	<td>${userDto.userName}</td>
																	    	<td>${userDto.deptName}</td>
																	    </tr>		
																	  </c:if>    	                          	
				                          </c:forEach>
																</table>
																<br>
																
			                          
			                          <c:forEach var="dept" items="${deptList}">
			                          	부서 : ${dept} <br>
			                          	<table>
			                          		
			                          		<c:forEach var="userDto" items="${deptMap[dept]}">
				                          		<c:if test="${userDto.userNo != loginUser.userNo}">
						                          	<tr>
						                          		<td><input type="radio" name="selectedUser" value="${userDto.userNo}" required></td>				                          	
						                          		<td>${userDto.userNo}</td>
																		    	<td>${userDto.userName}</td>
																		    	<td>${userDto.rankName}</td>
																		    </tr>
																		  </c:if>  
																    </c:forEach>
			                          		
			                          	</table>
			                          	<br>
			                          </c:forEach>

								            </div>
								            
								            <!-- Modal footer -->
								            <div class="modal-footer">
								                <button type="submit" class="btn btn-primary">생성</button>
								                <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
								            </div>
								        </form>
							        
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