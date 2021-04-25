<%@page import="notice.model.vo.Notice"%>
<%@page import="member.model.vo.Member"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Member member = (Member)request.getAttribute("member");
	List<Notice> noticeList = (List<Notice>)request.getAttribute("noticeList");
%>
<!DOCTYPE html>
<html>
<head>
<title>Frog Market</title>
<link rel="stylesheet"
	href="<%= request.getContextPath() %>/css/style.css" />
<script src="<%= request.getContextPath() %>/js/jquery-3.6.0.js"></script>
</head>
<body>
<h1 class="mini-title">Update Profile</h1>
    <div class="account-container">
        <form 
        class="account-form" 
        name="accountFrm"
        action="<%= request.getContextPath() %>/member/memberUpdate"
        method="post">
        <label for="">아이디</label><input type="text" name="memberId" id="memberId" value="<%= member.getMemberId() %>">
        <label for="">비밀번호</label><input type="text" name="password" id="password" value="<%= member.getPassword() %>">
        <label for="">비밀번호 확인</label><input type="text" name="newPassword" id="newPassword" value="<%= member.getPassword() %>">
        <label for="">별명</label><input type="text" name="nickId" id="nickId" value="<%= member.getNickId() %>">
        <label for="">이메일</label><input type="email" name="email" id="email" value="<%= member.getEmail() %>">
        <label for="">전화번호</label><input type="tel" name="phone" id="phone" value="<%= member.getPhone() %>">
		 <hr>
        <div class="btns">
            <input type="button" value="cancel" onclick="cancelFunction()">
            <input type="submit" value="submit">
        </div>
        </form>
    </div>
    <div>
    	알림 테스트
    	<table>
	    	<tr>
	    		<th>no</th>
	    		<th>board_no</th>
	    		<th>sender_id</th>
	    		<th>nick_id</th>
	    		<th>receiver_id</th>
	    		<th>title</th>
	    		<th>content</th>
	    	</tr>
	    	<%if(noticeList!=null){ %>
		    	<%for(Notice n : noticeList){ %>
		    	<tr>
		    		<td><%=n.getNo() %></td>
		    		<td><%=n.getBoardNo() %></td>
		    		<td><%=n.getSenderId() %></td>
		    		<td><%=n.getSenderNick() %></td>
		    		<td><%=n.getReceiverId() %></td>
		    		<td><%=n.getTitle() %></td>
		    		<td><%=n.getContent() %></td>
		    	</tr>
		    	<%} %>
	    	<% }%>
    	</table>
    </div>

	<script>
	$(document.accountFrm).submit(function(){
		
		var $password = $("#password");
		var $newPassword = $("#newPassword");
		
		if($newPassword.val() != $password.val()){
			alert("입력한 비밀번호가 일치하지 않습니다.");
			$newPassword.select();
			return false;
		}
		
	});

	function cancelFunction() {
        location.href="/frog/index.jsp";
    }    
	</script>
</body>
</html>