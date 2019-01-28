<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
  <head>
    <title>식단 커뮤니티 목록 페이지</title>
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
  		var postNo = $(this).data("param");
  		self.location = "/community/getCommunity?postNo="+postNo;
  	});
  });
  
   $(function() {
		$("a[href='#' ]").on("click" , function() {
			self.location = "/community/addDietCom";
		});
	});	
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
    
    <div class="site-section">
    	<div style = "margin-left : 15em">
    		<h2>식단 커뮤니티 목록</h2>
    	</div>
      <div class="container">
      <hr/>
      <br/>
        <p align="right"><a href="#" align="right" class="btn btn-primary pill text-white px-4">글쓰기</a></p>
        <br/>
        <div class="row mb-5">
        

          <c:set var="i" value="0"/>
          <c:set var="i" value="${i+1}"/>
          <c:forEach var="post" items="${list}"> 
          
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="post-entry bg-white" data-param="${post.postNo}">
              <div class="image">
              	<c:if test="${empty post.photo}">
                    <img  src="/resources/images/1111.jpg" class="img-fluid" alt="">
                </c:if>
                <c:set var="youtubeThumbnail" value="${post.photo}"/>
                 
                <c:if test="${!empty post.photo}">
               		<c:choose>
               			<c:when test="${fn:contains(youtubeThumbnail,'https')}">
               				<img src="${post.photo}" class="img-fluid" width= "400;" height= "200;">
               			</c:when>   
               			<c:otherwise>
               				<img src="/resources/images/upload/${post.photo}" class="img-fluid">
               			</c:otherwise>            			
               		</c:choose>
                </c:if>
              </div>
              <div class="text p-6">
                <h2 class="h3 text-black"><a href="#">${post.title}</a></h2>
                <span class="text-uppercase date d-block mb-3"><small>${post.postDate}</small></span>
 				<p class="mb-0">${post.likeCount}</p>
                <span class="text-uppercase date d-block mb-3">
                <small>${post.nickName}</small>
                </span>                
              </div>
            </div>
          </div>    
          
   </c:forEach> 
                          
      </div>
    </div>
  </div>
   </body>
</html>