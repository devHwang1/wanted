<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/community/community.css">
</head>
<style>
pre{
    padding:10px;
    overflow: auto;
    white-space: pre-wrap; /* pre tag내에 word wrap */
}  
</style>
<body>
	<jsp:include page="${pageContext.request.contextPath}/app/fix/header.jsp" />
		<section class="communitySection">
        	<div class="community_header">
            	<h1>
                	<span class="smTxt" style="font-size: 0.9rem;">말해봐요</span>
                	<span class="bgTxt">나의 아이디어</span>
            	</h1>
        	</div>
	        <div class="community">
	            <div class="communityWrap">
	                <form action="${pageContext.request.contextPath}/community/listDi.co" name="writeForm" method="post">
	                    <div class="communityInputSection">
	                        <div class="communityInputWrap">
	                            <textarea name ="community_content" placeholder="커뮤니티에서 가볍게 이야기를 시작해보세요" rows="2" maxlength="1000" id="textarea" style="border: none" ></textarea>
	                            <div class="btnWrap" id="btnWrap">
	                                <p class="count" id="count_cnt" >
	                                    <span>(0/1000)</span>
	                                </p>
	                                <button class="grayBtn" value="글쓰기" onclick="send()" >등록</button>
	                            </div>
	                        </div>
	                    </div>
	                </form>
	                 	<!-- 피드시작 -->
					<table style="width: 980px; table-layout: fixed; overflow: hidden;">
					<c:choose>
						<c:when test="${not empty communitys and fn:length(communitys) > 0}">
							<c:forEach var="community" items="${communitys}">
		                	<tr>
		                	<td>
		                		<div class="communityFeedSection">
		                    		<div class="communityFeedWrap">
		                     			<div class="communityFeedContentWrap">
		                        			<div class="top2">
		                            			<div class="left">
			                                    	<div class="profileThumb" style="background-image: url('/upload/${community.getMemberImgName()}')">
			                                    	</div>
		                           				</div>
		                            			<div class="right5">
						                        	<h2 class="profileName"><c:out value="${community.getMemberNickname()}"/></h2>
						                        	<!-- 작성자 -->
						                            <span><c:out value="${community.getCommunityRegistDate()}"/></span>
						                        	<!-- 작성일 --> 
		                            			</div>
		                        			</div>
		                        			<div class="bottom">
		                            			<div class="feedContents">
		                                			<h3>
		                                    			<pre style="font-size: 0.875rem;  height: auto;" class="text">
<c:out value="${community.getCommunityContents()}"/>
		                                    			</pre>
		                                			</h3>
		                                			<div class="bottom2">
                                				   <!-- <div href="div.communityReplyTab" class="replyFold" id="replyFold">댓글 열기</div>-->
		                                    			<div class="replyFoldRight">
		                                    			 	<c:if test="${sessionScope.memberNum == community.getMemberNum()}">
		                                        				<button class="edit" onclick="location.href='/community/listDu.co?communityNum=${community.getCommunityNum()}'">수정</button>&nbsp;ㅣ&nbsp;
		                                    					<button class="remove_popupBtn" onclick="location.href='/community/listDd.co?communityNum=${community.getCommunityNum()}'">삭제</button>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
		                                    				</c:if>
		                                  				</div>	
		                                			</div>
		                                			<!--
					                                <div class="communityReplyTab" id="communityReplyTab">
					                                	<c:choose>
														<c:when test="${not empty communitys and fn:length(communitys) > 0}">
															<c:forEach var="community" items="${communitys}">
							                                    <div class="replyTab">
							                                        <div class="tabTop">
							                                            <div class="tabLeft"><a href="https://letspl.me/people/%EB%A0%9B%ED%94%8C%EC%9A%B4%EC%98%81%EC%9E%90?tab=info">
							                                                <img src="https://letspl.me/assets/images/prof-no-img.png" class="tabImg0">
							                                            </a></div>
							                                            <div class="tabRight">
							                                                <div class="tabProfile">
							                                                    <p class="tabProfileName">렛플운영자</p>
							                                                    <span class="tabDate">22.10.18 21:53</span>
							                                                </div>
							                                                <div class="tabTxt">
							                                                    <textarea disabled maxlength="500" style="font-size : 0.875rem; height: 125px; " class="tabTextarea">
