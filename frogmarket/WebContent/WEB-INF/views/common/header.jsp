<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Frog Market</title>
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
					<h1>마켓 게시판</h1>
				</div>
				<div class="head graph">
					<h1>한눈 그래프</h1>
				</div>
				<div class="head black-list">
					<a href="<%= request.getContextPath() %>/report/reportList">
						<h1>신고 게시판</h1>
					</a>
				</div>
				<div class="head login">
					<input type="button" value="Login"
						onclick="location.href='<%= request.getContextPath() %>';">
					<!-- <input type="button" value="My Page" onclick="location.href='<%= request.getContextPath() %>';"> -->
				</div>
			</div>
		</div>
	</header>
	<!-- header끝 -->