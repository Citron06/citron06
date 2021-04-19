<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>Frog Market</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
    <h1 class="mini-title">Acount</h1>
    <div class="acount-container">
    
        <form id="accountFrm" class="acount-form" action="<%= request.getContextPath() %>/member/account" method="post">
            <label for="">아이디</label><input type="text" name="member_id" id="member_id" onKeypress="if(event.keyCode == 13) accountFunction()">
            <label for="">별명</label><input type="text" name="nick_id" id="nick_id" onKeypress="if(event.keyCode == 13) accountFunction()">
            <label for="">비밀번호</label><input type="password" name="password" id="password" onKeypress="if(event.keyCode == 13) accountFunction()">
            <label for="">비밀번호 확인</label><input type="password" name="password_check" id="password_check" onKeypress="if(event.keyCode == 13) accountFunction()">
            <label for="">이메일</label><input type="email" name="email" id="email" onKeypress="if(event.keyCode == 13) accountFunction()">
            <label for="">전화번호</label><input type="tel" name="phone" id="phone" onKeypress="if(event.keyCode == 13) accountFunction()">
        <hr>
        <div class="btns">
        	<input type="button" name="submit" id="accountSubmit" value="submit" onclick="accountFunction();">
            <input type="button" name="cancle" id="cancelButton" value="cancel" onclick="cancelFunction()">
        </div>
        </form>
    </div>
</body>

<script>
	function accountFunction() {
		
		let frm = document.getElementById('accountForm');
		let member_id = document.getElementById('member_id').value;
		let nick_id = document.getElementById("nick_id").value;
		let password = document.getElementById('password').value;
		let password_check = document.getElementById('password_check').value;
		let email = document.getElementById('email').value;
		let phone = document.getElementById('phone').value;

		/* 유효성 검사 */
		if (!frm.member_id.value) {
        	alert("아이디를 입력해 주십시오.");
        	frm.member_id.focus();
        	return;
    		}
 
   		if (!frm.nick_id.value) {
        	alert("별명을 입력해 주십시오.");
        	frm.nick_id.focus();
        	return;
    		}
   		
   		if (!frm.password.value) {
   	        alert("비밀번호를 입력해 주십시오.");
   	        frm.password.focus();
   	        return;
   	    	}
   		
   		if (!frm.password_check.value) {
   	        alert("비밀번호 확인을 입력해 주십시오.");
   	        frm.password_check.focus();
   	        return;
   	    	}
   		
   		if (!frm.email.value) {
   	        alert("이메일을 입력해 주십시오.");
   	        frm.email.focus();
   	        return;
   	    	}
   		
   		if (!frm.phone.value) {
   	        alert("전화번호를 입력해 주십시오.");
   	        frm.phone.focus();
   	        return;
   	    	}
   		
		if (password !== password_check) 
		{
			alert("패스워드가 다릅니다.");
			frm.password_check.focus();
			return;
		}
		frm.submit();	
	}
	function cancelFunction() {
        location.href="/frog/member/login";
    }
</script>
</html>