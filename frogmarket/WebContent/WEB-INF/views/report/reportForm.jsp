<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
<style>
[class^=add-report-img] {
    float: left;
    width: 80px;
    height: 80px;
    margin: 20px 30px 20px 0;
    border: 1px solid rgb(194, 194, 194);
    text-align: center;
}
</style>
  <!-- section시작 -->
    <section>
        <div class="add-report-container">
            <form name="reportEnrollFrm"
				action="<%=request.getContextPath() %>/report/reportEnroll" 
				method="post" enctype="multipart/form-data">
                <div class="add-report-top">
                    <h1>신고 등록</h1>
                    <input type="hidden" name="writer" value="mini12"/>
                </div>
                <div class="add-report-target">
                    <input placeholder="신고할 대상의 아이디를 입력하세요" type="text" name="target" id="target">
                </div>
                <div class="add-product-photo">
                    <label class="input-file-button" for="input-file0"><span class="add-product-img0">클릭하면 사진추가 [+]</span></label>
					<input type="file" name="upFile0" id="input-file0" style="display:none;" accept="image/*" onchange="setThumbnail(event)"/>
					
                </div>
                <div class="add-report-comment">
                    <textarea placeholder="신고 대상에 대해 글을 써주세요" name="comment" id="comment" cols="30" rows="10"></textarea>
                </div>
                <input class="add-report-submit" type="submit" name="" id="" value="등록">
            </form>
        </div>
    </section>
    <!-- section끝 -->

<script>
	//제출시 유효성 검사
	$(document.reportEnrollFrm).submit(function() {
		if (!(confirm("정말 등록하시겠습니까?")))
			return false;

		$target = $('[name=target]');
		if ($target.val() == "") {
			alert("신고할 대상의 아이디를 입력하십시오.");
			console.log($('[name=upFile0]'));
			return false;
		}

		$description = $('[name=comment]');
		if ($description.val() == "") {
			alert("신고 내용을 입력하십시오.");
			return false;
		}

	});

	function setThumbnail(event) {

		var num = $('div.add-report-photo img').length;
		
		var reader = new FileReader();
		reader.onload = function(event) {
			var img = document.createElement("img");
			img.setAttribute("src", event.target.result);
			img.setAttribute("width", "82px");
			img.setAttribute("height", "82px");
			document.querySelector("span.add-report-img" + num).innerText = "";
			document.querySelector("span.add-report-img" + num)
					.appendChild(img);

			$("#input-file" + num).attr('disabled', true);
		};

		reader.readAsDataURL(event.target.files[0]);
		
		if (num < 4) {
			createNewBox();
		}

	}

	function createNewBox() {
		var num = $('div.add-report-photo img').length + 1;

		var $label = $('<label class="input-file-button" for="input-file'+num+'"></label>');
		var $span = $('<span class="add-report-img'+num+'">클릭하면 사진추가 [+]</span>');
		var $input = $('<input type="file" name="upFile'
				+ num
				+ '" id="input-file'
				+ num
				+ '" style="display:none;" accept="image/png, image/jpeg" onchange="setThumbnail(event)"/>');
		$label.append($span);

		$('div.add-report-photo').append($label);
		$('div.add-report-photo').append($input);
	}
</script>

<%@ include file="/WEB-INF/views/common/footer.jsp" %>