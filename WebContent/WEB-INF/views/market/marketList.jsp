<%@page import="market.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Product> list = (List<Product>)request.getAttribute("list");
<<<<<<< Updated upstream
=======
	String searchKeyword = (String)request.getAttribute("header-search");
>>>>>>> Stashed changes
%>
<!-- section시작 -->
    <section>
        <div class="section-body">
            <div class="board">
                <div class="section-title">
                    <h3>중고거래</h3>
                </div>
                
<<<<<<< Updated upstream
                <%if(list==null || list.isEmpty()){ %>
					<p>조회된 게시글이 없습니다.</p>
=======
                <%if(list == null || list.isEmpty()){ %>
					<p style="margin: 180px 0;">조회된 게시글이 없습니다.</p>
>>>>>>> Stashed changes
				<%
					} else{ 
						for(Product p : list){
				%>
							<div class="board-box1" style="cursor:pointer;"
							onclick="location.href='<%= request.getContextPath()%>/market/marketView?no=<%=p.getNo() %>';">
<<<<<<< Updated upstream
			                    <div class="sumnail"></div>
			                    <div class="product-title">
			                        <p><%=p.getTitle() %>, 글번호:<%=p.getNo() %></p>
			                        <h3><%=p.getPrice() %>￦</h3>
=======
			                    <div class="thumbnail">
			                    <%if(p.getAttach()!=null){ %>
			                    	<img src="<%=request.getContextPath() %>/upload/market/<%=p.getAttach().getRenamedFileName() %>"
			                    	alt="<%=p.getTitle()%>"
		                			width="270px"  height="160px">
			                    <% } %>
			                    </div>
			                    <div class="product-title">
			                    	<span><%=p.getTitle()%></span>
			                    		<%if(("new").equals(p.getStatus())){ %>
			                    			<p>판매중</p>
			                    		<%}else if(("reserved").equals(p.getStatus())){ %>
			                    			<p style="color: red;">예약중</p>
			                    		<% }else{ %>
			                    			<p style="color: #b0b0b0;">판매완료</p>
			                    		<% } %>
			                        <p><%=p.getPrice() %>￦</p>
>>>>>>> Stashed changes
			                    </div>
			                </div>
				<%
						}
					}
				%>
                <div class="more"><%=request.getAttribute("pageBar") %></div>
            </div>
        </div>
    </section>
    <!-- section끝 -->
    <!-- 게시글 쓰기 이동 버튼 시작 -->
    <div class="post-btn" onclick="location.href='<%= request.getContextPath()%>/market/marketForm';" 
<<<<<<< Updated upstream
                		style="cursor:pointer;"></div>
    <!-- 게시글 쓰기 이동 버튼 끝 -->
   
=======
                		style="cursor:pointer;"><img src="<%= request.getContextPath() %>/img/add.png"></div>
    <!-- 게시글 쓰기 이동 버튼 끝 -->

>>>>>>> Stashed changes
<%@ include file="/WEB-INF/views/common/footer.jsp" %>