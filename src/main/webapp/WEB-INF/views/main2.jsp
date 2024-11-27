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
    margin: 0 auto;
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
											        <td><br></td>
											        <td></td>
											        </tr>
											        
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
							        	
							        	
							        	
							    <div class="card" style="border: 1px solid #ddd; text-align: center;">
							        <div class="card-body">
							        	<h4 class="card-title mb-4">공지사항</h4>
        									<table class="data-notice table table-centered datatable dt-responsive nowrap table-card-list table-check" style="width: 100%;" id="data-notice">
                               <thead>
                                   <tr>
		                                     	<th>공지사항 번호</th>
				                                  <th>공지사항 내용</th>
				                                  <th>작성자</th>
				                                 <%--  <th>${ noticeList[0].boardTypeNo }</th> --%>
                                   </tr>
                               </thead>
                               <tbody>
                               </tbody>
                         	</table>
							        </div>
							    </div>

							    <div class="card" style="border: 1px solid #ddd; text-align: center;">
							        <div class="card-body" id="data-weather">
							        
                			</div>
							    </div>
							    <div class="card" style="border: 1px solid #ddd; text-align: center;">
							        <div class="card-body">
							        <div class="container-fluid">


                        <div class="row">
                            <div class="col-12">
                                <div class="row">
                                    <div class="col-xl-1">
                                                <div id="external-events" class="m-t-20">
                                                </div>
                                    </div> <!-- end col-->

                                    <div class="col-xl-9">
                                        <div class="card">
                                            <div class="card-body">
                                                <div id="calendar"></div>
                                            </div>
                                        </div>
                                    </div> <!-- end col -->
                                </div> 

                                 
                            </div>
                        </div>
                        
                    </div> <!-- container-fluid -->
                    <!-- Add New Event MODAL -->
                                <div class="modal fade" id="event-modal" tabindex="-1">
                                    <div class="modal-dialog modal-dialog-centered">
                                        <div class="modal-content">
                                            <div class="modal-header py-3 px-4 border-bottom-0 d-block">
                                                <button type="button" class="close" data-dismiss="modal"
                                                    aria-hidden="true">&times;</button>
                                                <h5 class="modal-title" id="modal-title">Event</h5>
                                            </div>
                                            <div class="modal-body p-4">
                                                <form class="needs-validation" name="event-form" id="form-event" novalidate>
                                                    <div class="row">
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label class="control-label">Event Name</label>
                                                                <input class="form-control" placeholder="Insert Event Name"
                                                                    type="text" name="title" id="event-title" required value="" />
                                                                <div class="invalid-feedback">Please provide a valid event name</div>
                                                            </div>
                                                        </div>
                                                        <div class="col-12">
                                                            <div class="form-group">
                                                                <label class="control-label">Category</label>
                                                                <select class="form-control custom-select" name="category"
                                                                    id="event-category" required>
                                                                    <option value="bg-danger" selected>Danger</option>
                                                                    <option value="bg-success">Success</option>
                                                                    <option value="bg-primary">Primary</option>
                                                                    <option value="bg-info">Info</option>
                                                                    <option value="bg-dark">Dark</option>
                                                                    <option value="bg-warning">Warning</option>
                                                                </select>
                                                                <div class="invalid-feedback">Please select a valid event category</div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                    <div class="row mt-2">
                                                        <div class="col-6">
                                                            <button type="button" class="btn btn-danger" id="btn-delete-event">Delete</button>
                                                        </div>
                                                        <div class="col-6 text-right">
                                                            <button type="button" class="btn btn-light mr-1" data-dismiss="modal">Close</button>
                                                            <button type="submit" class="btn btn-success" id="btn-save-event">Save</button>
                                                        </div>
                                                    </div>
                                                </form>
                                            </div>
                                        </div> <!-- end modal-content-->
                                    </div> <!-- end modal dialog-->
                                </div>
                                <!-- end modal-->
							        </div>
							    </div>
                                    
                            </div>
                        </div>
                        
                    </div> <!-- container-fluid -->
                </div>
                <!-- End Page-content -->

            </div>
            <!-- end main content-->


						    
				         
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
        
        <script>
        $(document).ready(function () {
            $.ajax({
                url: '${contextPath}/board/notice/mainList', // 컨트롤러의 매핑 경로
                type: 'GET',
                success: function (noticeList) {
                	console.log(noticeList);
                    // 데이터를 테이블의 tbody에 추가
                    let tbody = '';
                    noticeList.forEach(function (n) {
                        tbody +=  '<tr onclick="location.href=\'${contextPath}/board/notice/detail?no=' + n.noticeNo + '\';">'
		                          +  '<td>'+ n.noticeNo +'</td>'
		                          +  '<td>'+n.noticeTitle+'</td>'
		                          +  '<td>'+n.userName+'</td>'
		                          +  '</tr>';
                    });
                    $('.data-notice tbody').html(tbody); // 기존 tbody 내용 교체
                },
                error: function (xhr, status, error) {
                    console.error("컨트롤러 호출 실패:", error);
                }
            });
        });
   		 </script>
   		 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
    $(document).ready(function() {
        // 페이지 로딩 시 weather 함수 실행
        jQuery.ajax({
            url: "${contextPath}/api/weather",  // 실제 API URL
            type: "GET",
            timeout: 30000,  // 30초 타임아웃
            contentType: "application/json",
            dataType: "json",
            success: function(data, status, xhr) {
                let dataHeader = data.response.header.resultCode;

                // 응답 결과 코드가 "00"이면 성공
                if (dataHeader === "00") {
                    console.log("success == >");
                    console.log(data);

                    // API에서 받은 날씨 데이터를 HTML로 출력
                    let weatherHtml = '';
                    let weatherItems = data.response.body.items.item;  // 여러 항목들이 있는 배열

                    // 예시: 날씨 정보 출력 (필요한 데이터를 수정하여 출력)
                    weatherHtml += '<h4>현재 날씨 정보</h4>';

                    // 데이터 배열 순회
                    weatherItems.forEach(function(item) {
                        // 각 항목에서 원하는 값 추출
                        let category = item.category;  // 예: TMP (온도), SKY (날씨 상태)
                        let value = item.fcstValue;    // 예보 값

                        // 원하는 형식으로 HTML 구성
                        // weatherHtml += '<p>' + category + ': ' + value + '</p>';
                        
                         // category에 따라 출력할 내용 결정
                        let displayText = '';
                        switch (category) {
		                        case "SKY":
			                    		if(value == 1){
			                    			displayText = "하늘상태: 맑음";
			                    		}else if(value == 2){
			                    			displayText = "하늘상태: 구름조금";
			                    		}else if(value == 3){
			                    			displayText = "하늘상태: 구름많음";
			                    		}else{
			                    			displayText = '<i class="uil-cloud-showers-heavy"></i>';
			                    		}
			                    	
		                        break;
                            case "TMP":
                                displayText = "현재온도: " + value + "°C";
                                break;
                            case "UUU":
                                displayText = "풍속(동서성분): " + value + " m/s";
                                break;
                            case "VVV":
                                displayText = "풍속(남북성분): " + value + " m/s";
                                break;
                            case "POP":
                                displayText = "강수확률: " + value + "%";
                                break;
                            case "REH":
                                displayText = "습도: " + value + "%";
                                break;
                            case "TMX":
                                displayText = "최고온도: " + value + "°C";
                                break;
                            case "TMN":
                                displayText = "최저온도: " + value + "°C";
                                break;
                           
                        }
                        // 원하는 형식으로 HTML 구성
                        weatherHtml += '<p>' + displayText + '</p>';
                    });

                    // 데이터를 div에 삽입
                    $('#data-weather').html(weatherHtml);

                } else {
                    console.log("fail == >");
                    console.log(data);
                }
            },
            error: function(xhr, status, errorThrown) {
                // 오류 발생 시
                console.log("error == >");
                console.log("Status: " + status);
                console.log("Error Thrown: " + errorThrown);
            }
        });
    });
</script>


</body>
</html>