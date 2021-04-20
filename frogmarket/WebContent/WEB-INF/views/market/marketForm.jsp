<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
    <!-- section시작 -->
    <section>
        <div class="add-product-container">
            <form
			name="marketEnrollFrm"
			action="<%=request.getContextPath() %>/market/marketEnroll" 
			method="post" enctype="multipart/form-data">
                <div class="add_product-top">
                    <h1>상품등록</h1>
                    <input type="hidden" name="writer" value="oneman"/>
                    
                    <select name="status">
                        <option value="new" selected="selected">판매중</option>
                        <option value="reserved">예약중</option>
                        <option value="soldout">판메 완료</option>
                    </select>
                    <select name="local">
                        <option value="" selected="selected" required>지역 선택</option>
                        <option value="서울">서울</option>
                        <option value="인천">인천</option>
                        <option value="대구">대구</option>
                        <option value="대전">대전</option>
                        <option value="부산">부산</option>
                        <option value="순천">순천</option>
                        <option value="강원도">강원도</option>
                    </select>
                </div>
                <div class="add-product-title">
                    <input placeholder="게시글 제목을 정해주세요" type="text" name="title" id="title" required>
                </div>

                <div class="add-product-photo">
                    <label class="input-file-button" for="input-file1"><span class="add-product-img1">클릭하면 사진추가 [+]</span></label>
					<input type="file" name="upFile1" id="input-file1" style="display:none;" accept="image/*" onchange="setThumbnail(event)"/>
					
                </div>
                <div class="add-product-price">
                    <input type="number" name="price" placeholder="￦ 가격 기제" required>
                </div>
                <div class="add-product-comment">
                    <textarea name="description" id="description" cols="30" rows="10" placeholder="상품에 대해 글을 써주세요" required></textarea>
                </div>
            	<input class="add-product-submit" type="submit" name="" id="" value="등록">	
            </form>
        </div>
    </section>
    <!-- section끝 -->
<script>
function setThumbnail(event){
/*     <div class="add-product-photo">
    <label class="input-file-button" for="input-file1"><span class="add-product-img">클릭하면 사진추가 [+]</span></label>
	<input type="file" name="upFile1" id="input-file1" style="display:none;" accept="image/*" onchange="setThumbnail(event)"/>
	
</div> */
	var num = $('div.add-product-photo span').length;
	console.log(num);
	
	var reader = new FileReader(); 
	reader.onload = function(event) { 
		var img = document.createElement("img"); 
		img.setAttribute("src", event.target.result); 
		img.setAttribute("width","82px");
		img.setAttribute("height","82px");
		document.querySelector("span.add-product-img"+num).innerText="";
		document.querySelector("span.add-product-img"+num).appendChild(img);
	}; 
		
		reader.readAsDataURL(event.target.files[0]);

	createNewBox();
}

function createNewBox(){
	var num = $('div.add-product-photo span').length+1;
	
	var $label = $('<label class="input-file-button" for="input-file'+num+'"></label>');
	var $span = $('<span class="add-product-img'+num+'">클릭하면 사진추가 [+]</span>');
	var $input = $('<input type="file" name="upFile'+num+'" id="input-file'+num+'" style="display:none;" accept="image/*" onchange="setThumbnail(event)"/>');
	$label.append($span);
	
	$('div.add-product-photo').append($label);
	$('div.add-product-photo').append($input);
}




</script>
<%@ include file="/WEB-INF/views/common/footer.jsp" %>