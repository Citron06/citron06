<%@page import="member.model.vo.Member"%>
<%@page import="report.model.vo.Report"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	Report report = (Report)request.getAttribute("report");
	Member member = (Member)request.getAttribute("member");
%>

<%@ include file="/WEB-INF/views/common/header.jsp" %>

  <!-- section시작 -->
    <section>
        <div class="post-container">
            <div class="report-img-container">
                <div class="photo-left-btn"></div>
                <div class="photo-rigth-btn"></div>
                <div class="report-img"></div>
            </div>
            <div class="reporter-title">
                <div class="reporter-icon">

                </div>
                <div class="reporter-profile">
                    <div class="reporter-profile-info">
                        <h3><%= member.getNickId() %></h3>
                    </div>
                    <div class="target-profile-info">
                        <h3>신고 대상 : <%= report.getMemberReportId() %></h3>
                    </div>
                </div>
            </div>
            <div class="commet-container">
                <span><%= report.getContent() %></span>
            </div>
        </div>
    </section>
    <!-- section끝 -->

<%@ include file="/WEB-INF/views/common/footer.jsp" %>