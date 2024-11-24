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
	
	<!-- App favicon -->
        <link rel="shortcut icon" href="${contextPath }/images/favicon.ico">

        <link href="${contextPath }/libs/@fullcalendar/core/main.min.css" rel="stylesheet" type="text/css" />
        <link href="${contextPath }/libs/@fullcalendar/daygrid/main.min.css" rel="stylesheet" type="text/css" />
        <link href="${contextPath }/libs/@fullcalendar/bootstrap/main.min.css" rel="stylesheet" type="text/css" />
        <link href="${contextPath }/libs/@fullcalendar/timegrid/main.min.css" rel="stylesheet" type="text/css" />

        <!-- Bootstrap Css -->
        <link href="${contextPath }/css/bootstrap.min.css" id="bootstrap-style" rel="stylesheet" type="text/css" />
        <!-- Icons Css -->
        <link href="${contextPath }/css/icons.min.css" rel="stylesheet" type="text/css" />
        <!-- App Css-->
        <link href="${contextPath }/css/app.min.css" id="app-style" rel="stylesheet" type="text/css" />
</head>
<style>
.icon-table {
    width: 100%;
    text-align: center;
}
.icon-table td {
    padding: 10px;
}
.icon-large {
    font-size: 48px; /* 아이콘 크기 지정 */
}

</style>

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

							<div style="display: grid; grid-template-columns: repeat(2, 1fr); gap: 10px; width: 100%; height:100%; margin: 0 auto;">
							    <div class="card" style="border: 1px solid #ddd; text-align: center;">
							        <div class="card-body">
													<h4 class="card-title mb-4">근무체크</h4>
											        <table class="icon-table">
											            <tr>
											                <td><i class="mdi mdi-account-arrow-left icon-large"></i></td>
											                <td><i class="mdi mdi-account-arrow-right icon-large"></i></td>
											            </tr>
											            <tr>
											            	<td>출근하기</td>
											            	<td>퇴근하기</td>
											            </tr>
											            
											        </table>	
											</div>
							    </div>
							        	
							        	
							        	
							        	
							        	
                             <div class="col-xl-9">
                                 <div class="card">
                                     <div class="card-body">
                                         <div id="calendar"></div>
                                     </div>
                                 </div>
                             </div> <!-- end col -->

                                    
                                    
                                    
                                    
                                    
                                    
                                    
                                <!-- end modal-->
                            </div>
                        </div>
                        
                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

                
            </div>
            <!-- end main content-->

        </div>
        <!-- END layout-wrapper -->

							        </div>
							    <div class="card" style="border: 1px solid #ddd; text-align: center;">
							        <div class="card-body"></div>
							    </div>
							    <div class="card" style="border: 1px solid #ddd; text-align: center;">
							        <div class="card-body"></div>
							    </div>
						    
				         
		<!-- main-content 끝 -->



	<!-- 전체 영역(헤더, 사이드바, 내용) 끝 -->

<!-- JAVASCRIPT -->
        <script src="${contextPath }/libs/jquery/jquery.min.js"></script>
        <script src="${contextPath }/libs/metismenu/metisMenu.min.js"></script>
        <script src="${contextPath }/libs/bootstrap/js/bootstrap.bundle.min.js"></script>
        <script src="${contextPath }/libs/simplebar/simplebar.min.js"></script>
        <script src="${contextPath }/libs/waypoints/lib/jquery.waypoints.min.js"></script>

        <!-- plugin js -->
        <script src="${contextPath }/libs/moment/min/moment.min.js"></script>
        <script src="${contextPath }/libs/jquery-ui-dist/jquery-ui.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/core/main.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/bootstrap/main.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/daygrid/main.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/timegrid/main.min.js"></script>
        <script src="${contextPath }/libs/@fullcalendar/interaction/main.min.js"></script>

        <!-- Calendar init -->
        <script src="${contextPath }/js/pages/calendar.init.js"></script>
        <script src="${contextPath }/js/app.js"></script>

</body>
</html>