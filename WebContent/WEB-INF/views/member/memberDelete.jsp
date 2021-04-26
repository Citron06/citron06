<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<title>회원탈퇴</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
    <h1 class="mini-title">Account</h1>
    <div class="delete-container">
    
        <form id="deleteForm" class="delete-form" action="<%= request.getContextPath() %>/member/delete" method="post">
            <label for="">비밀번호</label><input type="password" name="password" id="password" onKeypress="if(event.keyCode == 13) deletetFunction()">
        <hr>
        <div class="btns">
        	<input type="button" name="" id="delete" value="submit" onclick="deleteFunction();">
            <input type="button" name="cancle" id="cancel" value="cancel" onclick="cancelFunction()">
        </div>
        </form>
    </div>
</body>

<script>

	function deleteFunction() {
		
		let frm = document.getElementById('deleteForm');
		let password = document.getElementById('password').value;

		/* 유효성 검사 */
   		if (!password) {
   	        alert("비밀번호를 입력해 주십시오.");
   	        frm.password.focus();
   	        return;
   	    	}
		frm.submit();	
	}
	function cancelFunction() {
        location.href="/frog/member/memberView";
    }
</script>
</html>