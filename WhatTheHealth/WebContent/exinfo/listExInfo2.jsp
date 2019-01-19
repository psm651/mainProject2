<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>



<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
    <title>운동 꿀팁정보</title>
    <meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
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
   <!--  <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script> -->
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
    
    <style>
      div p {
  		overflow: hidden; 
 	    text-overflow: ellipsis;
  		white-space: nowrap; 
  		width: 100px;
  		height: 20px;
		}
    </style>
    
    
  </head>
  <body>
    <!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" /> 
   	<!-- ToolBar End /////////////////////////////////////-->
 
    

<!-- 데이터 받는곳  -->


	<div class="site-section">
      <div class="container">
        <div class="row mb-5">
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="post-entry bg-white">
        
        <c:set var="i" value="0"/>
				<c:forEach var="post" items="${list}">

				<c:set var="i" value="${i+1}"/>
	
				
        
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="post-entry bg-white">
              <div class="image">
                <img src="/resources/images/img_1.jpg" alt="Image" class="img-fluid">
              </div>
              <div class="text p-4">
                <h2 class="h5 text-black">${post.title}</h2>
                <span class="text-uppercase date d-block mb-3">
                <small>${post.postDate}</small>
                </span>
                <p class="mb-0">${post.contents}</p>
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
  </div>
  </div>



    
  </body>
</html>