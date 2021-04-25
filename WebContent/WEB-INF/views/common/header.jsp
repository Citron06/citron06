<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<<<<<<< Updated upstream
<title>Frog Market</title>
=======
<title>Main Page</title>
>>>>>>> Stashed changes
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
	<!-- header시작 -->
	<header>
		<div class="header-container">
			<div class="head main-title">
				<img src="<%= request.getContextPath() %>/img/frog (1).png"
					class="header-img" alt="">
				<h1>깨꿀마켓</h1>
			</div>
			<div class="head search">
				<input type="text" name="header-search" id="header-search">
			</div>
			<div class="head menu">
				<div class="head market">
					<a href="<%= request.getContextPath() %>/market/marketList"><h1>마켓 게시판</h1></a>
				</div>
				<div class="head graph">
					<a href="<%= request.getContextPath() %>/graph/graphView"><h1>한눈 그래프</h1></a>
				</div>
				<div class="head black-list">
					<a href="<%= request.getContextPath() %>/report/reportList"><h1>신고 게시판</h1></a>
				</div>
				<div class="head login">
<<<<<<< Updated upstream
					<input type="button" value="Login" onclick="location.href='<%= request.getContextPath() %>/member/login';">
					<!-- <input type="button" value="My Page" onclick="location.href='<%= request.getContextPath() %>';"> -->
=======
<<<<<<<< Updated upstream:WebContent/WEB-INF/views/common/header.jsp
					<% if(session.getAttribute("loginUser") == null) { %>
					<input type="button" value="Login" onclick="location.href='<%= request.getContextPath() %>/member/login';">
					<% } else { %>
					<input type="button" value="My Page" onclick="location.href='<%= request.getContextPath() %>/member/memberView';">
					<% } %>
========
					<input type="button" value="Login" onclick="location.href='<%= request.getContextPath() %>/member/login';">
>>>>>>>> Stashed changes:frogmarket/WebContent/WEB-INF/views/common/header.jsp
>>>>>>> Stashed changes
				</div>
			</div>
		</div>
	</header>
	<!-- header끝 -->