서비스 출시하시면 웹이나 앱 형태로 나올까요?
지금은 오픈채팅방으로 가기밖에는 안보여서요
출시알림 받기 이런 기능(이메일 등록)이 있는 것 같은데 조금 문구가 헷갈리네요
제대로 등록한게 맞는지 궁금합니다.</textarea>
							                                                </div>
							                                            </div>
							                                        </div>
							                                    </div>
					                                   	 	</c:forEach>
														</c:when>
															<c:otherwise>
																<tr>
																	<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
																</tr>
															</c:otherwise>
														</c:choose>
					                                    <div class="replyInput">
					                                        <div class="replyProfileThumb">
					                                            <img loading="lazy "src="https://letspl.me/assets/images/prof-no-img.png" alt="" class="tabImg">
					                                        </div>
					                                        <div class="txtInput">
					                                            <textarea rows="4" maxlength="500" placeholder="로그인 후 댓글작성이 가능합니다" ></textarea>
					                                            <button class="blackBtn" disabled>등록</button>
					                                        </div>
					                                    </div>
					                                </div>
		                                			 -->		                		
		                            			</div>
		                        			</div>
		                     			</div>
		                     		</div>
		                		</div>
	                		</td>
		                	</tr>
							</c:forEach>
						</c:when>
							<c:otherwise>
								<tr>
									<td colspan="5" align="center">등록된 게시물이 없습니다.</td>
								</tr>
							</c:otherwise>
						</c:choose>
	                </table>
                    <!-- 피드끝 -->  
				</div>
			</div>
   	 	</section>
   	 	<!--
   	<div class="delete" style="display: none;">
        <div class="deleteModal">
            <p class="deleteTit">정말 삭제하시겠습니까?</p>
            <p>삭제한 글은 다시 불러올 수 없습니다.</p>
            <button class="closeDelete">
                <img src="https://letspl.me/assets/icon/ic-close.svg" alt="">
            </button>
            <button type="button" class="seleteDelete" value="삭제" onclick="location.href='/community/listDd.co?communityNum=${community.getCommunityNum()}'">
                <span style="color: white;">삭제</span>
            </button>
        </div>
    </div>
    --> 	
    <jsp:include
		page="${pageContext.request.contextPath}/app/fix/modal.jsp" />
	<jsp:include
		page="${pageContext.request.contextPath}/app/fix/footer.jsp" />
</body>
<script src="https://code.jquery.com/jquery-3.6.1.min.js"></script>
<script>
let page = 1;
$(window).scroll(function(){
	if($(window).scrollTop() + 2 >= $(document).height() - $(window).height()){
		let text = "";
		$(document.body).append(text);
	}
});
$(".closeDelete").click("on", function(i, v){
    $(".delete").css("display", "none");
})
$(".remove_popupBtn").click("on", function(e){
    $(".delete").css("display", "block");
});
$('#textarea').keydown(function() {
    $('#btnWrap').css("display", "flex");
});
$(document).ready(function() {
$('#textarea').on('keyup', function() {
    $('#count_cnt').html("("+$(this).val().length+" / 1000)");
    if($(this).val().length > 1000) {
        $(this).val($(this).val().substring(0, 1000));
        $('#count_cnt').html("(1000 / 1000)");
    }
});
});
$("#replyFold").click(function(){
    // console.log($(".replyFold")[0].innerHTML)
$("#communityReplyTab").toggle(function() {});
if ($(this).text() == "댓글 열기") {
$(this).text("댓글 닫기");
} else {
$(this).text("댓글 열기");
}
});
$(".remove_popupBtn").click("on", function(e) {
$(".remove_popup").css("display", "block")
});
$(".remove_close").click("on", function(i, v){
$(".remove_popup").css("display", "none");
});
function send(){
    if(!writeForm.community_content){
       alert("내용을 작성해주세요.");
       return;
    }
    
    writeForm.submit();
 }
</script>
<script src="${pageContext.request.contextPath}/assets/js/main/modal.js"></script>
</html>