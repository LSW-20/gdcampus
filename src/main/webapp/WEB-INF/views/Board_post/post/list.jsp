<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>        
     
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin &amp; Dashboard Template" name="description">
        <meta content="Themesbrand" name="author">
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Responsive Table css -->
        <link href="assets/libs/admin-resources/rwd-table/rwd-table.min.css" rel="stylesheet" type="text/css">

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css">
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css">
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css">

    </head>

    
    <body data-sidebar="dark">

    <!-- <body data-layout="horizontal" data-topbar="colored"> -->

        <!-- Begin page -->
        <div id="layout-wrapper">

            
            <header id="page-topbar">
                <div class="navbar-header">
                    <div class="d-flex">
                        <!-- LOGO -->
                        <div class="navbar-brand-box">
                            <a href="index.html" class="logo logo-dark">
                                <span class="logo-sm">
                                    <img src="assets/images/logo-dark-sm.png" alt="" height="22">
                                </span>
                                <span class="logo-lg">
                                    <img src="assets/images/logo-dark.png" alt="" height="18">
                                </span>
                            </a>

                            <a href="index.html" class="logo logo-light">
                                <span class="logo-sm">
                                    <img src="assets/images/logo-light-sm.png" alt="" height="22">
                                </span>
                                <span class="logo-lg">
                                    <img src="assets/images/logo-light.png" alt="" height="18">
                                </span>
                            </a>
                        </div>

                        <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
                            <i class="fa fa-fw fa-bars"></i>
                        </button>

                        <div class="dropdown d-none d-lg-block ml-2">
                            <button type="button" class="btn header-item waves-effect" data-toggle="dropdown" aria-haspopup="false" aria-expanded="false">
                                <span key="t-ui-components">UI Components</span>
                                <i class="mdi mdi-chevron-down"></i> 
                            </button>
                            <div class="dropdown-menu dropdown-menu-xl p-2">
                                <div class="row">
                                    <div class="col-md-6">
                                        <a class="dropdown-item" href="ui-alerts.html" key="t-alerts">Alerts</a>
                                        <a class="dropdown-item" href="ui-buttons.html" key="t-buttons">Buttons</a>
                                        <a class="dropdown-item" href="ui-cards.html" key="t-cards">Cards</a>
                                        <a class="dropdown-item" href="ui-dropdowns.html" key="t-dropdowns">Dropdowns</a>
                                        <a class="dropdown-item" href="ui-lightbox.html" key="t-lightbox">Lightbox</a>
                                        <a class="dropdown-item" href="ui-modals.html" key="t-modals">Modals</a>
                                        <a class="dropdown-item" href="ui-rangeslider.html" key="t-range-slider">Range Slider</a>
                                    </div>
                                    <div class="col-md-6">
                                        <a class="dropdown-item" href="ui-progressbars.html" key="t-progress-bars">Progress Bars</a>
                                        <a class="dropdown-item" href="ui-sweet-alert.html" key="t-sweet-alert">Sweet-Alert</a>
                                        <a class="dropdown-item" href="ui-tabs-accordions.html" key="t-tabs-accordions">Tabs &amp; Accordions</a>
                                        <a class="dropdown-item" href="ui-typography.html" key="t-typography">Typography</a>
                                        <a class="dropdown-item" href="ui-general.html" key="t-general">General</a>
                                        <a class="dropdown-item" href="ui-rating.html" key="t-rating">Rating</a>
                                        <a class="dropdown-item" href="ui-notifications.html" key="t-notifications">Notifications</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown dropdown-mega d-none d-lg-block">
                            <button type="button" class="btn header-item waves-effect" data-toggle="dropdown" aria-haspopup="false" aria-expanded="false">
                                <span key="t-mega-menu">Mega menu</span>
                                <i class="mdi mdi-chevron-down"></i> 
                            </button>
                            <div class="dropdown-menu p-2 dropdown-megamenu">
                                <div class="row">
                                    <div class="col-xl-2 col-md-4">
                                        <h5 class="font-size-14 mx-4 mt-2" key="t-product">Product</h5>
                                        <a class="dropdown-item" href="#" key="t-headphones">Headphones</a>
                                        <a class="dropdown-item" href="#" key="t-mobiles">Mobiles</a>
                                        <a class="dropdown-item" href="#" key="t-mobile-covers">Mobile Covers</a>
                                        <a class="dropdown-item" href="#" key="t-charging">Charging</a>
                                        <a class="dropdown-item" href="#" key="t-power-bank">Power Bank</a>
                                        <a class="dropdown-item" href="#" key="t-t.v">T.V</a>
                                    </div>
                                    <div class="col-xl-2 col-md-4">
                                        <h5 class="font-size-14 ml-4 mt-2" key="t-brand">Brand</h5>
                                        <a class="dropdown-item" href="#" key="t-apple">Apple</a>
                                        <a class="dropdown-item" href="#" key="t-sony">Sony</a>
                                        <a class="dropdown-item" href="#" key="t-samsung">Samsung</a>
                                        <a class="dropdown-item" href="#" key="t-lg">LG</a>
                                        <a class="dropdown-item" href="#" key="t-oppo">Oppo</a>
                                        <a class="dropdown-item" href="#" key="t-gionee">Gionee</a>
                                    </div>
                                    <div class="col-xl-2 col-md-4">
                                        <h5 class="font-size-14 ml-4 mt-2" key="t-product-details">Product Details</h5>
                                        <p class="dropdown-item my-0" key="t-product-reviews">Product Reviews</p>
                                        <p class="dropdown-item my-0" key="t-multiple-colors">Multiple Colors</p>
                                        <p class="dropdown-item my-0" key="t-free-shipping">Free Shipping</p>
                                        <p class="dropdown-item my-0" key="t-easy-returns">Easy Returns</p>
                                        <p class="dropdown-item my-0" key="t-lowest-price">Lowest Price</p>
                                        <p class="dropdown-item my-0" key="t-payment-methods">Payment Methods</p>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="py-lg-2 pl-lg-2">
                                            <img src="assets/images/menu-product-1.jpg" alt="" class="img-fluid mx-auto rounded shadow">
                                        </div>
                                    </div>
                                    <div class="col-xl-3 col-md-6">
                                        <div class="py-lg-2 pr-lg-2">
                                            <img src="assets/images/menu-product-2.jpg" alt="" class="img-fluid mx-auto rounded shadow">
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown d-none d-lg-block">
                            <button type="button" class="btn header-item waves-effect" data-toggle="dropdown" aria-haspopup="false" aria-expanded="false">
                                <span key="t-shop">Shop</span>
                                <i class="mdi mdi-chevron-down"></i> 
                            </button>
                            <div class="dropdown-menu dropdown-menu-sm">
                                <a class="dropdown-item" href="#" key="t-login">Login</a>
                                <a class="dropdown-item" href="#" key="t-card">Card</a>
                                <a class="dropdown-item" href="#" key="t-product-Single">Product Single</a>
                                <a class="dropdown-item" href="#" key="t-checkout">Checkout</a>
                                <a class="dropdown-item" href="#" key="t-register">Register</a>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex">

                        <div class="dropdown d-inline-block language-switch">
                            <button type="button" class="btn header-item waves-effect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img id="header-lang-img" src="assets/images/flags/us.jpg" alt="Header Language" height="16">
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                    
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="eng">
                                    <img src="assets/images/flags/us.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">English</span>
                                </a>
                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="sp">
                                    <img src="assets/images/flags/spain.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Spanish</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="gr">
                                    <img src="assets/images/flags/germany.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">German</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="it">
                                    <img src="assets/images/flags/italy.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Italian</span>
                                </a>

                                <!-- item-->
                                <a href="javascript:void(0);" class="dropdown-item notify-item language" data-lang="ru">
                                    <img src="assets/images/flags/russia.jpg" alt="user-image" class="mr-1" height="12"> <span class="align-middle">Russian</span>
                                </a>
                            </div>
                        </div>

                        <div class="dropdown d-none d-lg-inline-block">
                            <button type="button" class="btn header-item noti-icon waves-effect" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-grid icon-sm"><rect x="3" y="3" width="7" height="7"></rect><rect x="14" y="3" width="7" height="7"></rect><rect x="14" y="14" width="7" height="7"></rect><rect x="3" y="14" width="7" height="7"></rect></svg>
                            </button>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right">
                                <div class="px-lg-2">
                                    <div class="row no-gutters">
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/github.png" alt="Github">
                                                <span key="t-gitHub">GitHub</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/bitbucket.png" alt="bitbucket">
                                                <span key="t-bitbucket">Bitbucket</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/dribbble.png" alt="dribbble">
                                                <span key="t-dribbble">Dribbble</span>
                                            </a>
                                        </div>
                                    </div>

                                    <div class="row no-gutters">
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/dropbox.png" alt="dropbox">
                                                <span key="t-dropbox">Dropbox</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/mail_chimp.png" alt="mail_chimp">
                                                <span key="t-mail-chimp">Mail Chimp</span>
                                            </a>
                                        </div>
                                        <div class="col">
                                            <a class="dropdown-icon-item" href="#">
                                                <img src="assets/images/brands/slack.png" alt="slack">
                                                <span key="t-slack">Slack</span>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item noti-icon waves-effect" id="page-header-notifications-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-bell icon-sm"><path d="M18 8A6 6 0 0 0 6 8c0 7-3 9-3 9h18s-3-2-3-9"></path><path d="M13.73 21a2 2 0 0 1-3.46 0"></path></svg>
                                <span class="noti-dot bg-danger"></span>
                            </button>
                            <div class="dropdown-menu dropdown-menu-lg dropdown-menu-right p-0" aria-labelledby="page-header-notifications-dropdown">
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
                                <div data-simplebar="init" style="max-height: 230px;"><div class="simplebar-wrapper" style="margin: 0px;"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset" style="right: 0px; bottom: 0px;"><div class="simplebar-content-wrapper" style="height: auto; overflow: hidden;"><div class="simplebar-content" style="padding: 0px;">
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
                                            <img src="assets/images/users/avatar-3.jpg" class="mr-3 rounded-circle avatar-xs" alt="user-pic">
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
                                            <img src="assets/images/users/avatar-4.jpg" class="mr-3 rounded-circle avatar-xs" alt="user-pic">
                                            <div class="media-body">
                                                <h6 class="mt-0 mb-1" key="t-salena-layfield">Salena Layfield</h6>
                                                <div class="font-size-12 text-muted">
                                                    <p class="mb-1" key="t-skeptical-occidental">As a skeptical Cambridge friend of mine occidental.</p>
                                                    <p class="mb-0" key="t-1-hours-ago"><i class="mdi mdi-clock-outline"></i> 1 hours ago</p>
                                                </div>
                                            </div>
                                        </div>
                                    </a>
                                </div></div></div></div><div class="simplebar-placeholder" style="width: 0px; height: 0px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div></div><div class="simplebar-track simplebar-vertical" style="visibility: hidden;"><div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div></div></div>
                                <div class="p-2 border-top">
                                    <a class="btn btn-sm btn-link font-size-14 btn-block text-center" href="javascript:void(0)">
                                        <i class="uil-arrow-circle-right mr-1"></i> <span key="t-view-more">View More..</span>
                                    </a>
                                </div>
                            </div>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                                <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-settings icon-sm"><circle cx="12" cy="12" r="3"></circle><path d="M19.4 15a1.65 1.65 0 0 0 .33 1.82l.06.06a2 2 0 0 1 0 2.83 2 2 0 0 1-2.83 0l-.06-.06a1.65 1.65 0 0 0-1.82-.33 1.65 1.65 0 0 0-1 1.51V21a2 2 0 0 1-2 2 2 2 0 0 1-2-2v-.09A1.65 1.65 0 0 0 9 19.4a1.65 1.65 0 0 0-1.82.33l-.06.06a2 2 0 0 1-2.83 0 2 2 0 0 1 0-2.83l.06-.06a1.65 1.65 0 0 0 .33-1.82 1.65 1.65 0 0 0-1.51-1H3a2 2 0 0 1-2-2 2 2 0 0 1 2-2h.09A1.65 1.65 0 0 0 4.6 9a1.65 1.65 0 0 0-.33-1.82l-.06-.06a2 2 0 0 1 0-2.83 2 2 0 0 1 2.83 0l.06.06a1.65 1.65 0 0 0 1.82.33H9a1.65 1.65 0 0 0 1-1.51V3a2 2 0 0 1 2-2 2 2 0 0 1 2 2v.09a1.65 1.65 0 0 0 1 1.51 1.65 1.65 0 0 0 1.82-.33l.06-.06a2 2 0 0 1 2.83 0 2 2 0 0 1 0 2.83l-.06.06a1.65 1.65 0 0 0-.33 1.82V9a1.65 1.65 0 0 0 1.51 1H21a2 2 0 0 1 2 2 2 2 0 0 1-2 2h-.09a1.65 1.65 0 0 0-1.51 1z"></path></svg>
                            </button>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="rounded-circle header-profile-user" src="assets/images/users/avatar-4.jpg" alt="Header Avatar">
                            </button>
                            <div class="dropdown-menu dropdown-menu-right">
                                <!-- item-->
                                <a class="dropdown-item" href="#"><i class="uil uil-user-circle font-size-16 align-middle text-muted mr-1"></i> <span class="align-middle" key="t-view"> View Profile</span></a>
                                <a class="dropdown-item" href="#"><i class="uil uil-wallet font-size-16 align-middle mr-1 text-muted"></i> <span class="align-middle" key="t-my-wallet"> My Wallet</span></a>
                                <a class="dropdown-item d-block" href="#"><i class="uil uil-cog font-size-16 align-middle mr-1 text-muted"></i> <span class="align-middle" key="t-settings"> Settings</span> <span class="badge badge-soft-success badge-pill mt-1 ml-2">03</span></a>
                                <a class="dropdown-item" href="#"><i class="uil uil-lock-alt font-size-16 align-middle mr-1 text-muted"></i> <span class="align-middle" key="t-lock-screen"> Lock screen</span></a>
                                <a class="dropdown-item" href="#"><i class="uil uil-sign-out-alt font-size-16 align-middle mr-1 text-muted"></i> <span class="align-middle" key="t-sign-out"> Sign out</span></a>
                            </div>
                        </div>
                    </div>
                </div>
            </header>
            <!-- ========== Left Sidebar Start ========== -->
            <div class="vertical-menu">

                <!-- LOGO -->
                <div class="navbar-brand-box">
                    <a href="index.html" class="logo logo-dark">
                        <span class="logo-sm">
                            <img src="assets/images/logo-dark-sm.png" alt="" height="22">
                        </span>
                        <span class="logo-lg">
                            <img src="assets/images/logo-dark.png" alt="" height="18">
                        </span>
                    </a>

                    <a href="index.html" class="logo logo-light">
                        <span class="logo-sm">
                            <img src="assets/images/logo-light-sm.png" alt="" height="22">
                        </span>
                        <span class="logo-lg">
                            <img src="assets/images/logo-light.png" alt="" height="18">
                        </span>
                    </a>
                </div>

                <button type="button" class="btn btn-sm px-3 font-size-16 header-item waves-effect vertical-menu-btn">
                    <i class="fa fa-fw fa-bars"></i>
                </button>

                <div data-simplebar="init" class="sidebar-menu-scroll"><div class="simplebar-wrapper" style="margin: 0px;"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset" style="right: 0px; bottom: 0px;"><div class="simplebar-content-wrapper" style="height: auto; overflow: hidden;"><div class="simplebar-content" style="padding: 0px;">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu" class="mm-active">
                        <!-- Left Menu Start -->
                        <ul class="metismenu list-unstyled mm-show" id="side-menu">
                            <li class="menu-title" key="t-menu">Menu</li>

                            <li>
                                <a href="javascript: void(0);" class="waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-home icon nav-icon"><path d="M3 9l9-7 9 7v11a2 2 0 0 1-2 2H5a2 2 0 0 1-2-2z"></path><polyline points="9 22 9 12 15 12 15 22"></polyline></svg>
                                    <span class="badge badge-pill badge-primary float-right">2</span>
                                    <span class="menu-item" key="t-dashboards">Dashboards</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="index.html" key="t-ecommerce">Ecommerce</a></li>
                                    <li><a href="dashboard-saas.html" key="t-saas">Saas</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-layout icon nav-icon"><rect x="3" y="3" width="18" height="18" rx="2" ry="2"></rect><line x1="3" y1="9" x2="21" y2="9"></line><line x1="9" y1="21" x2="9" y2="9"></line></svg>
                                    <span class="menu-item" key="t-layouts">Layouts</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="layouts-horizontal.html" key="t-horizontal">Horizontal</a></li>
                                    <li><a href="layouts-light-sidebar.html" key="t-light-sidebar">Light Sidebar</a></li>
                                    <li><a href="layouts-compact-sidebar.html" key="t-compact-sidebar">Compact Sidebar</a></li>
                                    <li><a href="layouts-icon-sidebar.html" key="t-icon-sidebar">Icon Sidebar</a></li>
                                    <li><a href="layouts-boxed.html" key="t-boxed-width">Boxed Width</a></li>
                                    <li><a href="layouts-preloader.html" key="t-preloader">Preloader</a></li>
                                    <li><a href="layouts-colored-sidebar.html" key="t-colored-sidebar">Colored Sidebar</a></li>
                                    <li><a href="layouts-scrollable.html" key="t-scrollable">Scrollable</a></li>
                                </ul>
                            </li>

                            <li class="menu-title" key="t-apps">Apps</li>

                            <li>
                                <a href="calendar.html" class="waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-calendar icon nav-icon"><rect x="3" y="4" width="18" height="18" rx="2" ry="2"></rect><line x1="16" y1="2" x2="16" y2="6"></line><line x1="8" y1="2" x2="8" y2="6"></line><line x1="3" y1="10" x2="21" y2="10"></line></svg>
                                    <span class="menu-item" key="t-calendar">Calendar</span>
                                </a>
                            </li>

                            <li>
                                <a href="chat.html" class=" waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-message-square icon nav-icon"><path d="M21 15a2 2 0 0 1-2 2H7l-4 4V5a2 2 0 0 1 2-2h14a2 2 0 0 1 2 2z"></path></svg>
                                    <span class="badge badge-pill badge-success float-right" key="t-new">New</span>
                                    <span class="menu-item" key="t-chat">Chat</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-shopping-bag icon nav-icon"><path d="M6 2L3 6v14a2 2 0 0 0 2 2h14a2 2 0 0 0 2-2V6l-3-4z"></path><line x1="3" y1="6" x2="21" y2="6"></line><path d="M16 10a4 4 0 0 1-8 0"></path></svg>
                                    <span class="menu-item" key="t-ecommerce">Ecommerce</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="ecommerce-products.html" key="t-products">Products</a></li>
                                    <li><a href="ecommerce-product-detail.html" key="t-product-detail">Product Detail</a></li>
                                    <li><a href="ecommerce-orders.html" key="t-orders">Orders</a></li>
                                    <li><a href="ecommerce-customers.html" key="t-customers">Customers</a></li>
                                    <li><a href="ecommerce-cart.html" key="t-cart">Cart</a></li>
                                    <li><a href="ecommerce-checkout.html" key="t-checkout">Checkout</a></li>
                                    <li><a href="ecommerce-shops.html" key="t-shops">Shops</a></li>
                                    <li><a href="ecommerce-add-product.html" key="t-add-product">Add Product</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-mail icon nav-icon"><path d="M4 4h16c1.1 0 2 .9 2 2v12c0 1.1-.9 2-2 2H4c-1.1 0-2-.9-2-2V6c0-1.1.9-2 2-2z"></path><polyline points="22,6 12,13 2,6"></polyline></svg>
                                    <span class="menu-item" key="t-email">Email</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="email-inbox.html" key="t-inbox">Inbox</a></li>
                                    <li><a href="email-read.html" key="t-read-email">Read Email</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file icon nav-icon"><path d="M13 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V9z"></path><polyline points="13 2 13 9 20 9"></polyline></svg>
                                    <span class="menu-item" key="t-invoices">Invoices</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="invoices-list.html" key="t-invoice-list">Invoice List</a></li>
                                    <li><a href="invoices-detail.html" key="t-invoice-detail">Invoice Detail</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-book icon nav-icon"><path d="M4 19.5A2.5 2.5 0 0 1 6.5 17H20"></path><path d="M6.5 2H20v20H6.5A2.5 2.5 0 0 1 4 19.5v-15A2.5 2.5 0 0 1 6.5 2z"></path></svg>
                                    <span class="menu-item" key="t-contacts">Contacts</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="contacts-grid.html" key="t-user-grid">User Grid</a></li>
                                    <li><a href="contacts-list.html" key="t-user-list">User List</a></li>
                                    <li><a href="contacts-profile.html" key="t-profile">Profile</a></li>
                                </ul>
                            </li>

                            <li class="menu-title" key="t-pages">Pages</li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-user icon nav-icon"><path d="M20 21v-2a4 4 0 0 0-4-4H8a4 4 0 0 0-4 4v2"></path><circle cx="12" cy="7" r="4"></circle></svg>
                                    <span class="menu-item" key="t-authentication">Authentication</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="auth-login.html" key="t-login">Login</a></li>
                                    <li><a href="auth-register.html" key="t-register">Register</a></li>
                                    <li><a href="auth-recoverpw.html" key="t-recover-password">Recover Password</a></li>
                                    <li><a href="auth-lock-screen.html" key="t-lock-screen">Lock Screen</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-file-text icon nav-icon"><path d="M14 2H6a2 2 0 0 0-2 2v16a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V8z"></path><polyline points="14 2 14 8 20 8"></polyline><line x1="16" y1="13" x2="8" y2="13"></line><line x1="16" y1="17" x2="8" y2="17"></line><polyline points="10 9 9 9 8 9"></polyline></svg>
                                    <span class="menu-item" key="t-utility">Utility</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="pages-starter.html" key="t-starter-page">Starter Page</a></li>
                                    <li><a href="pages-maintenance.html" key="t-maintenance">Maintenance</a></li>
                                    <li><a href="pages-comingsoon.html" key="t-coming-soon">Coming Soon</a></li>
                                    <li><a href="pages-timeline.html" key="t-timeline">Timeline</a></li>
                                    <li><a href="pages-faqs.html" key="t-faqs">FAQs</a></li>
                                    <li><a href="pages-pricing.html" key="t-pricing">Pricing</a></li>
                                    <li><a href="pages-404.html" key="t-error-404">Error 404</a></li>
                                    <li><a href="pages-500.html" key="t-error-500">Error 500</a></li>
                                </ul>
                            </li>

                            <li class="menu-title" c="">Components</li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-gift icon nav-icon"><polyline points="20 12 20 22 4 22 4 12"></polyline><rect x="2" y="7" width="20" height="5"></rect><line x1="12" y1="22" x2="12" y2="7"></line><path d="M12 7H7.5a2.5 2.5 0 0 1 0-5C11 2 12 7 12 7z"></path><path d="M12 7h4.5a2.5 2.5 0 0 0 0-5C13 2 12 7 12 7z"></path></svg>
                                    <span class="menu-item" key="t-ui-elements">UI Elements</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="ui-alerts.html" key="t-alerts">Alerts</a></li>
                                    <li><a href="ui-buttons.html" key="t-buttons">Buttons</a></li>
                                    <li><a href="ui-cards.html" key="t-cards">Cards</a></li>
                                    <li><a href="ui-carousel.html" key="t-carousel">Carousel</a></li>
                                    <li><a href="ui-dropdowns.html" key="t-dropdowns">Dropdowns</a></li>
                                    <li><a href="ui-grid.html" key="t-grid">Grid</a></li>
                                    <li><a href="ui-images.html" key="t-images">Images</a></li>
                                    <li><a href="ui-lightbox.html" key="t-lightbox">Lightbox</a></li>
                                    <li><a href="ui-modals.html" key="t-modals">Modals</a></li>
                                    <li><a href="ui-rangeslider.html" key="t-range-slider">Range Slider</a></li>
                                    <li><a href="ui-session-timeout.html" key="t-session-timeout">Session Timeout</a></li>
                                    <li><a href="ui-progressbars.html" key="t-progress-bars">Progress Bars</a></li>
                                    <li><a href="ui-sweet-alert.html" key="t-sweet-alert">Sweet-Alert</a></li>
                                    <li><a href="ui-tabs-accordions.html" key="t-tabs-accordions">Tabs &amp; Accordions</a></li>
                                    <li><a href="ui-typography.html" key="t-typography">Typography</a></li>
                                    <li><a href="ui-video.html" key="t-video">Video</a></li>
                                    <li><a href="ui-general.html" key="t-general">General</a></li>
                                    <li><a href="ui-colors.html" key="t-colors">Colors</a></li>
                                    <li><a href="ui-rating.html" key="t-rating">Rating</a></li>
                                    <li><a href="ui-notifications.html" key="t-notifications">Notifications</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-edit-3 icon nav-icon"><path d="M12 20h9"></path><path d="M16.5 3.5a2.121 2.121 0 0 1 3 3L7 19l-4 1 1-4L16.5 3.5z"></path></svg>
                                    <span class="badge badge-pill badge-info float-right">9</span>
                                    <span class="menu-item" key="t-forms">Forms</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="form-elements.html" key="t-basic-elements">Basic Elements</a></li>
                                    <li><a href="form-validation.html" key="t-validation">Validation</a></li>
                                    <li><a href="form-advanced.html" key="t-advanced-plugins">Advanced Plugins</a></li>
                                    <li><a href="form-editors.html" key="t-editors">Editors</a></li>
                                    <li><a href="form-uploads.html" key="t-file-upload">File Upload</a></li>
                                    <li><a href="form-xeditable.html" key="t-xeditable">Xeditable</a></li>
                                    <li><a href="form-repeater.html" key="t-repeater">Repeater</a></li>
                                    <li><a href="form-wizard.html" key="t-wizard">Wizard</a></li>
                                    <li><a href="form-mask.html" key="t-mask">Mask</a></li>
                                </ul>
                            </li>

                            <li class="mm-active">
                                <a href="javascript: void(0);" class="has-arrow waves-effect mm-active">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-database icon nav-icon"><ellipse cx="12" cy="5" rx="9" ry="3"></ellipse><path d="M21 12c0 1.66-4 3-9 3s-9-1.34-9-3"></path><path d="M3 5v14c0 1.66 4 3 9 3s9-1.34 9-3V5"></path></svg>
                                    <span class="menu-item" key="t-tables">Tables</span>
                                </a>
                                <ul class="sub-menu mm-collapse mm-show" aria-expanded="false">
                                    <li><a href="tables-basic.html" key="t-bootstrap-basic">Bootstrap Basic</a></li>
                                    <li><a href="tables-datatable.html" key="t-datatables">Datatables</a></li>
                                    <li class="mm-active"><a href="tables-responsive.html" key="t-responsive" class="active">Responsive</a></li>
                                    <li><a href="tables-editable.html" key="t-editable">Editable</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-pie-chart icon nav-icon"><path d="M21.21 15.89A10 10 0 1 1 8 2.83"></path><path d="M22 12A10 10 0 0 0 12 2v10z"></path></svg>
                                    <span class="menu-item" key="t-charts">Charts</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="charts-apex.html" key="t-apex">Apex</a></li>
                                    <li><a href="charts-chartjs.html" key="t-chartjs">Chartjs</a></li>
                                    <li><a href="charts-flot.html" key="t-flot">Flot</a></li>
                                    <li><a href="charts-knob.html" key="t-jquery-knob">Jquery Knob</a></li>
                                    <li><a href="charts-sparkline.html" key="t-sparkline">Sparkline</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-archive icon nav-icon"><polyline points="21 8 21 21 3 21 3 8"></polyline><rect x="1" y="3" width="22" height="5"></rect><line x1="10" y1="12" x2="14" y2="12"></line></svg>
                                    <span class="menu-item" key="t-icons">Icons</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="icons-unicons.html" key="t-unicons">Unicons</a></li>
                                    <li><a href="icons-feathericons.html" key="t-feather-icons">Feather icons</a></li>
                                    <li><a href="icons-boxicons.html" key="t-boxicons">Boxicons</a></li>
                                    <li><a href="icons-materialdesign.html" key="t-material-design">Material Design</a></li>
                                    <li><a href="icons-dripicons.html" key="t-dripicons">Dripicons</a></li>
                                    <li><a href="icons-fontawesome.html" key="t-font-awesome">Font Awesome</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-map-pin icon nav-icon"><path d="M21 10c0 7-9 13-9 13s-9-6-9-13a9 9 0 0 1 18 0z"></path><circle cx="12" cy="10" r="3"></circle></svg>
                                    <span class="menu-item" key="t-maps">Maps</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="false">
                                    <li><a href="maps-google.html" key="t-google">Google</a></li>
                                    <li><a href="maps-vector.html" key="t-vector">Vector</a></li>
                                    <li><a href="maps-leaflet.html" key="t-leaflet">Leaflet</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24" viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2" stroke-linecap="round" stroke-linejoin="round" class="feather feather-share-2 icon nav-icon"><circle cx="18" cy="5" r="3"></circle><circle cx="6" cy="12" r="3"></circle><circle cx="18" cy="19" r="3"></circle><line x1="8.59" y1="13.51" x2="15.42" y2="17.49"></line><line x1="15.41" y1="6.51" x2="8.59" y2="10.49"></line></svg>
                                    <span class="menu-item" key="t-multi-level">Multi Level</span>
                                </a>
                                <ul class="sub-menu mm-collapse" aria-expanded="true">
                                    <li><a href="javascript: void(0);" key="t-level-1.1">Level 1.1</a></li>
                                    <li><a href="javascript: void(0);" class="has-arrow" key="t-level-1.2">Level 1.2</a>
                                        <ul class="sub-menu mm-collapse" aria-expanded="true">
                                            <li><a href="javascript: void(0);" key="t-level-2.1">Level 2.1</a></li>
                                            <li><a href="javascript: void(0);" key="t-level-2.2">Level 2.2</a></li>
                                        </ul>
                                    </li>
                                </ul>
                            </li>

                        </ul>
                    </div>
                    <!-- Sidebar -->
                </div></div></div></div><div class="simplebar-placeholder" style="width: 0px; height: 0px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div></div><div class="simplebar-track simplebar-vertical" style="visibility: hidden;"><div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div></div></div>
            </div>
            <!-- Left Sidebar End -->

            

            <!-- ============================================================== -->
            <!-- Start right Content here -->
            <!-- ============================================================== -->
            <div class="main-content">

                <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0">Responsive</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Tables</a></li>
                                            <li class="breadcrumb-item active">Responsive</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
        
                                        <h4 class="card-title">Example</h4>
                                        <p class="card-title-desc">This is an experimental awesome solution for responsive tables with complex data.</p>
        
                                        <div class="table-rep-plugin">
                                            <div class="table-wrapper"><div class="btn-toolbar"><div class="btn-group focus-btn-group"><button type="button" class="btn btn-default"><span class="glyphicon glyphicon-screenshot"></span> Focus</button></div><div class="btn-group dropdown-btn-group pull-right"><button type="button" class="btn btn-default btn-primary">Display all</button><button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" aria-expanded="false">Display <span class="caret"></span></button><ul class="dropdown-menu" style=""><li class="checkbox-row"><input type="checkbox" name="toggle-tech-companies-1-col-1" id="toggle-tech-companies-1-col-1" value="tech-companies-1-col-1"> <label for="toggle-tech-companies-1-col-1">Last Trade</label></li><li class="checkbox-row"><input type="checkbox" name="toggle-tech-companies-1-col-2" id="toggle-tech-companies-1-col-2" value="tech-companies-1-col-2"> <label for="toggle-tech-companies-1-col-2">Trade Time</label></li><li class="checkbox-row"><input type="checkbox" name="toggle-tech-companies-1-col-3" id="toggle-tech-companies-1-col-3" value="tech-companies-1-col-3"> <label for="toggle-tech-companies-1-col-3">Change</label></li><li class="checkbox-row"><input type="checkbox" name="toggle-tech-companies-1-col-4" id="toggle-tech-companies-1-col-4" value="tech-companies-1-col-4"> <label for="toggle-tech-companies-1-col-4">Prev Close</label></li><li class="checkbox-row"><input type="checkbox" name="toggle-tech-companies-1-col-5" id="toggle-tech-companies-1-col-5" value="tech-companies-1-col-5"> <label for="toggle-tech-companies-1-col-5">Open</label></li><li class="checkbox-row"><input type="checkbox" name="toggle-tech-companies-1-col-6" id="toggle-tech-companies-1-col-6" value="tech-companies-1-col-6"> <label for="toggle-tech-companies-1-col-6">Bid</label></li><li class="checkbox-row"><input type="checkbox" name="toggle-tech-companies-1-col-7" id="toggle-tech-companies-1-col-7" value="tech-companies-1-col-7"> <label for="toggle-tech-companies-1-col-7">Ask</label></li><li class="checkbox-row"><input type="checkbox" name="toggle-tech-companies-1-col-8" id="toggle-tech-companies-1-col-8" value="tech-companies-1-col-8"> <label for="toggle-tech-companies-1-col-8">1y Target Est</label></li></ul></div></div><div class="table-responsive mb-0 fixed-solution" data-pattern="priority-columns">
                                                <div class="sticky-table-header" style="height: 46.6094px; visibility: hidden; width: auto; top: -1px;"><table id="tech-companies-1-clone" class="table display-all">
                                                    <thead>
                                                    <tr>
                                                        <th id="tech-companies-1-col-0-clone">Company</th>
                                                        <th data-priority="1" id="tech-companies-1-col-1-clone">Last Trade</th>
                                                        <th data-priority="3" id="tech-companies-1-col-2-clone">Trade Time</th>
                                                        <th data-priority="1" id="tech-companies-1-col-3-clone">Change</th>
                                                        <th data-priority="3" id="tech-companies-1-col-4-clone">Prev Close</th>
                                                        <th data-priority="3" id="tech-companies-1-col-5-clone">Open</th>
                                                        <th data-priority="6" id="tech-companies-1-col-6-clone">Bid</th>
                                                        <th data-priority="6" id="tech-companies-1-col-7-clone">Ask</th>
                                                        <th data-priority="6" id="tech-companies-1-col-8-clone">1y Target Est</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    <!-- Repeat -->
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    <!-- Repeat -->
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    <!-- Repeat -->
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    <!-- Repeat -->
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    </tbody>
                                                </table></div><table id="tech-companies-1" class="table display-all">
                                                    <thead>
                                                    <tr>
                                                        <th id="tech-companies-1-col-0">Company</th>
                                                        <th data-priority="1" id="tech-companies-1-col-1">Last Trade</th>
                                                        <th data-priority="3" id="tech-companies-1-col-2">Trade Time</th>
                                                        <th data-priority="1" id="tech-companies-1-col-3">Change</th>
                                                        <th data-priority="3" id="tech-companies-1-col-4">Prev Close</th>
                                                        <th data-priority="3" id="tech-companies-1-col-5">Open</th>
                                                        <th data-priority="6" id="tech-companies-1-col-6">Bid</th>
                                                        <th data-priority="6" id="tech-companies-1-col-7">Ask</th>
                                                        <th data-priority="6" id="tech-companies-1-col-8">1y Target Est</th>
                                                    </tr>
                                                    </thead>
                                                    <tbody>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    <!-- Repeat -->
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    <!-- Repeat -->
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    <!-- Repeat -->
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    <!-- Repeat -->
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">GOOG <span class="co-name">Google Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">597.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:12PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">14.81 (2.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">582.93</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">597.95</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">597.73 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">597.91 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">731.10</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AAPL <span class="co-name">Apple Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">378.94</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:22PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">5.74 (1.54%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">373.20</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">381.02</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">378.92 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">378.99 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">505.94</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">AMZN <span class="co-name">Amazon.com Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">191.55</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:23PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">3.16 (1.68%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">188.39</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">194.99</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">191.52 x 300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">191.58 x 100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">240.32</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">ORCL <span class="co-name">Oracle Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">31.15</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:44PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">1.41 (4.72%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">29.74</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">30.67</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">31.14 x 6500</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">31.15 x 3200</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">36.11</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">MSFT <span class="co-name">Microsoft Corporation</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">25.50</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:27PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.66 (2.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">24.84</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">25.37</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">25.50 x 71100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">25.51 x 17800</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">31.50</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">CSCO <span class="co-name">Cisco Systems, Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">18.65</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:45PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.97 (5.49%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">17.68</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">18.23</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">18.65 x 10300</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">18.66 x 24000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">21.12</td>
                                                    </tr>
                                                    <tr>
                                                        <th data-org-colspan="1" data-columns="tech-companies-1-col-0">YHOO <span class="co-name">Yahoo! Inc.</span></th>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-1">15.81</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-2">12:25PM</td>
                                                        <td data-org-colspan="1" data-priority="1" data-columns="tech-companies-1-col-3">0.11 (0.67%)</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-4">15.70</td>
                                                        <td data-org-colspan="1" data-priority="3" data-columns="tech-companies-1-col-5">15.94</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-6">15.79 x 6100</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-7">15.80 x 17000</td>
                                                        <td data-org-colspan="1" data-priority="6" data-columns="tech-companies-1-col-8">18.16</td>
                                                    </tr>
                                                    </tbody>
                                                </table>
                                            </div></div>
        
                                        </div>
        
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->
                        
                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

                
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <script>document.write(new Date().getFullYear())</script>2024 © Drezon.
                            </div>
                            <div class="col-sm-6">
                                <div class="text-sm-right d-none d-sm-block">
                                    Crafted with <i class="mdi mdi-heart text-danger"></i> by <a href="https://themesbrand.com/" target="_blank" class="text-reset">Themesbrand</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </footer>
            </div>
            <!-- end main content-->

        </div>
        <!-- END layout-wrapper -->

        <!-- Right Sidebar -->
        <div class="right-bar">
            <div data-simplebar="init" class="h-100"><div class="simplebar-wrapper" style="margin: 0px;"><div class="simplebar-height-auto-observer-wrapper"><div class="simplebar-height-auto-observer"></div></div><div class="simplebar-mask"><div class="simplebar-offset" style="right: -18.8889px; bottom: 0px;"><div class="simplebar-content-wrapper" style="height: 100%; overflow: hidden scroll;"><div class="simplebar-content" style="padding: 0px;">
                <div class="rightbar-title px-3 py-4">
                    <a href="javascript:void(0);" class="right-bar-toggle float-right">
                        <i class="mdi mdi-close noti-icon"></i>
                    </a>
                    <h5 class="m-0">Settings</h5>
                </div>

                <!-- Settings -->
                <hr class="mt-0">
                <h6 class="text-center mb-0">Choose Layouts</h6>

                <div class="p-4">
                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-1.jpg" class="img-fluid img-thumbnail" alt="">
                    </div>
                    <div class="custom-control custom-switch mb-3">
                        <input type="checkbox" class="custom-control-input theme-choice" id="light-mode-switch" checked="">
                        <label class="custom-control-label" for="light-mode-switch">Light Mode</label>
                    </div>
    
                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-2.jpg" class="img-fluid img-thumbnail" alt="">
                    </div>
                    <div class="custom-control custom-switch mb-3">
                        <input type="checkbox" class="custom-control-input theme-choice" id="dark-mode-switch" data-bsstyle="assets/css/bootstrap-dark.min.css" data-appstyle="assets/css/app-dark.min.css">
                        <label class="custom-control-label" for="dark-mode-switch">Dark Mode</label>
                    </div>
    
                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-3.jpg" class="img-fluid img-thumbnail" alt="">
                    </div>
                    <div class="custom-control custom-switch mb-5">
                        <input type="checkbox" class="custom-control-input theme-choice" id="rtl-mode-switch" data-appstyle="assets/css/app-rtl.min.css">
                        <label class="custom-control-label" for="rtl-mode-switch">RTL Mode</label>
                    </div>

            
                </div>

            </div></div></div></div><div class="simplebar-placeholder" style="width: auto; height: 839px;"></div></div><div class="simplebar-track simplebar-horizontal" style="visibility: hidden;"><div class="simplebar-scrollbar" style="transform: translate3d(0px, 0px, 0px); display: none;"></div></div><div class="simplebar-track simplebar-vertical" style="visibility: visible;"><div class="simplebar-scrollbar" style="height: 359px; transform: translate3d(0px, 0px, 0px); display: block;"></div></div></div> <!-- end slimscroll-menu-->
        </div>
        <!-- /Right-bar -->

        <!-- Right bar overlay-->
        <div class="rightbar-overlay"></div>

        <!-- JAVASCRIPT -->
        <script src="assets/libs/jquery/jquery.min.js"></script>
        <script src="assets/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="assets/libs/metismenu/metisMenu.min.js"></script>
        <script src="assets/libs/simplebar/simplebar.min.js"></script>
        <script src="assets/libs/node-waves/waves.min.js"></script>
        <script src="assets/libs/waypoints/lib/jquery.waypoints.min.js"></script>
        <script src="assets/libs/jquery.counterup/jquery.counterup.min.js"></script>
        <script src="assets/libs/feather-icons/feather.min.js"></script>

        <!-- Responsive Table js -->
        <script src="assets/libs/admin-resources/rwd-table/rwd-table.min.js"></script>

        <!-- Init js -->
        <script src="assets/js/pages/table-responsive.init.js"></script>

        <script src="assets/js/app.js"></script>

    <!-- Code injected by live-server -->
<script>
	// <![CDATA[  <-- For SVG support
	if ('WebSocket' in window) {
		(function () {
			function refreshCSS() {
				var sheets = [].slice.call(document.getElementsByTagName("link"));
				var head = document.getElementsByTagName("head")[0];
				for (var i = 0; i < sheets.length; ++i) {
					var elem = sheets[i];
					var parent = elem.parentElement || head;
					parent.removeChild(elem);
					var rel = elem.rel;
					if (elem.href && typeof rel != "string" || rel.length == 0 || rel.toLowerCase() == "stylesheet") {
						var url = elem.href.replace(/(&|\?)_cacheOverride=\d+/, '');
						elem.href = url + (url.indexOf('?') >= 0 ? '&' : '?') + '_cacheOverride=' + (new Date().valueOf());
					}
					parent.appendChild(elem);
				}
			}
			var protocol = window.location.protocol === 'http:' ? 'ws://' : 'wss://';
			var address = protocol + window.location.host + window.location.pathname + '/ws';
			var socket = new WebSocket(address);
			socket.onmessage = function (msg) {
				if (msg.data == 'reload') window.location.reload();
				else if (msg.data == 'refreshcss') refreshCSS();
			};
			if (sessionStorage && !sessionStorage.getItem('IsThisFirstTime_Log_From_LiveServer')) {
				console.log('Live reload enabled.');
				sessionStorage.setItem('IsThisFirstTime_Log_From_LiveServer', true);
			}
		})();
	}
	else {
		console.error('Upgrade your browser. This Browser is NOT supported WebSocket for Live-Reloading.');
	}
	// ]]>
</script>


</body></html>



</body>
</html>