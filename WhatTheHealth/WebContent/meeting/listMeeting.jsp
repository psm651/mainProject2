<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
  <head>
    <title>소모임 목록 페이지</title>
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
    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
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
    
    
       <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
  </head>
  
  <script type="text/javascript">
 	
   $(function(){
  	$(".post-entry").on("click", function(){
  		var meetNo = $(this).data("param");
  		self.location = "/meeting/getMeetingMap?meetNo="+meetNo;
  	});
  });
  
   $(function() {
		$("#addMeeting").on("click" , function() {
			self.location = "/meeting/addMeeting";
		});
	});	
   
   /* $(function() {
		$("#addSocket").on("click" , function() {
			self.location = "/socket/addLiveStream";
		});
	}); */
  </script>
  
  
  <body>

   <div class="site-wrap">
     <jsp:include page="/layout/toolbar.jsp" /> 

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
<!--    <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div> -->
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    

    
<!--     <div class="site-blocks-cover inner-page overlay" style="background-image: url(images/hero_bg_2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7 text-center">
            <h1 class="mb-5">News &amp; <strong>Updates</strong></h1>
          </div>
        </div>
      </div>
    </div>   -->

    <div class="site-section">
      <div class="container">
      <div><h2>소모임 목록</h2></div> 
      <hr/>
       <p align="right"><a href="#" align="right" class="btn btn-primary pill text-white px-4"  id="addMeeting">글쓰기</a></p>
      <br/>
   
       
        
        <div class="row mb-5">
          <c:set var="i" value="0"/>
          <c:set var="i" value="${i+1}"/>
          <c:forEach var="meeting" items="${list}"> 
          
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="post-entry bg-white box" data-param="${meeting.meetNo}">
              <div class="image"  style="width:400px; height:200px">
              	<c:if test="${empty meeting.post.photo}">
                    <img  src="/resources/images/1111.jpg" class="img-fluid" alt="">
                </c:if>
                <c:set var="youtubeThumbnail" value="${meeting.post.photo}"/>
                <c:if test="${!empty meeting.post.photo}">
                <c:choose>
		               			<c:when test="${fn:contains(youtubeThumbnail,'https')}">
		               				<img src="${meeting.post.photo}" class="img-fluid" >
		               			</c:when>   
		               			<c:otherwise>
		               				<img src="/resources/images/upload/${meeting.post.photo}"  class="img-fluid">
		               			</c:otherwise>            			
		               		</c:choose>
                	<%-- <img src="/resources/images/upload/${meeting.post.photo}" class="img-fluid" alt=""> --%>
                </c:if>
              </div>
              <div class="text col-md-8">
                <h2 class="h3" ><a href="#">${meeting.post.title}</a></h2>
                <span class="text-uppercase date d-block mb-3">${meeting.post.postDate}</span>
 				<%-- <p class="mb-0">${meeting.post.likeCount}</p>
                <span class="text-uppercase date d-block mb-3">
                <small>${meeting.post.nickName}</small>
                </span>   --%>              
                <div class="userInfo">
                			<c:if test="${meeting.post.userImage != null and meeting.post.userImage != '' }">
                				<img src="/resources/images/userImage/${post.userImage}" style="border-radius:100px; width:50px; height: 50px;">
                			</c:if>
                			<c:if test="${meeting.post.userImage == null or meeting.post.userImage ==  ''}">
								<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>
						    </c:if>
                			${meeting.post.nickName}
                		</div>
              </div>
              
              <div class="col-md-4">
 						<div class="likeImage">
 							<img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:30px; margin-top:30px">
 						</div>
 						<div class="likeCount" style="margin-left:38px">
 							<h5>${meeting.post.likeCount}</h5>
 						</div>
 					</div>

            </div>
          </div>    
          
   </c:forEach> 
                          
   </div>    
         <!-- div : end -->
          
   <%-- </c:forEach>  --%>
                          
      </div>
      <!-- container : end -->
    </div>
  </div>
   </body>
</html>