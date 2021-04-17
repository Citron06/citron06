<%@page import="market.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Product product = (Product)request.getAttribute("product");
%>
 <!-- section시작 -->
    <section>
        <div class="post-container">
            <div class="market-img-container">
                <div class="photo-left-btn"></div>
                <div class="photo-rigth-btn"></div>
                <div class="market-img"></div>
            </div>
            <div class="seller-title">
                <div class="seller-icon">

                </div>
                <div class="seller-profile">
                    <div class="seller-profile-info">
                        <h3><%=product.getId() %></h3>
                    </div>
                    <div class="seller-good-info">
                    <!--  -->
                        <h3>좋아요 : 3</h3>
                    </div>
                </div>
            </div>
            <div class="commet-container">
                <h1>스위치 팝니다</h1>
                <br>
                <span>부산/대구</span>
                <h3>270,000원</h3>
                <span>1회 사용 했습니다.<br> 상태 매우 좋습니다.<br>원하시는 분은 010-****-****으로 문자 주세요.</span>
            </div>
            <div class="comment-reader">
                <h3 style="margin: 10px 35px;">댓글란</h3>
                <div class="reader-inbox">
                    <div class="comment-reader-icon"></div>
                    <h4>농담곰</h4>
                    <p>문자드렸습니다.</p>
                    <p>2021/03/12</p>
                </div>
                <div class="reader-inbox">
                    <div class="comment-reader-icon"></div>
                    <h4>미키</h4>
                    <p>문자드렸습니다.</p>
                    <p>2021/03/04</p>
                </div>
            </div>
            <div class="comment-writer">
                <div class="comment_inbox">
                    <h3 class="comment_inbox_name">농담곰</h3>
                    <textarea placeholder="댓글을 남겨보세요" rows="1" class="comment_inbox_text"></textarea>
                </div>
                <div class="register_box">
                    <input class="register_btn" type="button" name="" id="" value="등록">
                </div>
            </div>
        </div>
        </div>
        </div>
    </section>
    <!-- section끝 -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>