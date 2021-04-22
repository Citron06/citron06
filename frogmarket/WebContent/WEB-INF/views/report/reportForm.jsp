<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="/WEB-INF/views/common/header.jsp" %>
   
  <!-- section시작 -->
    <section>
        <div class="add-report-container">
            <form name="marketEnrollFrm"
				action="<%=request.getContextPath() %>/report/reportEnroll" 
				method="post" enctype="multipart/form-data">
                <div class="add-report-top">
                    <h1>신고 등록</h1>
                    <input type="hidden" name="writer" value="mini12"/>
                </div>
                <div class="add-report-target">
                    <input placeholder="신고할 대상의 아이디를 입력하세요" type="text" name="target" id="target">
                </div>
                <div class="add-report-photo">
                    <div class="add-report-img">
                        <p>0/5</p>
                    </div>
                </div>
                <div class="add-report-comment">
                    <textarea placeholder="신고 대상에 대해 글을 써주세요" name="comment" id="comment" cols="30" rows="10"></textarea>
                </div>
                <input class="add-report-submit" type="submit" name="" id="" value="등록">
            </form>
        </div>
    </section>
    <!-- section끝 -->
    
<%@ include file="/WEB-INF/views/common/footer.jsp" %>