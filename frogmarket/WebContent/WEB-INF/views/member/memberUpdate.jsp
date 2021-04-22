<%@page import="member.model.vo.Member"%>
<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%><!-- 여기가 필요한 값을 사용할 수 있도록 하는 import 부분이고요 -->
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	/* 여기가 memberView.jsp에서 memberUpdateServlet을 거쳐서 member를 넘겨준 부분입니다 */
	Member member = (Member)request.getAttribute("member");
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
    <div class="acount-container">
        <form class="acount-form" 
        action="request.getContextPath() %>/member/memberUpdate"

        method="post"><!-- 그래서 input 안에 값을 넣어준 겁니다 -->
        <label for="">아이디</label><input type="text" name="memberId" id="" value="<%= member.getMemberId() %>">
        <label for="">비밀번호</label><input type="password" name="password" id="" value="<%= member.getPassword() %>">
        <label for="">비밀번호 확인</label><input type="password" name="" id="" value="<%= member.getPassword() %>">
        <label for="">별명</label><input type="text" name="nickId" id="" value="<%= member.getNickId() %>">
        <label for="">이메일</label><input type="email" name="email" id="" value="<%= member.getEmail() %>">
        <label for="">전화번호</label><input type="tel" name="phone" id="" value="<%= member.getPhone() %>">
		 <hr>
        <div class="btns">
            <input type="button" name="" id="" value="cancel">
            <input type="submit" name="" id="" value="submit">
        </div>
        </form>
    </div>
</body>
</html>