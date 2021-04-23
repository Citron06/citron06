<%@page import="market.model.vo.pAttach"%>
<%@page import="java.util.List"%>
<%@page import="market.model.vo.Product"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<%
	Product product = (Product)request.getAttribute("product");
	List<pAttach> attachList = (List<pAttach>)request.getAttribute("attachList"); 
%>
    <!-- section시작 -->
    <section>
        <div class="add-product-container">
            <form
			name="marketUpdateFrm"
			action="<%=request.getContextPath() %>/market/marketUpdate" 
			method="post" enctype="multipart/form-data">
                <div class="add_product-top">
                    <h1>상품수정</h1>
                    <!-- writer의 value는 oneman대신 loginMember의 getId를 해야 함. -->
                    <input type="hidden" name="writer" value="oneman"/>
                    <input type="hidden" name="no" value="<%=product.getNo()%>"/>
                    
                    <select name="status">
                        <option value="new" <% if("new".equals(product.getStatus()) ){ %>selected <%} %>>판매중</option>
                        <option value="reserved" <% if("reserved".equals(product.getStatus()) ){ %>selected <%} %>>예약중</option>
                        <option value="soldout" <% if("soldout".equals(product.getStatus()) ){ %>selected <%} %>>판매 완료</option>
                    </select>
                    <select name="local">
                        <option value="">지역 선택</option>
                        <option value="서울" <% if("서울".equals(product.getArea()) ){ %>selected <%} %>>서울</option>
                        <option value="인천" <% if("인천".equals(product.getArea()) ){ %>selected <%} %>>인천</option>
                        <option value="대구" <% if("대구".equals(product.getArea()) ){ %>selected <%} %>>대구</option>
                        <option value="대전" <% if("대전".equals(product.getArea()) ){ %>selected <%} %>>대전</option>
                        <option value="부산" <% if("부산".equals(product.getArea()) ){ %>selected <%} %>>부산</option>
                        <option value="순천" <% if("순천".equals(product.getArea()) ){ %>selected <%} %>>순천</option>
                        <option value="강원도" <% if("강원도".equals(product.getArea()) ){ %>selected <%} %>>강원도</option>
                    </select>
                </div>
                <div class="add-product-title">
                    <input value="<%=product.getTitle() %>" type="text" name="title" id="title" required>
                </div>
                
                <div class="add-product-photo">
                	<!-- 원래 있던 이미지 -->
                	<div class="previous-added-img">
						<%for(pAttach attach : attachList){ %>
						<label class="input-file-button" for="prev-<%=attach.getNo() %>">
							<span class="add-product-img<%=attach.getNo() %>">
								<img id="<%=attach.getNo() %>" src="<%=request.getContextPath() %>/upload/market/<%=attach.getRenamedFileName() %>"
								 width="82px" height="82px">
			                </span>
						</label>
						<!-- 원래 이미지들은 name 값을 upFile로 주지 않아서 "upFile"+num으로 제출받지 못하게 함 -->
						<input type="file" name="<%=attach.getNo() %>" id="prev-<%=attach.getNo() %>" style="display:none;" accept="image/*" onchange="setThumbnail(event)"/>

						<% } %>
					</div>
					<!-- 새로 추가한 이미지 -->
					<!-- <div class="newly-added-img">
	                    <label class="input-file-button" for="input-file0"><span class="add-product-img0">클릭하면 사진추가 [+]</span></label>
						<input type="file" name="upFile0" id="input-file0" style="display:none;" accept="image/*" onchange="setThumbnail(event)"/>
					</div> -->
				</div>

                <div class="add-product-price">
                    <input type="number" name="price" value="<%=product.getPrice()%>" required>
                </div>
                <div class="add-product-comment">
                    <textarea name="description" id="description" cols="30" rows="10" required><%=product.getDescription() %></textarea>
                </div>
            	<input class="add-product-submit" type="submit" name="" id="" value="등록">	
            </form>
        </div>
    </section>
    <!-- section끝 -->
<script>



//제출시 유효성 검사
$(document.marketUpdateFrm).submit(function(){
	if(!(confirm("정말 등록하시겠습니까?")))
		return false;
	
	$local = $('[name=local]');
	if($local.val()==""){
		alert("지역을 입력하십시오.");
		return false;
	}

	$title = $('[name=title]');
	if($title.val()==""){
		alert("제목을 입력하십시오.");
		return false;
	}
	
	$description = $('[name=description]');
	if($description.val()==""){
		alert("내용을 입력하십시오.");
		return false;
	}
	
	var $img = $('input[type="file"]');
	$img.each(function(index,elem){
		$(elem).attr('disabled', false);
	});
});

var newNum=0;
function setThumbnail(e){

	var num = $('div.add-product-photo img').length;
	console.log("childnum : "+num);
	
	if(num>=5){
		alert("사진은 5개까지 첨부할 수 있습니다.")
	}
	else {
		var reader = new FileReader(); 
		reader.onload = function(event) { 
			var img = document.createElement("img"); 
			img.setAttribute("src", event.target.result); 
			img.setAttribute("width","82px");
			img.setAttribute("height","82px");
			//e.target is input:file
			
			document.querySelector("span.add-product-img"+e.target.name).innerText="";
			document.querySelector("span.add-product-img"+e.target.name).appendChild(img);
			e.target.name="upFile"+newNum;
			console.log("e.target.name : "+e.target.name);

			$("#input-file"+num).attr('disabled', true);
		};
		reader.readAsDataURL(event.target.files[0]);
		if(!(e.target.id).includes("prev"))
			createNewBox();
	}
	
}

function createNewBox(){
	var num = $('div.add-product-photo img').length+1;
	
	var $label = $('<label class="input-file-button" for="input-file'+num+'"></label>');
	var $span = $('<span class="add-product-img'+num+'">클릭하면 사진추가 [+]</span>');
	var $input = $('<input type="file" name="upFile'+num+'" id="input-file'+num+'" style="display:none;" accept="image/*" onchange="setThumbnail(event)"/>');
	$label.append($span);
	
	$('div.add-product-photo').append($label);
	$('div.add-product-photo').append($input);
}




</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>