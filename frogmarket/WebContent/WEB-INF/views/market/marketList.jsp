<%@page import="market.model.vo.Product"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	List<Product> list = (List<Product>)request.getAttribute("list");
	String searchKeyword = (String)request.getAttribute("searchKeyword");
%>
<!-- section시작 -->
    <section>
        <div class="section-body">
            <div class="board">
                <div class="section-title">
                    <h3>중고거래</h3>
                </div>
                
                <%if(list==null || list.isEmpty()){ %>
					<p>조회된 게시글이 없습니다.</p>
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
			                        <p><%=p.getTitle() %>, 글번호:<%=p.getNo() %></p>
			                        <h3><%=p.getPrice() %>￦</h3>
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
                		style="cursor:pointer;"></div>
    <!-- 게시글 쓰기 이동 버튼 끝 -->

<script>
<% if(searchKeyword!=null){ %>
	$("#header-search").val("<%=searchKeyword%>");
<% } %>

$("#header-search").keyup(function(e){
	if(e.keyCode == 13){	//입력이 엔터라면
		console.log(this.value);
		
		var newForm = $('<form></form>'); 
		//set attribute (form) 
		newForm.attr("name","marketFinderFrm"); 
		newForm.attr("method","post"); 
		newForm.attr("action","<%=request.getContextPath() %>/market/marketFinder"); 
		// create element & set attribute (input) 
		newForm.append($('<input/>', {type: 'hidden', name: 'searchKeyword', value:this.value })); 
		// append form (to body) 
		newForm.appendTo('body'); 
		// submit form 
		newForm.submit();

		
	}
});

</script>   
<%@ include file="/WEB-INF/views/common/footer.jsp" %>