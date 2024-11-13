<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>

    <head>
        
        <meta charset="utf-8" />
        <title>Profile | Drezon - Responsive Bootstrap 4 Admin Dashboard</title>
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <meta content="Premium Multipurpose Admin & Dashboard Template" name="description" />
        <meta content="Themesbrand" name="author" />
        <!-- App favicon -->
        <link rel="shortcut icon" href="assets/images/favicon.ico">

        <!-- Bootstrap Css -->
        <link href="assets/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="assets/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="assets/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />

    </head>

    
    <body data-sidebar="dark">

    <!-- <body data-layout="horizontal" data-topbar="colored"> -->

		
        <!-- Begin page -->
        <div id="layout-wrapper">

  	<!-- header 시작 -->
		<jsp:include page="/WEB-INF/views/common/header.jsp" />
    <!-- header 끝 -->


		<!-- sidebar 시작 -->
		<jsp:include page="/WEB-INF/views/common/sidebar.jsp" />				
		<!-- sidebar 끝 -->		
            
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
                                        <a class="dropdown-item" href="ui-alerts.html" key="t-alerts"></i>Alerts</a>
                                        <a class="dropdown-item" href="ui-buttons.html" key="t-buttons">Buttons</a>
                                        <a class="dropdown-item" href="ui-cards.html" key="t-cards">Cards</a>
                                        <a class="dropdown-item" href="ui-dropdowns.html" key="t-dropdowns">Dropdowns</a>
                                        <a class="dropdown-item" href="ui-lightbox.html" key="t-lightbox">Lightbox</a>
                                        <a class="dropdown-item" href="ui-modals.html" key="t-modals">Modals</a>
                                        <a class="dropdown-item" href="ui-rangeslider.html" key="t-range-slider">Range Slider</a>
                                    </div>
                                    <div class="col-md-6">
                                        <a class="dropdown-item" href="ui-progressbars.html" key="t-progress-bars"></i>Progress Bars</a>
                                        <a class="dropdown-item" href="ui-sweet-alert.html" key="t-sweet-alert">Sweet-Alert</a>
                                        <a class="dropdown-item" href="ui-tabs-accordions.html" key="t-tabs-accordions">Tabs & Accordions</a>
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
                                        <a class="dropdown-item" href="#" key="t-headphones"></i>Headphones</a>
                                        <a class="dropdown-item" href="#" key="t-mobiles"></i>Mobiles</a>
                                        <a class="dropdown-item" href="#" key="t-mobile-covers"></i>Mobile Covers</a>
                                        <a class="dropdown-item" href="#" key="t-charging"></i>Charging</a>
                                        <a class="dropdown-item" href="#" key="t-power-bank"></i>Power Bank</a>
                                        <a class="dropdown-item" href="#" key="t-t.v"></i>T.V</a>
                                    </div>
                                    <div class="col-xl-2 col-md-4">
                                        <h5 class="font-size-14 ml-4 mt-2" key="t-brand">Brand</h5>
                                        <a class="dropdown-item" href="#" key="t-apple"></i>Apple</a>
                                        <a class="dropdown-item" href="#" key="t-sony"></i>Sony</a>
                                        <a class="dropdown-item" href="#" key="t-samsung"></i>Samsung</a>
                                        <a class="dropdown-item" href="#" key="t-lg"></i>LG</a>
                                        <a class="dropdown-item" href="#" key="t-oppo"></i>Oppo</a>
                                        <a class="dropdown-item" href="#" key="t-gionee"></i>Gionee</a>
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
                                <a class="dropdown-item" href="#" key="t-login"></i>Login</a>
                                <a class="dropdown-item" href="#" key="t-card"></i>Card</a>
                                <a class="dropdown-item" href="#" key="t-product-Single"></i>Product Single</a>
                                <a class="dropdown-item" href="#" key="t-checkout"></i>Checkout</a>
                                <a class="dropdown-item" href="#" key="t-register"></i>Register</a>
                            </div>
                        </div>
                    </div>

                    <div class="d-flex">

                        <div class="dropdown d-inline-block language-switch">
                            <button type="button" class="btn header-item waves-effect"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
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
                            <button type="button" class="btn header-item noti-icon waves-effect"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <i class="icon-sm" data-feather="grid"></i>
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
                                            <img src="assets/images/users/avatar-3.jpg"
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
                                            <img src="assets/images/users/avatar-4.jpg"
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

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item noti-icon right-bar-toggle waves-effect">
                                <i class="icon-sm" data-feather="settings"></i>
                            </button>
                        </div>

                        <div class="dropdown d-inline-block">
                            <button type="button" class="btn header-item waves-effect" id="page-header-user-dropdown"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                <img class="rounded-circle header-profile-user" src="assets/images/users/avatar-4.jpg"
                                    alt="Header Avatar">
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

                <div data-simplebar class="sidebar-menu-scroll">

                    <!--- Sidemenu -->
                    <div id="sidebar-menu">
                        <!-- Left Menu Start -->
                        <ul class="metismenu list-unstyled" id="side-menu">
                            <li class="menu-title" key="t-menu">Menu</li>

                            <li>
                                <a href="javascript: void(0);" class="waves-effect">
                                    <i class="icon nav-icon" data-feather="home"></i>
                                    <span class="badge badge-pill badge-primary float-right">2</span>
                                    <span class="menu-item" key="t-dashboards">Dashboards</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="index.html" key="t-ecommerce">Ecommerce</a></li>
                                    <li><a href="dashboard-saas.html" key="t-saas">Saas</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="layout"></i>
                                    <span class="menu-item" key="t-layouts">Layouts</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
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
                                    <i class="icon nav-icon" data-feather="calendar"></i>
                                    <span class="menu-item" key="t-calendar">Calendar</span>
                                </a>
                            </li>

                            <li>
                                <a href="chat.html" class=" waves-effect">
                                    <i class="icon nav-icon" data-feather="message-square"></i>
                                    <span class="badge badge-pill badge-success float-right" key="t-new">New</span>
                                    <span class="menu-item" key="t-chat">Chat</span>
                                </a>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="shopping-bag"></i>
                                    <span class="menu-item" key="t-ecommerce">Ecommerce</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
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
                                    <i class="icon nav-icon" data-feather="mail"></i>
                                    <span class="menu-item" key="t-email">Email</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="email-inbox.html" key="t-inbox">Inbox</a></li>
                                    <li><a href="email-read.html" key="t-read-email">Read Email</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="file"></i>
                                    <span class="menu-item" key="t-invoices">Invoices</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="invoices-list.html" key="t-invoice-list">Invoice List</a></li>
                                    <li><a href="invoices-detail.html" key="t-invoice-detail">Invoice Detail</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="book"></i>
                                    <span class="menu-item" key="t-contacts">Contacts</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="contacts-grid.html" key="t-user-grid">User Grid</a></li>
                                    <li><a href="contacts-list.html" key="t-user-list">User List</a></li>
                                    <li><a href="contacts-profile.html" key="t-profile">Profile</a></li>
                                </ul>
                            </li>

                            <li class="menu-title" key="t-pages">Pages</li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="user"></i>
                                    <span class="menu-item" key="t-authentication">Authentication</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="auth-login.html" key="t-login">Login</a></li>
                                    <li><a href="auth-register.html" key="t-register">Register</a></li>
                                    <li><a href="auth-recoverpw.html" key="t-recover-password">Recover Password</a></li>
                                    <li><a href="auth-lock-screen.html" key="t-lock-screen">Lock Screen</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="file-text"></i>
                                    <span class="menu-item" key="t-utility">Utility</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
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

                            <li class="menu-title" c>Components</li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="gift"></i>
                                    <span class="menu-item" key="t-ui-elements">UI Elements</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
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
                                    <li><a href="ui-tabs-accordions.html" key="t-tabs-accordions">Tabs & Accordions</a></li>
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
                                    <i class="icon nav-icon" data-feather="edit-3"></i>
                                    <span class="badge badge-pill badge-info float-right">9</span>
                                    <span class="menu-item" key="t-forms">Forms</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
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

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="database"></i>
                                    <span class="menu-item" key="t-tables">Tables</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="tables-basic.html" key="t-bootstrap-basic">Bootstrap Basic</a></li>
                                    <li><a href="tables-datatable.html" key="t-datatables">Datatables</a></li>
                                    <li><a href="tables-responsive.html" key="t-responsive">Responsive</a></li>
                                    <li><a href="tables-editable.html" key="t-editable">Editable</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="pie-chart"></i>
                                    <span class="menu-item" key="t-charts">Charts</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="charts-apex.html" key="t-apex">Apex</a></li>
                                    <li><a href="charts-chartjs.html" key="t-chartjs">Chartjs</a></li>
                                    <li><a href="charts-flot.html" key="t-flot">Flot</a></li>
                                    <li><a href="charts-knob.html" key="t-jquery-knob">Jquery Knob</a></li>
                                    <li><a href="charts-sparkline.html" key="t-sparkline">Sparkline</a></li>
                                </ul>
                            </li>

                            <li>
                                <a href="javascript: void(0);" class="has-arrow waves-effect">
                                    <i class="icon nav-icon" data-feather="archive"></i>
                                    <span class="menu-item" key="t-icons">Icons</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
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
                                    <i class="icon nav-icon" data-feather="map-pin"></i>
                                    <span class="menu-item" key="t-maps">Maps</span>
                                </a>
                                <ul class="sub-menu" aria-expanded="false">
                                    <li><a href="maps-google.html" key="t-google">Google</a></li>
                                    <li><a href="maps-vector.html" key="t-vector">Vector</a></li>
                                    <li><a href="maps-leaflet.html" key="t-leaflet">Leaflet</a></li>
                                </ul>
                            </li>

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
                                    <h4 class="mb-0">Profile</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Contacts</a></li>
                                            <li class="breadcrumb-item active">Profile</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-xl-3">
                                <div class="card">
                                    <div class="card-body">
                                        <div class="dropdown float-right">
                                            <a class="text-body dropdown-toggle font-size-18" href="#" role="button" data-toggle="dropdown" aria-haspopup="true">
                                              <i class="uil uil-ellipsis-v"></i>
                                            </a>
                                          
                                            <div class="dropdown-menu dropdown-menu-right">
                                                <a class="dropdown-item" href="#">Edit</a>
                                                <a class="dropdown-item" href="#">Action</a>
                                                <a class="dropdown-item" href="#">Remove</a>
                                            </div>
                                        </div>
                                        <div class="text-center mt-3 mb-4">
                                            <div class="avatar-xl rounded-circle p-2 border border-soft-primary mx-auto">
                                                <img src="assets/images/users/avatar-4.jpg" alt="" class="img-fluid rounded-circle">
                                            </div>
                                            <h5 class="mt-4 mb-2">Marie Hensley</h5>
                                            <p class="text-muted"><i class="icon-xs mr-1 icon" data-feather="monitor"></i> Web Developer</p>
                                        </div>
                                        <div class="row justify-content-center mt-4 pt-2">
                                            <div class="col-3">
                                                <a href="#">
                                                    <div class="avatar mx-auto">
                                                        <div class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                            <i class="icon-sm" data-feather="mail"></i>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-3">
                                                <a href="#">
                                                    <div class="avatar mx-auto">
                                                        <div class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                            <i class="icon-sm" data-feather="phone"></i>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                            <div class="col-3">
                                                <a href="#">
                                                    <div class="avatar mx-auto">
                                                        <div class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                            <i class="icon-sm" data-feather="globe"></i>
                                                        </div>
                                                    </div>
                                                </a>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title mb-4">Projects</h4>

                                        <h5 class="mb-2">UI/UX Design Updates</h5>
                                        <p class="text-muted">Reached 20,450 sales</p>
                                        <div class=" mt-4">
                                            <h6 class="mb-0 float-right">70/100</h6>
                                            <h6 class="mb-3"><i class="icon-xs icon text-muted mr-1" data-feather="list"></i>Progress</h6>
                                        </div>
                                        <div class="progress" style="height: 8px;">
                                            <div class="progress-bar" role="progressbar" style="width: 70%" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100"></div>
                                        </div>
                                        <div class="row align-items-center my-4">
                                            <div class="col-6">
                                                <span class="bg-soft-primary d-inline-block px-2 py-1 border border-soft-primary rounded text-primary">15th Oct, 2020</span>
                                            </div>
                                            <div class="col-6">
                                                <ul class="list-inline text-right mb-0">
                                                    <li class="list-inline-item mr-1">
                                                        <img src="assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded">
                                                    </li>
                                                    <li class="list-inline-item mr-1">
                                                        <img src="assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded">
                                                    </li>
                                                    <li class="list-inline-item">
                                                        <a href="#">
                                                            <div class="avatar-xs">
                                                                <span class="avatar-title rounded bg-soft-primary font-size-15 text-primary">5+</span>
                                                            </div>
                                                        </a>
                                                    </li>
                                                </ul>
                                            </div>
                                        </div>
                                        <hr>
                                        <div class="row text-center mt-4">
                                            <div class="col-4">
                                                <h5 class="mb-1">5.2M</h5>
                                                <p class="text-muted mb-0">Followers</p>
                                            </div>

                                            <div class="col-4">
                                                <h5 class="mb-1">10.5K</h5>
                                                <p class="text-muted mb-0">Following</p>
                                            </div>

                                            <div class="col-4">
                                                <h5 class="mb-1">5.8K</h5>
                                                <p class="text-muted mb-0">Shot</p>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body">
                                        <div class="media">
                                            <div class="avatar mr-3">
                                                <div class="avatar-title rounded-circle bg-soft-primary text-primary">
                                                    <i class="icon-sm" data-feather="layout"></i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <h5 class="font-size-15 my-1">Admin Projects</h5>
                                                <p class="text-muted font-size-14 mb-2">UI/UX Design</p>
                                                <p class="text-muted mb-0">Itaque earum rerum hic tenetur a sapiente delectus.</p>
                                            </div>
                                            <a href="#">
                                                <div class="dropdown">
                                                    <a class="text-body dropdown-toggle font-size-20" href="#" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                      <i class="uil uil-ellipsis-v"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Remove</a>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body">
                                        <div class="media">
                                            <div class="avatar mr-3">
                                                <div class="avatar-title rounded-circle bg-soft-success text-success">
                                                    <i class="icon-sm" data-feather="globe"></i>
                                                </div>
                                            </div>
                                            <div class="media-body">
                                                <h5 class="font-size-15 mb-1">Freelancer Work</h5>
                                                <p class="text-muted font-size-14 mb-2">UI/UX Design</p>
                                                <p class="text-muted mb-0">Itaque earum rerum hic tenetur a sapiente delectus.</p>
                                            </div>
                                            <a href="#">
                                                <div class="dropdown">
                                                    <a class="text-body dropdown-toggle font-size-20" href="#" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                      <i class="uil uil-ellipsis-v"></i>
                                                    </a>
                                                    <div class="dropdown-menu dropdown-menu-right">
                                                        <a class="dropdown-item" href="#">Edit</a>
                                                        <a class="dropdown-item" href="#">Action</a>
                                                        <a class="dropdown-item" href="#">Remove</a>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>

                            <div class="col-xl-9">
                                <div class="row">
                                    <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-7">
                                                        <h4 class="mb-1">180</h4>
                                                        <p class="text-muted mb-4">Completed Projects</p>
                                                        <p class="text-muted mb-0"><i class="icon-xs text-success mr-2" data-feather="trending-up"></i>65.40%</p>
                                                    </div>
                                                    <div class="col-5">
                                                        <div>
                                                            <div class="apex-charts" id="sparkline-chart-1"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-7">
                                                        <h4 class="mb-1">15</h4>
                                                        <p class="text-muted mb-4">Pending Projects</p>
                                                        <p class="text-muted mb-0"><i class="icon-xs text-danger mr-2" data-feather="trending-down"></i>30.12%</p>
                                                    </div>
                                                    <div class="col-5">
                                                        <div>
                                                            <div class="apex-charts" id="sparkline-chart-2"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>

                                    <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="row align-items-center">
                                                    <div class="col-7">
                                                        <h4 class="mb-1">$40,236</h4>
                                                        <p class="text-muted mb-4">Total Revenue</p>
                                                        <p class="text-muted mb-0"><i class="icon-xs text-success mr-2" data-feather="trending-up"></i>78.45%</p>
                                                    </div>
                                                    <div class="col-5">
                                                        <div>
                                                            <div class="apex-charts" id="sparkline-chart-3"></div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <div class="card">
                                    <div class="card-body">
                                        <div class="float-right">
                                            <div class="dropdown">
                                                <a class="dropdown-toggle btn btn-light" href="#" id="dropdownMenuButton5" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                    <span class="font-weight-semibold">Sort By:</span> <span class="text-muted">Yearly<i class="mdi mdi-chevron-down ml-1"></i></span>
                                                </a>
            
                                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton5">
                                                    <a class="dropdown-item" href="#">Monthly</a>
                                                    <a class="dropdown-item" href="#">Yearly</a>
                                                    <a class="dropdown-item" href="#">Weekly</a>
                                                </div>
                                            </div>
                                        </div>
                                        <h4 class="card-title mb-5">Productivity</h4>
                                        <div>
                                            <div class="apex-charts" id="column-chart-1"></div>
                                        </div>
                                    </div>
                                </div>
                                <div class="row">
                                    <div class="col-xl-8">
                                        <div class="card">
                                            <div class="card-body">
                                                <div class="float-right">
                                                    <div class="dropdown">
                                                        <a class="btn-link text-muted dropdown-toggle arrow-none" href="#" role="button" id="dropdownMenuLink-2" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                                            <i class="icon-sm" data-feather="more-horizontal"></i>
                                                        </a>
                                                        <div class="dropdown-menu dropdown-menu-right" aria-labelledby="dropdownMenuLink-2">
                                                            <a class="dropdown-item" href="#"><i class="icon-xs icon mr-2" data-feather="refresh-cw"></i> Refresh</a>
                                                            <a class="dropdown-item" href="#"><i class="icon-xs icon mr-2" data-feather="edit"></i> Edit</a>
                                                            <a class="dropdown-item" href="#"><i class="icon-xs icon mr-2" data-feather="activity"></i> Action</a>
                                                            <div class="dropdown-divider"></div>
                                                            <a class="dropdown-item text-danger" href="#"><i class="icon-xs icon mr-2" data-feather="trash-2"></i> Delete</a>
                                                        </div>
                                                    </div>
                                                </div>
                                                <h4 class="card-title mb-4">Tasks</h4>

                                                <div class="table-responsive">
                                                    <table class="table table-nowrap mb-0">
                                                        <thead>
                                                        <tr>
                                                            <th scope="col">Subject</th>
                                                            <th scope="col">Priority</th>
                                                            <th scope="col">Status</th>
                                                            <th scope="col">Date</th>
                                                        </tr>
                                                        </thead>
                                                        <tbody>
                                                        <tr>
                                                            <td>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="ordercheck1">
                                                                    <label class="custom-control-label" for="ordercheck1">UI/UX Design</label>
                                                                </div>
                                                            </td>
                                                            <td>In Progress</td>
                                                            <td><span class="badge badge-soft-warning">Panding</span></td>
                                                            <td>01/11/2020</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="ordercheck2">
                                                                    <label class="custom-control-label" for="ordercheck2">Admin Template</label>
                                                                </div>
                                                            </td>
                                                            <td>In progress</td>
                                                            <td><span class="badge badge-soft-primary">Active</span></td>
                                                            <td>05/11/2020</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="ordercheck3">
                                                                    <label class="custom-control-label" for="ordercheck3">Landing Page</label>
                                                                </div>
                                                            </td>
                                                            <td>Done</td>
                                                            <td><span class="badge badge-soft-success">Complate</span></td>
                                                            <td>10/11/2020</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="ordercheck4">
                                                                    <label class="custom-control-label" for="ordercheck4">Graphic Design</label>
                                                                </div>
                                                            </td>
                                                            <td>In progress</td>
                                                            <td><span class="badge badge-soft-warning">Panding</span></td>
                                                            <td>15/11/2020</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="ordercheck5">
                                                                    <label class="custom-control-label" for="ordercheck5">Sketch Design</label>
                                                                </div>
                                                            </td>
                                                            <td>Done</td>
                                                            <td><span class="badge badge-soft-success">Complate</span></td>
                                                            <td>20/11/2020</td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                <div class="custom-control custom-checkbox">
                                                                    <input type="checkbox" class="custom-control-input" id="ordercheck5">
                                                                    <label class="custom-control-label" for="ordercheck5">Sketch Design</label>
                                                                </div>
                                                            </td>
                                                            <td>Done</td>
                                                            <td><span class="badge badge-soft-success">Complate</span></td>
                                                            <td>20/11/2020</td>
                                                        </tr>
                                                        </tbody>
                                                    </table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                    <div class="col-xl-4">
                                        <div class="card">
                                            <div class="card-body">
                                                <h4 class="card-title mb-4">Recent Activity</h4>
                                                <ol class="activity-feed mb-0 pl-2" data-simplebar style="max-height: 316px;">
                                                    <li class="feed-item">
                                                        <p class="text-muted mb-1 font-size-13 py-1 px-2 bg-light border rounded d-inline-block">Today : 12:20 pm</p>
                                                        <p class="mt-1 mb-0">Andrei Coman magna sed porta finibus, risus posted a new article: <span class="text-primary">Forget UX Rowland</span></p>
                                                    </li>
                                                    <li class="feed-item">
                                                        <p class="text-muted mb-1 font-size-13 py-1 px-2 bg-light border rounded d-inline-block">22 Jul, 2020</p>
                                                        <p class="mt-0 mb-0">Andrei Coman posted a new article: <span class="text-primary">Designer Alex</span></p>
                                                    </li>
                                                    <li class="feed-item">
                                                        <p class="text-muted mb-1 font-size-13 py-1 px-2 bg-light border rounded d-inline-block">18 Jul, 2020</p>
                                                        <p class="mt-0 mb-0">Zack Wetass, sed porta finibus, risus Chris Wallace Commented <span class="text-primary"> Developer Moreno</span></p>
                                                    </li>
                                                    <li class="feed-item">
                                                        <p class="text-muted mb-1 font-size-13 py-1 px-2 bg-light border rounded d-inline-block">10 Jul, 2020</p>
                                                        <p class="mt-0 mb-0">Zack Wetass, Chris combined Commented <span class="text-primary">UX Murphy</span></p>
                                                    </li>
                                                </ol>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- end row -->
                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

                
                <footer class="footer">
                    <div class="container-fluid">
                        <div class="row">
                            <div class="col-sm-6">
                                <script>document.write(new Date().getFullYear())</script> © Drezon.
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
            <div data-simplebar class="h-100">
                <div class="rightbar-title px-3 py-4">
                    <a href="javascript:void(0);" class="right-bar-toggle float-right">
                        <i class="mdi mdi-close noti-icon"></i>
                    </a>
                    <h5 class="m-0">Settings</h5>
                </div>

                <!-- Settings -->
                <hr class="mt-0" />
                <h6 class="text-center mb-0">Choose Layouts</h6>

                <div class="p-4">
                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-1.jpg" class="img-fluid img-thumbnail" alt="">
                    </div>
                    <div class="custom-control custom-switch mb-3">
                        <input type="checkbox" class="custom-control-input theme-choice" id="light-mode-switch" checked />
                        <label class="custom-control-label" for="light-mode-switch">Light Mode</label>
                    </div>
    
                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-2.jpg" class="img-fluid img-thumbnail" alt="">
                    </div>
                    <div class="custom-control custom-switch mb-3">
                        <input type="checkbox" class="custom-control-input theme-choice" id="dark-mode-switch" data-bsStyle="assets/css/bootstrap-dark.min.css" data-appStyle="assets/css/app-dark.min.css" />
                        <label class="custom-control-label" for="dark-mode-switch">Dark Mode</label>
                    </div>
    
                    <div class="mb-2">
                        <img src="assets/images/layouts/layout-3.jpg" class="img-fluid img-thumbnail" alt="">
                    </div>
                    <div class="custom-control custom-switch mb-5">
                        <input type="checkbox" class="custom-control-input theme-choice" id="rtl-mode-switch" data-appStyle="assets/css/app-rtl.min.css" />
                        <label class="custom-control-label" for="rtl-mode-switch">RTL Mode</label>
                    </div>

            
                </div>

            </div> <!-- end slimscroll-menu-->
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

        <!-- apexcharts -->
        <script src="assets/libs/apexcharts/apexcharts.min.js"></script>

        <script src="assets/js/pages/profile.init.js"></script>

        <script src="assets/js/app.js"></script>

    </body>
</html>
