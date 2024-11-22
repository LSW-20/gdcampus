<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

<!-- sidebar 시작 -->
<div class="vertical-menu">

		<!-- LOGO -->
		<div class="navbar-brand-box">
		<!-- <a href="${contextPath == '' ? '/' : contextPath}" class="logo logo-dark"> -->		
				<a href="${contextPath}/main2.do" class="logo logo-dark">
						<span class="logo-sm">
								<img src="${contextPath}/images/logo-dark-sm.png" alt="" height="22">
						</span>
						<span class="logo-lg">
								<img src="${contextPath}/images/logo-dark.png" alt="" height="18">
						</span>
				</a>

				<a href="${contextPath}/main2.do" class="logo logo-light">
						<span class="logo-sm">
								<img src="${contextPath}/images/logo-light-sm.png" alt="" height="22">
						</span>
						<span class="logo-lg">
								<i class="icon nav-icon" data-feather="home"></i>
						</span>
				</a>
		</div>

		<button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
				<i class="fa fa-fw fa-bars"></i>
		</button>

		<div data-simplebar class="sidebar-menu-scroll">


				<!--- Sidemenu -->
				<div id="sidebar-menu">
						
						<ul class="metismenu list-unstyled" id="side-menu">
						
	
								
								
								<!-- 공통 메뉴 시작 -->
								<li class="menu-title">공통</li>

								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="user"></i>
												<span class="menu-item">근태 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="${contextPath }/holiday/workstatus.do">나의 근태 현황</a></li>
												<li><a href="#">휴가 신청</a></li>
										</ul>
								</li>

								
								<li>
										<a href="#" class="waves-effect">
												<i class="icon nav-icon" data-feather="calendar"></i>
												<span class="menu-item">일정 관리</span>
										</a>
								</li>
								
								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="edit"></i>
												<span class="menu-item">게시판</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#">공지게시판</a></li>
												<li><a href="#">자유게시판</a></li>
												<li><a href="#">투표게시판</a></li>
										</ul>
								</li>
								
								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="archive"></i>
												<span class="menu-item">비품, 시설 예약</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#">예약 신청</a></li>
												<li><a href="#">예약 신청 내역 조회</a></li>
										</ul>
								</li>

								<li>
										<a href="${contextPath}/chat/roomList" class=" waves-effect">
												<i class="icon nav-icon" data-feather="message-square"></i>
												<span class="badge badge-pill badge-success float-right">New</span>
												<span class="menu-item">메신저</span>
										</a>
								</li>
								<!-- 공통 메뉴 끝 -->			
								
								
								
								
								<c:if test="${not empty loginUser.stDeptNo }">
								<br>
								
								<!-- 교수 메뉴 시작 -->
								<li class="menu-title">교수</li>

								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="book"></i>
												<span class="menu-item">강의 개설 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="${contextPath}/class/opning/prof/list.do">강의 개설 신청 현황</a></li>
										</ul>
								</li>
								
								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="book-open"></i>
												<span class="menu-item">강의 조회</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#">강의 목록 조회</a></li>
												<li><a href="#">수업계획서 관리</a></li>
												<li><a href="#"></a></li>
										</ul>
								</li>
								<!-- 교수 메뉴 끝 -->			
								</c:if>
								
								<c:if test="${loginUser.deptNo eq 1 }">
								<br>
								
								
								<!-- 인사팀 메뉴 시작 -->
								<li class="menu-title">인사팀</li>

								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="users"></i>
												<span class="menu-item">인사 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="${contextPath}/user/staff/list.do">사원 관리</a></li>
												<li><a href="${contextPath}/user/prof/list.do">교수 관리</a></li>
										</ul>
								</li>

								<!-- 인사팀 메뉴 끝 -->												
								</c:if>
								
								
								<c:if test="${loginUser.deptNo eq 2 }">
								<br>
								
								
								<!-- 교무팀 메뉴 시작 -->
								<li class="menu-title">교무팀</li>

								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="layers"></i>
												<span class="menu-item">강의 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="${contextPath}/class/opning/staff/list.do">강의 개설신청 조회</a></li>
										</ul>
								</li>
								
								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="feather"></i>
												<span class="menu-item">학적 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="${contextPath }/student/student.do">학생 정보 조회, 추가, 수정, 삭제</a></li>
										</ul>
								</li>								
								<!-- 교무팀 메뉴 끝 -->				
								</c:if>
								
								<br>
								
								
								<!-- 전자결재 메뉴 시작 -->
								<li class="menu-title">전자결재</li>

								<li>
										<a href="${contextPath}/approval/home" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="check"></i>
												<span class="menu-item">결재하기</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
										</ul>
								</li>
								
								<li>
										<a href="${contextPath}/approval/todo" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="columns"></i>
												<span class="menu-item">결재 대기 문서함</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
										</ul>
								</li>
								
								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="inbox"></i>
												<span class="menu-item">결재 수신 문서함</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
										</ul>
								</li>
								
								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="eye"></i>
												<span class="menu-item">결재 참조/열람함</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
										</ul>
								</li>
								
								<li>
										<a href="${contextPath}/approval/upComing" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="clipboard"></i>
												<span class="menu-item">결재 예정 문서함</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
										</ul>
								</li>
								
								<li>
										<a href="${contextPath}/approval/myDoc" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="file-text"></i>
												<span class="menu-item">기안문서함</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#"></a></li>
										</ul>
								</li>								
								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="edit-3"></i>
												<span class="menu-item">서명관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
												<li><a href="#"></a></li>
										</ul>
								</li>

								<!-- 전자결재 메뉴 끝 -->												
								
								
								<br>
																
								
								<c:if test="${loginUser.userNo != null && fn:contains(loginUser.userNo, 'A')}">
								<!-- 관리자 메뉴 시작 -->
								<li class="menu-title">관리자</li>

								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="briefcase"></i>
												<span class="menu-item">부서 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#">부서 카테고리 관리</a></li>
										</ul>
								</li>

								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="minus-square"></i>
												<span class="menu-item">직급 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">

												<li><a href="${contextPath }/user/profile/rank.do">직급 조회, 추가, 수정, 삭제</a></li>


										</ul>
								</li>
								
									<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="briefcase"></i>
												<span class="menu-item">게시판 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#">게시판 카테고리 관리</a></li>
										</ul>
								</li>

								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="tool"></i>
												<span class="menu-item">비품, 시설 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="${contextPath }/equipAndFacility/manageCategory">비품, 시설 카테고리 관리</a></li>
										</ul>
								</li>

								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="file"></i>
												<span class="menu-item">결재 문서 양식 관리</span>
										</a>
										<ul class="sub-menu" aria-expanded="false">
												<li><a href="#">템플릿 양식 조회</a></li>
												<li><a href="#">템플릿 양식 추가, 수정, 삭제</a></li>
										</ul>
								</li>
								<!-- 관리자 메뉴 끝 -->		
								</c:if>



								<br>
								

								<li class="menu-title" c>Components</li>

								<li>
										<a href="javascript: void(0);" class="has-arrow waves-effect">
												<i class="icon nav-icon" data-feather="share-2"></i>
												<span class="menu-item" key="t-multi-level">Multi Level</span>
										</a>
										<ul class="sub-menu" aria-expanded="true">
												<li><a href="javascript: void(0);" key="t-level-1.1">Level 1.1</a></li>
												<li><a href="javascript: void(0);" class="has-arrow" key="t-level-1.2">Level 1.2</a>
														<ul class="sub-menu" aria-expanded="true">
																<li><a href="javascript: void(0);" key="t-level-2.1">Level 2.1</a></li>
																<li><a href="javascript: void(0);" key="t-level-2.2">Level 2.2</a></li>
														</ul>
												</li>
										</ul>
								</li>

						</ul>
				</div>
				<!-- Sidebar -->
		</div>
</div>
<!-- sidebar 끝 -->