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
                    <!-- writer의 value는 loginMember의 getId를 해야 함. -->
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
                    <label class="input-file-button" for="input-file0"><span class="add-product-img0">클릭하면 사진추가 [+]</span></label>
					<input type="file" name="upFile0" id="input-file0" style="display:none;" accept="image/*" onchange="setThumbnail(event)"/>
					
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
//제출시 유효성 검사
$(document.marketEnrollFrm).submit(function(){
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

function setThumbnail(event){

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
			document.querySelector("span.add-product-img"+num).innerText="";
			document.querySelector("span.add-product-img"+num).appendChild(img);

			$("#input-file"+num).attr('disabled', true);
		};
		reader.readAsDataURL(event.target.files[0]);
		if(num<4)
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