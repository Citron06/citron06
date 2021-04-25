<%@page import="market.model.vo.pAttach"%>
<%@page import="java.util.List"%>
<%@page import="member.model.vo.Member"%>
<%@page import="market.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Product product = (Product)request.getAttribute("product");
	Member member = (Member)request.getAttribute("member");
	List<pAttach> attachList = (List<pAttach>)request.getAttribute("attachList");
	
	/* boolean editable = 
			loginMember != null &&
			(
				loginMember.getMemberId().equals(member.getMemberId())
				|| MemberService.ADMIN_ROLE.equals(loginMember.getMemberRole())
				
			); */
	boolean editable = "oneman".equals(member.getMemberId());//oneman이 로그인했다고 가정.
	//List<BoardComment> commentList = (List<BoardComment>)request.getAttribute("commentList");
	
%>
 <!-- section시작 -->
    <section>
        <div class="post-container">
            <div class="market-img-container">
                <div class="photo-left-btn"></div>
                <div class="photo-rigth-btn"></div>
                <!-- <div class="market-img" style="width:150px; height:150px;"></div> -->
                <% if(attachList==null){ %>
                <div class="market-img" style="width:150px; height:150px;">첨부된 사진이 없습니다</div>
                <% }else{ %>
	                <% for(pAttach attach : attachList){ %>
		                <div class="market-img" style="width:150px; height:150px;">
		                <img src="<%=request.getContextPath() %>/upload/market/<%=attach.getRenamedFileName() %>"
		                		width="150px"  height="150px">
		                	
		                </div>
	       	        <% } %>
                <% } %>
            </div>
            <div class="seller-title">
                <div class="seller-icon">

                </div>
                <div class="seller-profile">
                    <div class="seller-profile-info">
                        <h3><%=member.getNickId() %></h3>
                        <!-- <h3> 글쓴이 닉네임</h3> -->
                    </div>
                    <div class="seller-good-info">
                        <h3>좋아요 : <%=member.getGoodScore() %></h3>
                        <!-- <h3>좋아요 : 숫자</h3> -->
                    </div>
                </div>
            </div>
            <div class="commet-container">
                <h1><%=product.getTitle() %></h1>
                <br>
                <span><%=product.getArea() %></span>
                <h3><%=product.getPrice() %>원</h3>
                <span><%=product.getDescription() %></span>
               
             
            </div>
            <!-- 수정권한 있는 사람만 보이게 -->
            <%if(editable){ %>
            <div class="market-up-del-container">
             <!-- 장바구니 -->
                <input type="button" value="장바구니" onclick="addCart();">
                <input type="button" value="수정" onclick="updateProduct()">
                <input type="button" value="삭제" onclick="deleteProduct()">
            </div>
            <%} %>
            
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
    <form action="<%=request.getContextPath() %>/member/addCart"  method="post" name="addCartFrm">
    	<input type="hidden" name="boardNo" value="<%=product.getNo() %>"/>
    	<input type="hidden" name="memberId" value="honggd"/>
    </form>
<%if(editable){ %>
	<form 
		action="<%=request.getContextPath()%>/market/marketDelete" 
		method="post"
		name="productDelFrm">
		<input type="hidden" name="no" value="<%=product.getNo()%>"/>
	</form>
	<script>
	function updateProduct(){
		location.href = "<%= request.getContextPath( )%>/market/marketUpdate?no=<%= product.getNo() %>";
	}
	
	function deleteProduct(){
		if(confirm("게시글을 정말 삭제하시겠습니까?")){
			$(document.productDelFrm).submit();
		}
	}
	</script>
<%} %>


<script>
function addCart() {
	if(confirm("장바구니에 담으시겠습니까?")){
	var $frm = $(document.addCartFrm);
	$frm.submit();
	}
};


</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>