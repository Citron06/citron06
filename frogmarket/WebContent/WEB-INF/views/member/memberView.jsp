<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@page import="member.model.vo.Member"%>
<%@page import="member.model.service.MemberService"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	Member member = (Member)request.getAttribute("loginMember");
	List<Member> alist = (List<Member>)request.getAttribute("adminlist");
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- section시작 -->
<section>
	<div class="my-container">
		<!-- 프로필뷰 시작 -->
		<div class="my-profile-view">
			<div class="my-profile-icon">
				<div class="my-icon-img">
					<% if(loginMember.getIcon() == null || loginMember.getIcon().isEmpty()){ %>
					<img src="<%= request.getContextPath() %>/img/icon1.jpg" alt="">
					<% } else { %>
					<img src="<%= request.getContextPath() %>/img/<%= loginMember.getIcon() %>" alt="">
					<% } %>
				</div>
				<div class="my-profile-nick">
					<h3><%= loginMember.getNickId() %></h3>
				</div>
			</div>
			<div class="my-mini-container">
				<div class="my-profile-good">
					<div class="heart" onclick="addHeart();'">
						<img src="<%= request.getContextPath() %>/img/free-icon-hearts-138533.png" alt="">
					</div>
					<h3> : <%= loginMember.getGoodScore() %></h3>
				</div>
				<div class="my-profile-market-count">
					<h3>게시글 수 : </h3>
				</div>
			</div>
		</div>
		
		<!-- 프로필뷰 끝 -->
		<!-- 사이드 메뉴판 시작 -->
		<div class="my-profile-menu">
			<h2>회원 정보</h2>
			<form id="memberLogoutFrm" method="get">
				<p onclick="logoutMember();" style="cursor: pointer; color: red;">로그아웃</p>
        		<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>"/>
        	</form>
			<form id="memberViewUpdateFrm" method="get">
				<p onclick="updateMember();" style="cursor: pointer;">회원정보 수정</p>
        		<input type="hidden" name="memberId" value="<%= loginMember.getMemberId() %>"/>
        	</form>
			<p>회원 탈퇴</p>
			
			<h2>상품</h2>
			<p>댓글 알림</p>
			<p>상품등록</p>
			<p>내 상품 목록</p>
			<p>장바구니 목록</p>
			
			<% if(MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())) { %>
				<h2>관리자</h2>
				<p onclick="getMemberByAdmin();" style="cursor: pointer;">회원 목록</p>
			<% } %>
		</div>
		<!-- 사이드 메뉴판 끝 -->
		<!-- 게시판 시작 -->
		<div class="board my-board">
			
		</div>
		<!-- 게시판 끝 -->
	</div>
</section>
<!-- section끝 -->

<script>

	function logoutMember(){
		alert("로그아웃합니다.");
		$("#memberLogoutFrm")
			.attr("action","<%=request.getContextPath()%>/member/memberLogout")
			.submit();
	}

	function updateMember(){
		$("#memberViewUpdateFrm")
			.attr("action","<%=request.getContextPath()%>/member/memberUpdate")
			.submit();
	}

</script>

<!-- 관리자 회원 목록 ajax -->
<script>
function getMemberByAdmin(){

	$.ajax({
		url: "<%=request.getContextPath()%>/member/XmlMemberList",
		dataType: "text",
		success : function(data) {
			console.log(data);
			$(".my-board").append(data);
			},
		error : function(xhr, status,err) {
			console.log(xhr, status,err);
			}
		});
};

function addHeart(){

	$.ajax({
		url: "<%=request.getContextPath()%>/member/AddHeart",
		data: {"memberId", <%= loginMember.getMemberId() %>},
		success : function(data) {
			
			var $root = $(data).find(":root");
			var $hearts = $root.find("heart");
			var gScore = $hearts.children("goodScore").text();
			var $goodScore = $(".my-profile-good").children("h3").html("");
			
			$goodScore.append(gScore);
			
			},
		error : function(xhr, status,err) {
			console.log(xhr, status,err);
			}
		});
};
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>