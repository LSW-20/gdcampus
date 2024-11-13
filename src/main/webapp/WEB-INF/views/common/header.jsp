<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
    
<c:if test="${not empty alertMsg}">
    <script>
        alert("${alertMsg}");
    </script>
</c:if>
    
<!-- App favicon -->
<link rel="shortcut icon" href="${contextPath}/images/favicon.ico">
<!-- Bootstrap Css -->
<link href="${contextPath}/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
<!-- Icons Css -->
<link href="${contextPath}/css/icons.min.css" rel="stylesheet" type="text/css" />
<!-- App Css-->
<link href="${contextPath}/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />


<!-- jQuery should be loaded first -->
<script src="${contextPath}/libs/jquery/jquery.min.js" defer></script>

<!-- Other JS libraries -->
<script src="${contextPath}/libs/bootstrap/js/bootstrap.bundle.min.js" defer></script>
<script src="${contextPath}/libs/metismenu/metisMenu.min.js" defer></script>
<script src="${contextPath}/libs/simplebar/simplebar.min.js" defer></script>
<script src="${contextPath}/libs/node-waves/waves.min.js" defer></script>
<script src="${contextPath}/libs/waypoints/lib/jquery.waypoints.min.js" defer></script>
<script src="${contextPath}/libs/jquery.counterup/jquery.counterup.min.js" defer></script>
<script src="${contextPath}/libs/feather-icons/feather.min.js" defer></script>
<script src="${contextPath}/libs/apexcharts/apexcharts.min.js" defer></script>

<!-- App JS -->
<script src="${contextPath}/js/app.js" defer></script>




