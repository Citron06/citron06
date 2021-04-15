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
	<h1 class="mini-title">LOGIN</h1>
	<div class="login-container">
		<div class="profile-icon"></div>
		<form class="login-form" action="">
			<div class="login-icon login-id">
				<input type="text">
			</div>
			<div class="login-icon login-pwd">
				<input type="text">
			</div>
		</form>
		<hr>
		<div class="btns">
			<input type="button" name="" id="" value="cancel"> <input
				type="button" name="" id="" value="submit">
		</div>
	</div>
	<div class="go-acount">
		<a href="">회원가입 하러가기</a>
	</div>
</body>
</html>