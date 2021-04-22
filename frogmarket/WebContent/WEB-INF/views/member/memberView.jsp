<%@page import="java.util.Arrays"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	String memberId = "rabbit";
	String password = "karrot";
	String memberRole = "U";
	String email = "";
	String phone = "";
	Date enrollDate = null;
	String nickId = "중고장인";
	Double goodScore = 2.1;
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- section시작 -->
<section>
	<div class="my-container">
		<!-- 프로필뷰 시작 -->
		<div class="my-profile-view">
			<div class="my-profile-icon">
				<div class="my-icon-img"></div>
				<div class="my-profile-nick">
					<h3><%= nickId %></h3>
				</div>
			</div>
			<div class="my-mini-container">
				<div class="my-profile-good">
					<h3>좋아요 : <%= goodScore %></h3>
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
			<form id="memberViewUpdateFrm" method="get">
				<p onclick="updateMember();" style="cursor: pointer;">회원정보 수정</p>
        		<input type="hidden" name="memberId" value="<%= memberId %>"/>
        	</form>
			<p>회원 탈퇴</p>
			<h2>상품</h2>
			<p>내 상품 목록</p>
			<p>상품등록</p>
			<p>장바구니 목록</p>
			<h2>관리자</h2>
			<p>회원 목록</p>
		</div>
		<!-- 사이드 메뉴판 끝 -->
		<!-- 게시판 시작 -->
		<div class="board my-board">
			<div class="section-title my-board-title">
				<h2>내 상품 목록</h2>
			</div>
			<div class="board-box1">
				<div class="sumnail"></div>
				<div class="product-title">
					<p>스위치 팝니다</p>
					<h3>270,000￦</h3>
				</div>
			</div>
			<div class="board-box2">
				<div class="sumnail"></div>
				<div class="product-title">
					<p>스위치 팝니다</p>
					<h3>270,000￦</h3>
				</div>
			</div>
			<div class="board-box3">
				<div class="sumnail"></div>
				<div class="product-title">
					<p>스위치 팝니다</p>
					<h3>270,000￦</h3>
				</div>
			</div>
			<div class="board-box4">
				<div class="sumnail"></div>
				<div class="product-title">
					<p>스위치 팝니다</p>
					<h3>270,000￦</h3>
				</div>
			</div>
			<div class="board-box5">
				<div class="sumnail"></div>
				<div class="product-title">
					<p>스위치 팝니다</p>
					<h3>270,000￦</h3>
				</div>
			</div>
			<div class="board-box6">
				<div class="sumnail"></div>
				<div class="product-title">
					<p>스위치 팝니다</p>
					<h3>270,000￦</h3>
				</div>
			</div>
			<div class="board-box7">
				<div class="sumnail"></div>
				<div class="product-title">
					<p>스위치 팝니다</p>
					<h3>270,000￦</h3>
				</div>
			</div>
			<div class="board-box8">
				<div class="sumnail"></div>
				<div class="product-title">
					<p>스위치 팝니다</p>
					<h3>270,000￦</h3>
				</div>
			</div>
			<div class="more my-more"></div>
		</div>
		<!-- 게시판 끝 -->
	</div>
</section>
<!-- section끝 -->

<script>
	function updateMember(){
		$("#memberViewUpdateFrm")
			.attr("action","<%= request.getContextPath() %>/member/memberUpdate")
			.submit();
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp"%>