<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

						<!-- ============================================================== -->
            <!-- 템플릿 복사해온것  -->
            <!-- ============================================================== -->
            <div class="main-content">

                <div class="page-content">
                    <div class="container-fluid">

                        <!-- start page title -->
                        <div class="row">
                            <div class="col-12">
                                <div class="page-title-box d-flex align-items-center justify-content-between">
                                    <h4 class="mb-0">Form editor</h4>

                                    <div class="page-title-right">
                                        <ol class="breadcrumb m-0">
                                            <li class="breadcrumb-item"><a href="javascript: void(0);">Forms</a></li>
                                            <li class="breadcrumb-item active">Form editor</li>
                                        </ol>
                                    </div>

                                </div>
                            </div>
                        </div>
                        <!-- end page title -->

                        <div class="row">
                            <div class="col-lg-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Ckeditor Classic editor</h4>
                                        <p class="card-title-desc">Example of Ckeditor Classic editor</p>
                                        <div id="classic-editor"></div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Summernote</h4>
                                        <p class="card-title-desc">Super simple wysiwyg editor on bootstrap</p>
        
                                        <div id="summernote-editor" class="summernote">Hello Summernote</div>
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->

                        <div class="row">
                            <div class="col-12">
                                <div class="card">
                                    <div class="card-body">
                                        <h4 class="card-title">Summernote Air-mode</h4>
                                        <p class="card-title-desc">Summernote editor air-mode example.</p>
        
                                        <div id="summernote-airmode-editor" class="summernote">
                                            <h5>This is an Air-mode editable area.</h5>
                                            <ul>
                                              <li>Select a text to reveal the toolbar.</li>
                                              <li>Edit rich document on-the-fly, so elastic!</li>
                                            </ul>
                                            <p>End of air-mode area</p>
                                          
                                        </div>
                                    </div>
                                </div>
                            </div> <!-- end col -->
                        </div> <!-- end row -->
                    </div> <!-- container-fluid -->
                </div>

</body>
</html>