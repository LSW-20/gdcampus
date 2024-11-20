<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>개설 신청 조회</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 20px;
        }
        .container {
            width: 600px;
            margin: 0 auto;
        }
        .section {
            margin-bottom: 20px;
        }
        .section label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .data {
            margin-bottom: 10px;
            padding: 8px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: #f9f9f9;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 10px;
        }
        table, th, td {
            border: 1px solid #ccc;
        }
        th, td {
            padding: 8px;
            text-align: center;
        }
        .buttons {
            text-align: center;
        }
        .buttons button {
            padding: 10px 20px;
            margin: 0 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }
        .buttons button.back {
            background-color: #4CAF50;
            color: white;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>개설 신청 조회</h1>
        <!-- 상세 정보 -->
        <div class="section">
            <h3>상세정보</h3>
            <label>교과명:</label>
            <div class="data">${c.classTitle}</div>
     		<c:set var = "year" value = "${fn:substring(c.classCode, 0, 2)}" />
     		<c:set var = "term" value = "${fn:substring(c.classCode, 2, 4)}" />
            <label>개설년도:</label>
            <div class="data">${year}</div>
            <label>개설학기:</label>
            <div class="data">${term}</div>
            <label>과정유형:</label>
            <div class="data">${c.classType}</div>
            <label>진행방식:</label>
            <div class="data">${c.prgMethod}</div>
            <label>담당교수(부):</label>
            <div class="data">${c.userNo}</div>
        </div>

        <!-- 수업 목표 -->
        <div class="section">
            <h3>수업목표</h3>
            <div class="data">${c.classGoals}</div>
        </div>

        <!-- 운영 방안 -->
        <div class="section">
            <h3>운영방안</h3>
            <div class="data">${c.operationPlan}</div>
        </div>

        <!-- 평가 방식 -->
        <div class="section">
            <h3>평가방식</h3>
            <table>
                <thead>
                    <tr>
                        <th>중간고사</th>
                        <th>기말고사</th>
                        <th>실습/과제</th>
                        <th>출결</th>
                        <th>기타</th>
                        <th>합계</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>${c.evaList[0].allocation}</td>
                        <td>${c.evaList[1].allocation}</td>
                        <td>${c.evaList[2].allocation}</td>
                        <td>20</td>
                        <td>${c.evaList[3].allocation}</td>
                        <td></td>
                    </tr>
                </tbody>
            </table>
        </div>

        <!-- 평가 상세 -->
        <div class="section">
            <h3>평가 상세</h3>
            <% 
                String midtermDetails = (String) request.getAttribute("midtermDetails");
                String finalDetails = (String) request.getAttribute("finalDetails");
                String assignmentDetails = (String) request.getAttribute("assignmentDetails");
                String etcDetails = (String) request.getAttribute("etcDetails");
            %>
            <% if (midtermDetails != null && !midtermDetails.isEmpty()) { %>
                <label>중간고사:</label>
                <div class="data"><%= midtermDetails %></div>
            <% } %>
            <% if (finalDetails != null && !finalDetails.isEmpty()) { %>
                <label>기말고사:</label>
                <div class="data"><%= finalDetails %></div>
            <% } %>
            <% if (assignmentDetails != null && !assignmentDetails.isEmpty()) { %>
                <label>실습/과제:</label>
                <div class="data"><%= assignmentDetails %></div>
            <% } %>
            <% if (etcDetails != null && !etcDetails.isEmpty()) { %>
                <label>기타:</label>
                <div class="data"><%= etcDetails %></div>
            <% } %>
        </div>

        <!-- 교재 -->
        <div class="section">
            <h3>교재</h3>
            <label>주교재:</label>
            <div class="data">${c.mainTextBook}</div>
            <label>참고서적:</label>
            <div class="data">${c.refnBook eq null ? '' : c.refnBook}</div>
        </div>

        <!-- 버튼 -->
        <div class="buttons">
            <button class="back" onclick="history.back()">뒤로가기</button>
        </div>
    </div>
</body>
</html>
