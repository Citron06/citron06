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
<<<<<<< HEAD
				<input name="loginId" type="text" id="LoginId" onKeypress="if(event.keyCode == 13) loginFunction()">
			</div>
			<div class="login-icon login-pwd">
				<input name="loginPw" type="text" id="LoginPw"onkeypress="if(event.keyCode == 13) loginFunction()">
			</div>
		<hr>
		<div class="btns">
			<input type="button" name="submit" id="loginButton" value="submit" onclick="loginFunction()">
			<input type="button" name="cancle" id="cancelButton" value="cancel" onclick="cancelFunction()"> 
=======
				<input name="loginId" type="text">
			</div>
			<div class="login-icon login-pwd">
				<input name="loginPw" type="text">
			</div>
		<hr>
		<div class="btns">
			<input type="button" name="" id="" value="cancel"> 
			<input type="button" name="" id="loginButton" value="submit" onclick="loginFunction()">
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
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
<<<<<<< HEAD
		let LoginId = document.getElementById('LoginId').value;
		let LoginPw = document.getElementById('LoginPw').value;
		/*유효성검사*/
		if (!frm.LoginId.value) {
        alert("아이디를 입력해 주십시오.");
        frm.LoginId.focus();
        return;
    	}
 
   		if (!frm.LoginPw.value) {
        alert("비밀번호를 입력해 주십시오.");
        frm.LoginPw.focus();
        return;
    	}
		frm.submit();
	}
	function cancelFunction() {
        location.href="/frog/index.jsp";
    }    
=======
		frm.submit();
	};
	
>>>>>>> 8b396b6ab3b271e398e56ae6b6a1ba61dd76c2d4
</script>
</html>