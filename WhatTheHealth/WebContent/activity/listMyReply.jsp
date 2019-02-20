<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
  
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
	
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
  	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	  <script src="/resources/js/jquery-ui.js"></script>
	  <script src="/resources/js/popper.min.js"></script>
	  <script src="/resources/js/bootstrap.min.js"></script>
	  <script src="/resources/js/owl.carousel.min.js"></script>
	  <script src="/resources/js/jquery.stellar.min.js"></script>
	  <script src="/resources/js/jquery.countdown.min.js"></script>
	  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
	  <script src="/resources/js/bootstrap-datepicker.min.js"></script>
	  <script src="/resources/js/aos.js"></script>
	
	  <script src="/resources/js/main.js"></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
   <style>
  div p {
  		overflow: hidden; 
 	    text-overflow: ellipsis;
  		white-space: nowrap; 
  		width: 100px;
  		height: 20px;
		}
  </style>
  
	<script type="text/javascript">
	
		//=============    검색 / page 두가지 경우 모두  Event  처리 =============	
		function fncGetPageList(currentPage) {
			$("#currentPage").val(currentPage)
			$("form").attr("method" , "POST").attr("action" , "/reply/listMyReply").submit();
		}
		

		
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#pills-sunday-tab" ).on("click" , function() {
				self.location = "/activity/listMyPost"
			});
		 });
		
		
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#pills-monday-tab" ).on("click" , function() {
				self.location = "/reply/listMyReply"
			});
		 });
		 
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#pills-tuesday-tab" ).on("click" , function() {
				self.location = "/activity/listMyInterest"
			});
		 });
		 
		 $(function() {
			 //==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#pills-wednesday-tab" ).on("click" , function() {
				self.location = "/meeting/listJoinedMeeting"
			});
		 });
		
		
		 function getReplyPost(e) {
				
				var category = e.getAttribute("param1");
				var postNo = e.getAttribute("param2");
				
				if(category == '1'){
				 self.location ="/exinfo/getExInfo?postNo="+postNo;
				} else if(category == '2'){
				 self.location ="/community/getCommunity?postNo="+postNo;
				} else if(category == '3'){
				 self.location ="/community/getCommunity?postNo="+postNo;
				} 
			
			
		};	
		
	
	</script>
	

<!-- ToolBar Start /////////////////////////////////////-->
<body>
<!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" />
      <!-- ToolBar End /////////////////////////////////////-->
       <div class="site-wrap">
   <div class="block-schedule overlay site-section" style="background-image: url('/resources/images/img_4.jpg');">
   
      <div class="container mb-3">

        <h1 class="text-white display-5 mb-3">활동정보 조회</h1> 
            <div class="row">
        <div class="col-md-7 text-left text-primary">
                   전체  ${resultPage.totalCount } 건수, 현재 ${resultPage.currentPage}  페이지
               
             </div>
             
             <form class="form-inline" name="detailForm">
              <input type="hidden" id="currentPage" name="currentPage" value=""/>
   			</form>
   			
        </div>
        
          <ul class="nav nav-pills tab-nav mb-4" id="pills-tab" role="tablist">
          <li class="nav-item">
            <a class="nav-link " id="pills-sunday-tab" data-toggle="pill" href="#pills-sunday" role="tab" aria-controls="pills-sunday" aria-selected="true">작성한 게시물</a>
          </li>
          <li class="nav-item">
            <a class="nav-link active" id="pills-monday-tab" data-toggle="pill" href="#pills-monday" role="tab" aria-controls="pills-monday" aria-selected="true">작성한 댓글</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-tuesday-tab" data-toggle="pill" href="#pills-tuesday" role="tab" aria-controls="pills-tuesday" aria-selected="true">관심 게시물</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-wednesday-tab" data-toggle="pill" href="#pills-wednesday" role="tab" aria-controls="pills-wednesday" aria-selected="true">참여 소모임</a>
          </li>
        </ul>
   
        
        <div class="tab-content" id="pills-tabContent">
        	
             <div class="tab-pane fade show active" id="pills-monday" role="tabpanel" aria-labelledby="pills-monday-tab">
                  
            <div class="row-wrap">
              <div class="row bg-white p-2 align-items-center">
			  <div class="col-sm-2 col-md-2 col-lg-2"><strong>No</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-4  text-center"><strong>원문제목</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-4  text-center"><strong>내용</strong></div>
              <div class="col-sm-2 col-md-2 col-lg-2"><strong><span class="icon-clock-o mr-2"></span>작성날짜</strong></div>   
              </div>
            </div>
       
          
         <c:set var="i" value="0"/>
      	 <c:forEach var="reply" items="${replyList}">
         <c:set var ="i" value="${i+1 }"/> 

            <div class="row-wrap">
            <div class="row bg-white p-4 align-items-center">
			<div class="col-sm-2 col-md-2 col-lg-2">${i}</div>
			<div class="col-sm-2 col-md-2 col-lg-4 text-center text-primary" param1="${reply.category }" param2="${reply.postNo }" id="title" onclick="getReplyPost(this);">${reply.postTitle}</div> 
            <div class="col-sm-2 col-md-2 col-lg-4 text-center"><strong>${reply.text }</strong></div>
            <div class="col-sm-2 col-md-2 col-lg-2">${reply.replyDate }</div>    
              </div>
            </div>
        
          
              </c:forEach>
               </div>
               
               
         
               
               
        </div>
   </div>
   
    <jsp:include page="../common/pageNavigator_new.jsp"/>
      </div>
       
    </div>

        
      
     


</body>

</html>
