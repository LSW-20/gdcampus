<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<c:set var="contextPath" value="${pageContext.request.contextPath}" />

    
<style>
    footer{
        height: 200px;
        border-top: 1px solid lightgray;
    }
    footer a{color:black}
    .footer-info{
        list-style: "-  ";
        padding-left:30px;
    }
    .footer-copyright{text-align:center}
</style>


<footer class="m-3">
	<ul class="nav footer-link">
	    <li class="nav-item">
	    <a class="nav-link" href="#">이용약관</a>
	    </li>
	    <li class="nav-item">
	    <a class="nav-link" href="#">개인정보취급방침</a>
	    </li>
	    <li class="nav-item">
	    <a class="nav-link" href="#">인재채용</a>
	    </li>
	    <li class="nav-item">
	    <a class="nav-link" href="#">고객센터</a>
	    </li>
	</ul>
	
	<ul class="footer-info">
	    <li>상호명 : GooDee Academy</li>
	    <li>대표자 : 이승엽</li>
	    <li>전화 : 02-818-7950</li>
	    <li>개인정보책임자 : 주승재 / jsj@goodee.co.kr</li>
	    <li>본관 : (08505) 서울특별시 금천구 가산디지털2로 95</li>
	</ul>
	
	<div class="footer-copyright">
	    Copyright ⓒ GooDee Academy. All rights reserved.
	</div>
</footer>