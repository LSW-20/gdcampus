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

								<br><br> <h2>구디캠퍼스</h2> <br><br>

								                                    <div class="card-body">
                                        <div class="row mb-2">
                                            <div class="col-md-6">
                                                <div class="mb-3">
                                                    <a href="javascript:void(0);" class="btn btn-success waves-effect waves-light"><i class="mdi mdi-plus mr-2"></i> Add New</a>
                                                </div>
                                            </div>
                
                                            <div class="col-md-6">
                                                <div class="form-inline float-md-right mb-3">
                                                    <div class="search-box ml-2">
                                                        <div class="position-relative">
                                                            <input type="text" class="form-control rounded bg-light border-0" placeholder="Search...">
                                                            <i class="mdi mdi-magnify search-icon"></i>
                                                        </div>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                
                
                                        </div>
                                        <!-- end row -->
                                        <div class="table-responsive mb-4">
                                            <table class="table table-centered table-nowrap table-check mb-0">
                                                <thead>
                                                  <tr>
                                                    <th scope="col" style="width: 50px;">
                                                        <div class="custom-control custom-checkbox">
                                                            <input type="checkbox" class="custom-control-input" id="checkAll">
                                                            <label class="custom-control-label" for="checkAll"></label>
                                                        </div>
                                                    </th>
                                                    <th scope="col">Name</th>
                                                    <th scope="col">Position</th>
                                                    <th scope="col">Email</th>
                                                    <th scope="col" style="width: 200px;">Action</th>
                                                  </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck1">
                                                                <label class="custom-control-label" for="contacusercheck1"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-1.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Donald Risher</a>
                                                        </td>
                                                        <td>Full Stack Developer</td>
                                                        <td>DonaldRisher@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck2">
                                                                <label class="custom-control-label" for="contacusercheck2"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Helen Barron</a>
                                                        </td>
                                                        <td>Web Designer</td>
                                                        <td>HelenBarron@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                    </tr>
                                                    <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck3">
                                                                <label class="custom-control-label" for="contacusercheck3"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-3.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Philip Theroux</a>
                                                        </td>
                                                        <td>UI/UX Designer</td>
                                                        <td>PhilipTheroux@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck4">
                                                                <label class="custom-control-label" for="contacusercheck4"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-4.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Gerald Moyer</a>
                                                        </td>
                                                        <td>Backend Developer</td>
                                                        <td>GeraldMoyer@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck5">
                                                                <label class="custom-control-label" for="contacusercheck5"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-5.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Sharon Carver</a>
                                                        </td>
                                                        <td>Frontend Developer</td>
                                                        <td>SharonCarver@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Edit</a>
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Remove</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck6">
                                                                <label class="custom-control-label" for="contacusercheck6"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-6.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Jody Tondreau</a>
                                                        </td>
                                                        <td>PHP Developer</td>
                                                        <td>JodyTondreau@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck7">
                                                                <label class="custom-control-label" for="contacusercheck7"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-7.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Dennis Goulet</a>
                                                        </td>
                                                        <td>Graphic Designer</td>
                                                        <td>DennisGoulet@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck8">
                                                                <label class="custom-control-label" for="contacusercheck8"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-8.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Cecelia Farrell</a>
                                                        </td>
                                                        <td>Angular Developer</td>
                                                        <td>CeceliaFarrell@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck9">
                                                                <label class="custom-control-label" for="contacusercheck9"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-2.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Helen Barron</a>
                                                        </td>
                                                        <td>Web Designer</td>
                                                        <td>HelenBarron@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                      </tr>
                                                      <tr>
                                                        <th scope="row">
                                                            <div class="custom-control custom-checkbox">
                                                                <input type="checkbox" class="custom-control-input" id="contacusercheck10">
                                                                <label class="custom-control-label" for="contacusercheck10"></label>
                                                            </div>
                                                        </th>
                                                        <td>
                                                            <img src="assets/images/users/avatar-4.jpg" alt="" class="avatar-xs rounded-circle mr-2">
                                                            <a href="#" class="text-body">Gerald Moyer</a>
                                                        </td>
                                                        <td>Backend Developer</td>
                                                        <td>GeraldMoyer@drezon.com</td>
                                                        <td>
                                                            <ul class="list-inline mb-0">
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-primary" data-toggle="tooltip" data-placement="top" title="Edit"><i class="uil uil-pen font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item">
                                                                    <a href="javascript:void(0);" class="px-2 text-danger" data-toggle="tooltip" data-placement="top" title="Delete"><i class="uil uil-trash font-size-18"></i></a>
                                                                </li>
                                                                <li class="list-inline-item dropdown">
                                                                    <a class="text-muted dropdown-toggle font-size-18 px-2" href="javascript:void(0);" role="button" data-toggle="dropdown" aria-haspopup="true">
                                                                        <i class="uil uil-ellipsis-v"></i>
                                                                    </a>
                                                                
                                                                    <div class="dropdown-menu dropdown-menu-right">
                                                                        <a class="dropdown-item" href="#">Action</a>
                                                                        <a class="dropdown-item" href="#">Another action</a>
                                                                        <a class="dropdown-item" href="#">Something else here</a>
                                                                    </div>
                                                                </li>
                                                            </ul>
                                                        </td>
                                                      </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                        <div class="row mt-4">
                                            <div class="col-sm-6">
                                                <div>
                                                    <p class="mb-sm-0">Showing 1 to 10 of 12 entries</p>
                                                </div>
                                            </div>
                                            <div class="col-sm-6">
                                                <div class="float-sm-right">
                                                    <ul class="pagination mb-sm-0">
                                                        <li class="page-item disabled">
                                                            <a href="#" class="page-link"><i class="mdi mdi-chevron-left"></i></a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a href="#" class="page-link">1</a>
                                                        </li>
                                                        <li class="page-item active">
                                                            <a href="#" class="page-link">2</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a href="#" class="page-link">3</a>
                                                        </li>
                                                        <li class="page-item">
                                                            <a href="#" class="page-link"><i class="mdi mdi-chevron-right"></i></a>
                                                        </li>
                                                    </ul>
                                                </div>
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