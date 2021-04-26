<%@page import="report.model.vo.Report"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
	List<Report> rlist = (List<Report>) request.getAttribute("reportList");
<<<<<<< Updated upstream
=======
	String searchTarget = request.getParameter("searchTarget");
	String location = request.getContextPath() + "/report/reportView?no=";
	int showPage = 10;
>>>>>>> Stashed changes
%>
<%@ include file="/WEB-INF/views/common/header.jsp"%>

<!-- section시작 -->
<section>
	<div class="section-body black-section">
		<div class="black-banner"></div>
		<div class="board black-board">
			<div class="section-title black-title">
				<h3>신고 게시판</h3>
<<<<<<< Updated upstream
			</div>
			<%
				if (rlist != null && !rlist.isEmpty()) {
					for (int i = 0; i < rlist.size(); i++) {
						Report report = rlist.get(i);
			%>
			<div class="black-board-box<%= (i + 1) %>">
				<div class="black-img<%= (i + 1) %>"></div>
				<div class="black-comment">
					<h4>@<%=report.getMemberReportId()%>를 신고합니다.</h4>
					<p>@<%=report.getMemberId()%></p>
					<p><%=report.getRegDate()%></p>
				</div>
			</div>
			<%
					if ((i + 1) == 4) {
			%>
			<div class="more black-more"></div>
			<%
=======
				<form id="targetFrm"
					action="<%=request.getContextPath()%>/report/reportFinder">
	                <input type="text" name="searchTarget" id="searchTarget"
	                	value="<%= ((searchTarget == null || searchTarget.isEmpty()) ? "" : searchTarget) %>"
	                	size="25" placeholder="아이디 검색"/>
				</form>
			</div>
			<div class="black-container">
				<%
					if (rlist != null && !rlist.isEmpty()) {
					for (int i = 0; i < rlist.size(); i++) {
						Report report = rlist.get(i);
				%>
				<a href="<%=location + report.getReportNo()%>">
					<div class="black-board-box<%=(i + 1)%>">
						<div class="black-img">
							<img src="<%=request.getContextPath()%>/img/no.png">
						</div>
						<div class="black-comment">
							<h4>
								@<%=report.getMemberReportId()%>를 신고합니다.
							</h4>
							<p>
								@<%=report.getMemberId()%></p>
							<p><%=report.getRegDate()%></p>
						</div>
					</div>
				</a>
				<%
					if((i + 1) == showPage){
>>>>>>> Stashed changes
						break;
					}
				}
			} else {
			%>
<<<<<<< Updated upstream
			<div class="list-none">
				<h1>등록된 게시글이 없습니다.</h1>
			</div>
			<%
				}
			%>
		</div>
			<div class="more black-more"></div>
	</div>
</section>
			<script>
			$(function(){ 
				var cnt = 0;
				$('.black-more').click(function(){
						$.ajax({
							url: "<%=request.getContextPath()%>/report/xmlReportList",
							success : function(data) {
								var $root = $(data).find(":root");
								var $reports = $root.find("report");
	
								cnt += 1;
								console.log(cnt);
								
								$(".black-board").html('<div class="section-title black-title"><h3>신고 게시판</h3></div>');
								$reports.each(function(index, report){
									var id = $(report).children("id").text();
									var target = $(report).children("target").text();
									var date = $(report).children("date").text();
	
									var $comment = $("<div class='black-comment'></div>");
									$comment.append("<h4>@"+ target +"를 신고합니다.</h4>")
									   .append("<p>@" + id + "</p>")
									   .append("<p>" + date + "</p>");
	
									var $box = $("<div class='black-board-box"+ (index + 1) +"'></div>");
									$box.append("<div class='black-img"+ (index + 1) +"'></div>")
									   <%-- .append("<td><img src='<%= request.getContextPath() %>/images/" + profile + "'/></td>") --%>
									   .append($comment)
									   .appendTo(".black-board");
									   
									   if((index + 1) == (cnt * 2)){
										  return false;
									   }
								});
	
								$(".black-board").append("<div class='more black-more'></div>");
=======
				<div class="list-none">
					<h1 style="margin: 180px 0;">등록된 게시글이 없습니다.</h1>
				</div>
				<%
				}
			%>
			</div>
			<% if(rlist.size() > showPage){ %>
			<div class="more black-more" data-page="1"
				data-total-pages="<%=(rlist.size() / showPage) + ((rlist.size() % showPage == 0) ? 0 : 1)%>"
				onclick="moreResult(this, <%=showPage%>)">
				<p>더보기</p>
			</div>
			<% } %>
		</div>
	</div>
</section>
			<script>
				function moreResult(e, showPage){
					
						var nextPage = parseInt($(e).attr("data-page")) + 1;
						var searchTarget = $("#searchTarget").val();
						
						$.ajax({
							url: "<%=request.getContextPath()%>/report/xmlReportList",
							data: {"searchTarget" : searchTarget},
							success : function(data) {
								var $root = $(data).find(":root");
								var $reports = $root.find("report");
								var $location = "<%= request.getContextPath() %>/report/reportView?no=";
								var $no = "<%= request.getContextPath() %>/img/no.png";
								
								$(".black-container").html('');
								$reports.each(function(index, report){
									var no = $(report).children("no").text();
									var id = $(report).children("id").text();
									var target = $(report).children("target").text();
									var date = $(report).children("date").text();
									
									var $aTag = $("<a href='"+ $location + no +"'></a>");
									$aTag.append("<h4>@"+ target +"를 신고합니다.</h4>")
									   .append("<p>@" + id + "</p>")
									   .append("<p>" + date + "</p>");
	
									var $comment = $("<div class='black-comment'></div>");
									$comment.append($aTag);
									
									var $box = $("<div class='black-board-box"+ (index + 1) +"'></div>");
									$box.append("<div class='black-img'><img src='"+ $no +"'></div>")
									   <%-- .append("<td><img src='<%= request.getContextPath() %>/images/" + profile + "'/></td>") --%>
									   .append($comment)
									   .appendTo(".black-container");
									   
									   if((index + 1) == (nextPage * showPage)){
										   return false;
									   }
								});
								
								if ( $(e).data("total-pages") <= nextPage ){
							        $(e).remove();
							      }else{
							        $(e).attr("data-page", nextPage );
							      }
>>>>>>> Stashed changes
								
								},
							error : function(xhr, status,err) {
								console.log(xhr, status,err);
								}
							});
<<<<<<< Updated upstream
					});
			});
			</script>
<!-- section끝 -->
<!-- 게시글 쓰기 이동 버튼 시작 -->
<div class="post-btn"></div>
=======
					};
			</script>
<!-- section끝 -->
<!-- 게시글 쓰기 이동 버튼 시작 -->
<div class="post-btn" onclick="location.href='<%= request.getContextPath()%>/report/reportForm';" 
                		style="cursor:pointer;"><img src="<%= request.getContextPath() %>/img/add.png"></div>
>>>>>>> Stashed changes
<!-- 게시글 쓰기 이동 버튼 끝 -->

<%@ include file="/WEB-INF/views/common/footer.jsp"%>