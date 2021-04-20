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
            <label for="">이름</label><input type="text" name="member_id" id="member_id">
            <label for="">별명</label><input type="text" name="nick_id" id="nick_id">
            <label for="">비밀번호</label><input type="password" name="password" id="password">
            <label for="">비밀번호 확인</label><input type="password" name="password" id="password_check">
            <label for="">이메일</label><input type="email" name="email" id="email">
            <label for="">전화번호</label><input type="tel" name="phone" id="phone">
        <hr>
        <div class="btns">
            <input type="button" name="" id="" value="cancel">
            <input type="button" name="" id="accountSubmit" value="submit" onclick="accountFunction();">
        </div>
        </form>
    </div>
</body>

<script>
	function accountFunction() {
		
		let frm = document.getElementById('accountFrm');
		let password = document.getElementById('password').value;
		let password_check = document.getElementById('password_check').value;

		/* 유효성 검사 */
		if (password !== password_check) 
		{
			alert("패스워드가 다릅니다.");
			return;
		}

		
		frm.submit();
				
	}
</script>
</html>