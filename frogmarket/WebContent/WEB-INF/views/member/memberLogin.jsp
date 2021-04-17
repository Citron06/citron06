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
		<form id="loginForm" class="login-form" action="<%= request.getContextPath() %>/member/login" method="post">
			<div class="login-icon login-id">
				<input name="loginId" type="text">
			</div>
			<div class="login-icon login-pwd">
				<input name="loginPw" type="text">
			</div>
		<hr>
		<div class="btns">
			<input type="button" name="" id="" value="cancel"> 
			<input type="button" name="" id="loginButton" value="submit" onclick="loginFunction()">
		</div>
		</form>
	</div>
	<div class="go-acount">
		<a href="<%= request.getContextPath() %>/member/account">회원가입 하러가기</a>
	</div>
</body>

<script>
	
	// loginform submit
	function loginFunction() {
		let frm = document.getElementById('loginForm');
		frm.submit();
	};
	
</script>
</html>