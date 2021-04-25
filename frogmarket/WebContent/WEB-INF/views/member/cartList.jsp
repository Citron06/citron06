<%@page import="market.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>

<%
List<Product> list = (List<Product>)request.getAttribute("list");
%>
<section>
 <div class="section-body">
            <div class="board">
            <div class="section-title">
                    <h3>장바구니</h3>
                </div>
			 <%if(list==null || list.isEmpty()){ %>
					<p style="margin: 120px 0;">조회된 게시글이 없습니다.</p>
				<%
					} else{ 
						for(Product p : list){
				%>
							<div class="board-box1" style="cursor:pointer;"
							onclick="location.href='<%= request.getContextPath()%>/market/marketView?no=<%=p.getNo() %>';">
			                    <div class="thumbnail">
			                    <%if(p.getAttach()!=null){ %>
			                    	<img src="<%=request.getContextPath() %>/upload/market/<%=p.getAttach().getRenamedFileName() %>"
		                			width="270px"  height="160px">
			                    <% } %>
			                    </div>
			                    <div class="product-title">
			                        <p><%=p.getTitle() %>, 글번호<%=p.getNo() %></p><input type="hidden" id="boardNo" value="<%=p.getNo() %>"/>
			                        <h3><%=p.getPrice() %>￦</h3>
			                    </div>
			                </div>
			                <form action="<%= request.getContextPath()%>/member/deleteCart" method="post" name="deleteCartFrm" >
								<input type="hidden" name=memberId value="<%=loginMember.getMemberId()%>"/>
								<input type="hidden" name=boardNo value="<%=p.getNo() %>" />
								<button type=submit>삭제</button>
							</form>
			               <!--  <input type="button" value="삭제" onclick="deleteCart()">-->
			                      
				<%
						}
					}
				%>
				 <div class="more"><%=request.getAttribute("pageBar") %></div>
 		</div>
</div>
</section>
 	<form action="<%= request.getContextPath()%>/member/deleteCart" method="post"name="deleteCartFrm" >
		<input type="hidden" name=memberId value="honggd"/>
		<input type="hidden" name=boardNo value="" />
	</form>
 <!-- section끝 -->
    <!-- 게시글 쓰기 이동 버튼 시작 -->
    <div class="post-btn" onclick="location.href='<%= request.getContextPath()%>/member/memberView';" 
                		style="cursor:pointer;"><img src="<%= request.getContextPath() %>/img/add.png"></div>
    <!-- 게시글 쓰기 이동 버튼 끝 -->
    
<script>
   
</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>