<!-- header 시작 -->
<header id="page-topbar">
		<div class="navbar-header">
		
		
				<div class="d-flex">
				<!-- header에 드롭다운 메뉴 안두기로 결정 -->
				</div>



				<div class="d-flex">

						<!-- 첫번째 네모 네 개 아이콘 -->
						<div class="dropdown d-none d-lg-inline-block">
								<button type="button" class="btn header-item noti-icon waves-effect"
										data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<i class="icon-sm" data-feather="grid"></i>
								</button>
								<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
										<div class="px-lg-2">
												<div class="row no-gutters">
														<div class="col">
																<a class="dropdown-icon-item" href="#">
																		<img src="${contextPath}images/brands/github.png" alt="Github">
																		<span key="t-gitHub">GitHub</span>
																</a>
														</div>
														<div class="col">
																<a class="dropdown-icon-item" href="#">
																		<img src="${contextPath}/images/brands/bitbucket.png" alt="bitbucket">
																		<span key="t-bitbucket">Bitbucket</span>
																</a>
														</div>
														<div class="col">
																<a class="dropdown-icon-item" href="#">
																		<img src="${contextPath}/images/brands/dribbble.png" alt="dribbble">
																		<span key="t-dribbble">Dribbble</span>
																</a>
														</div>
												</div>

												<div class="row no-gutters">
														<div class="col">
																<a class="dropdown-icon-item" href="#">
																		<img src="${contextPath}/images/brands/dropbox.png" alt="dropbox">
																		<span key="t-dropbox">Dropbox</span>
																</a>
														</div>
														<div class="col">
																<a class="dropdown-icon-item" href="#">
																		<img src="${contextPath}/images/brands/mail_chimp.png" alt="mail_chimp">
																		<span key="t-mail-chimp">Mail Chimp</span>
																</a>
														</div>
														<div class="col">
																<a class="dropdown-icon-item" href="#">
																		<img src="${contextPath}/images/brands/slack.png" alt="slack">
																		<span key="t-slack">Slack</span>
																</a>
														</div>
												</div>
										</div>
								</div>
						</div>


						<!-- 두번째 알람 아이콘 -->
						<div class="dropdown d-inline-block">
								<button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown"
										data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<i class="icon-sm" data-feather="bell"></i>
										<span class="noti-dot bg-danger"></span>
								</button>
								<div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0"
										aria-labelledby="page-header-notifications-dropdown">
										<div class="p-3">
												<div class="row align-items-center">
														<div class="col">
																<h5 class="m-0 font-size-15" key="t-notifications"> Notifications </h5>
														</div>
														<div class="col-auto">
																<a href="#!" class="small" key="t-mark-read"> Mark all as read</a>
														</div>
												</div>
										</div>
										<div data-simplebar style="max-height: 230px;">
												<a href="" class="text-reset notification-item">
														<div class="media">
																<div class="avatar-xs mr-3">
																		<span class="avatar-title bg-primary rounded-circle font-size-16">
																				<i class="uil-shopping-basket"></i>
																		</span>
																</div>
																<div class="media-body">
																		<h6 class="mt-0 mb-1" key="t-order-placed">Your order is placed</h6>
																		<div class="font-size-12 text-muted">
																				<p class="mb-1" key="t-anguages-grammar">If several languages coalesce the grammar</p>
																				<p class="mb-0" key="t-3-min-ago"><i class="mdi mdi-clock-outline"></i> 3 min ago</p>
																		</div>
																</div>
														</div>
												</a>
												<a href="" class="text-reset notification-item">
														<div class="media">
																<img src="${contextPath}/images/users/avatar-3.jpg"
																		class="mr-3 rounded-circle avatar-xs" alt="user-pic">
																<div class="media-body">
																		<h6 class="mt-0 mb-1" key="t-james-lemire">James Lemire</h6>
																		<div class="font-size-12 text-muted">
																				<p class="mb-1" key="t-simplified-English">It will seem like simplified English.</p>
																				<p class="mb-0" key="t-1-hours-ago"><i class="mdi mdi-clock-outline"></i> 1 hours ago</p>
																		</div>
																</div>
														</div>
												</a>
												<a href="" class="text-reset notification-item">
														<div class="media">
																<div class="avatar-xs mr-3">
																		<span class="avatar-title bg-success rounded-circle font-size-16">
																				<i class="uil-truck"></i>
																		</span>
																</div>
																<div class="media-body">
																		<h6 class="mt-0 mb-1" key="t-item-shipped">Your item is shipped</h6>
																		<div class="font-size-12 text-muted">
																				<p class="mb-1" key="t-several-grammar">If several languages coalesce the grammar</p>
																				<p class="mb-0" key="t-3-min-ago"><i class="mdi mdi-clock-outline"></i> 3 min ago</p>
																		</div>
																</div>
														</div>
												</a>

												<a href="" class="text-reset notification-item">
														<div class="media">
																<img src="${contextPath}/images/users/avatar-4.jpg"
																		class="mr-3 rounded-circle avatar-xs" alt="user-pic">
																<div class="media-body">
																		<h6 class="mt-0 mb-1" key="t-salena-layfield">Salena Layfield</h6>
																		<div class="font-size-12 text-muted">
																				<p class="mb-1" key="t-skeptical-occidental">As a skeptical Cambridge friend of mine occidental.</p>
																				<p class="mb-0" key="t-1-hours-ago"><i class="mdi mdi-clock-outline"></i> 1 hours ago</p>
																		</div>
																</div>
														</div>
												</a>
										</div>
										<div class="p-2 border-top">
												<a class="btn btn-sm btn-link font-size-14 btn-block text-center" href="javascript:void(0)">
														<i class="uil-arrow-circle-right mr-1"></i> <span key="t-view-more">View More..</span>
												</a>
										</div>
								</div>
						</div>


						<!-- 세번째 마이페이지 아이콘 -->
						<div class="dropdown d-inline-block">
								<button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
										data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										<img class="rounded-circle header-profile-user" src="${contextPath}/images/users/avatar-4.jpg"
												alt="Header Avatar">
								</button>
								<div class="dropdown-menu dropdown-menu-right">
										<!-- item-->
										<a class="dropdown-item" href="${contextPath }/user/profile/profile.do"><i class="uil uil-user-circle font-size-16 align-middle text-muted mr-1"></i> <span class="align-middle" key="t-view"> View Profile</span></a>
										<a class="dropdown-item" href="#"><i class="uil uil-wallet font-size-16 align-middle mr-1 text-muted"></i> <span class="align-middle" key="t-my-wallet"> My Wallet</span></a>
										<a class="dropdown-item d-block" href="#"><i class="uil uil-cog font-size-16 align-middle mr-1 text-muted"></i> <span class="align-middle" key="t-settings"> Settings</span> <span class="badge badge-soft-success badge-pill mt-1 ml-2">03</span></a>
										<a class="dropdown-item" href="#"><i class="uil uil-lock-alt font-size-16 align-middle mr-1 text-muted"></i> <span class="align-middle" key="t-lock-screen"> Lock screen</span></a>
										<a class="dropdown-item" href="${contextPath }/logout.do"><i class="uil uil-sign-out-alt font-size-16 align-middle mr-1 text-muted"></i> <span class="align-middle" key="t-sign-out"> Sign out</span></a>
								</div>
						</div>


				</div>
		</div>
</header>
<!-- header 끝 -->






