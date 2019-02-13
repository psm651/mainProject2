<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>

<html>
  <head>
  
  <script src="/resources/js/jquery-3.3.1.min.js"></script>
  <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
  <script src="/resources/js/jquery-ui.js"></script>
  <script src="/resources/js/popper.min.js"></script>
  <script src="/resources/js/bootstrap.min.js"></script>
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.stellar.min.js"></script>
  <script src="/resources/js/jquery.countdown.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/aos.js"></script>

  <script src="/resources/js/main.js"></script>
   
 
   
   
    <title>What The Health</title>
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    
    

    
    
    
  </head>
  
  <style>
  div p {
        overflow: hidden; 
        text-overflow: ellipsis;
        white-space: nowrap; 
        width: 100px;
        height: 20px;
      }
   
   
   
      
 /*  #javaKing{
     width : 50px;
     height : 50px;
     background-image : url("/resources/images/${post.userImage}");
     background-size : cover;
     border-radius: 100px;
  } */
  .p-4{
  }
  .p-4 .heart{
  	text-align : center;
  	float : right;
  	font-weight : bold;
  }
  
@import url(http://fonts.googleapis.com/css?family=Lato:100,300,400,700,900);
body {
  background-color: #EEEEEE;
}

*, *:before, *:after {
  box-sizing: border-box;
}

.weather-wrapper {
  display: -webkit-box;
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-box-orient: horizontal;
  -webkit-box-direction: normal;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  -webkit-box-pack: center;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center;
}

.weather-card {
  border-radius: 20px;
  position: relative;
  overflow: hidden;
  opacity: 0.8;
  width: 270px;
  height: 180px;
  background-color: white;
  box-shadow: 0px 0px 25px 1px rgba(50, 50, 50, 0.1);
  -webkit-animation: appear 500ms ease-out forwards;
          animation: appear 500ms ease-out forwards;
}
.weather-card h3 {
  font-family: 'Lato', sans-serif;
  font-weight: bold;
  font-size: 40px;
  margin-left: 11px;
  margin-top: 15px;
  color: #B8B8B8;
  bottom: 0;
  left: 35px;
  opacity: 0;
  -webkit-transform: translateX(150px);
      -ms-transform: translateX(150px);
          transform: translateX(150px);
  -webkit-animation: title-appear 500ms ease-out 500ms forwards;
          animation: title-appear 500ms ease-out 500ms forwards;
}
.weather-card p {
  position: absolute;
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  font-size: 28px;
  color: #d2d2d2;
  bottom: 0;
  left: 35px;
  -webkit-animation: title-appear 1s ease-out 500ms forwards;
          animation: title-appear 1s ease-out 500ms forwards;
}

.weather-icon {
  position: relative;
  width: 50px;
  height: 50px;
  top: 0;
  float: right;
  margin: 40px 40px 0 0;
  -webkit-animation: weather-icon-move 5s ease-in-out infinite;
          animation: weather-icon-move 5s ease-in-out infinite;
}

.sun {
  background: #FFCD41;
  border-radius: 50%;
  box-shadow: rgba(255, 255, 0, 0.1) 0 0 0 4px;
  -webkit-animation: light 800ms ease-in-out infinite alternate, weather-icon-move 5s ease-in-out infinite;
          animation: light 800ms ease-in-out infinite alternate, weather-icon-move 5s ease-in-out infinite;
}

@-webkit-keyframes light {
  from {
    box-shadow: rgba(255, 255, 0, 0.2) 0 0 0 10px;
  }
  to {
    box-shadow: rgba(255, 255, 0, 0.2) 0 0 0 17px;
  }
}

@keyframes light {
  from {
    box-shadow: rgba(255, 255, 0, 0.2) 0 0 0 10px;
  }
  to {
    box-shadow: rgba(255, 255, 0, 0.2) 0 0 0 17px;
  }
}
.cloud {
  margin-right: 60px;
  background: #e1e1e1;
  border-radius: 20px;
  width: 25px;
  height: 25px;
  box-shadow: #e1e1e1 24px -6px 0 2px, #e1e1e1 10px 5px 0 5px, #e1e1e1 30px 5px 0 2px, #e1e1e1 11px -8px 0 -3px, #e1e1e1 25px 11px 0 -1px;
}
.cloud:after {
  content: "";
  position: absolute;
  border-radius: 10px;
  background-color: transparent;
  width: 4px;
  height: 12px;
  left: 0;
  top: 31px;
  -webkit-transform: rotate(30deg);
      -ms-transform: rotate(30deg);
          transform: rotate(30deg);
  -webkit-animation: rain 800ms ease-in-out infinite alternate;
          animation: rain 800ms ease-in-out infinite alternate;
}

@-webkit-keyframes rain {
  from {
    box-shadow: #2092A9 8px 0px, #2092A9 32px -6px, #2092A9 20px 0px;
  }
  to {
    box-shadow: #2092A9 8px 6px, #2092A9 32px 0px, #2092A9 20px 6px;
  }
}

@keyframes rain {
  from {
    box-shadow: #2092A9 8px 0px, #2092A9 32px -6px, #2092A9 20px 0px;
  }
  to {
    box-shadow: #2092A9 8px 6px, #2092A9 32px 0px, #2092A9 20px 6px;
  }
}
@-webkit-keyframes weather-icon-move {
  50% {
    -webkit-transform: translateY(-8px);
            transform: translateY(-8px);
  }
}
@keyframes weather-icon-move {
  50% {
    -webkit-transform: translateY(-8px);
            transform: translateY(-8px);
  }
}
.inspiration {
  color: #aeaeae;
  font-family: 'Lato', sans-serif;
  font-weight: 300;
  font-size: 24px;
  text-align: center;
}
.inspiration a {
  color: #FA565F;
  font-weight: 400;
  -webkit-animation: all 300ms ease-in-out;
          animation: all 300ms ease-in-out;
}

@-webkit-keyframes appear {
  0% {
    -webkit-transform: scale(0);
            transform: scale(0);
  }
  50% {
    -webkit-transform: scale(1.05);
            transform: scale(1.05);
  }
  75% {
    -webkit-transform: scale(0.95);
            transform: scale(0.95);
  }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}

@keyframes appear {
  0% {
    -webkit-transform: scale(0);
            transform: scale(0);
  }
  50% {
    -webkit-transform: scale(1.05);
            transform: scale(1.05);
  }
  75% {
    -webkit-transform: scale(0.95);
            transform: scale(0.95);
  }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
  }
}
@-webkit-keyframes title-appear {
  from {
    opacity: 0;
    -webkit-transform: translateX(150px);
            transform: translateX(150px);
  }
  to {
    opacity: 1;
    -webkit-transform: translateX(0px);
            transform: translateX(0px);
  }
}
@keyframes title-appear {
  from {
    opacity: 0;
    -webkit-transform: translateX(150px);
            transform: translateX(150px);
  }
  to {
    opacity: 1;
    -webkit-transform: translateX(0px);
            transform: translateX(0px);
  }
}
  
  
  
  
  </style>
  
  <script type="text/javascript">
  
  
  
  
  $(function(){
    
     //임박한 소모임 getMeeting
     $("#meeting").on("click", function(){
        alert("미팅");
       self.location = "/meeting/listMeeting?postNo"+postNo 
     });
     
     //날씨별 운동추천 getWeather
     $(".exInfo").on("click", function(){
       var postNo = $(this).data("exinfo");
       self.location = "/exInfo/getExInfo?postNo="+postNo 
     });
     
     //추천 식단 커뮤니티
     $(".dietcom").on("click", function(){
       var postNo = $(this).data("dietcom");
       self.location = "/community/getCommunity?postNo="+postNo;
     });
     
     //추천 운동 커뮤니티
     $(".excom").on("click", function(){
      var postNo = $(this).data("excom");
      self.location = "/community/getCommunity?postNo="+postNo;
     });
     
     //썸네일로 이동시 마우스커서로 변경
     $(".img-fluid").on("mouseover", function(){
       $(".img-fluid").css("cursor","pointer")
     });
     
   //날씨 지역위치 바꾸기
 	$('.card-header').css('cursor', 'pointer');
 	$('.card-header').on('click', function(){
 		
 	$('.card-header').tooltip();	
 	});
     
   
   
  });

	
  function cityChange(){
	  
	  var cityName = $("select[name=cityID]").val();
	  
	  $.ajax({
		  		url: "/exinfo/json/getWeather/"+cityName ,
		  		method : "GET",
		  		header : {
		  			"Accept" : "application/json",
					"Content-Type" : "application/json"	
		  		},
		  		
		  		success : function(data, status){
		  			console.log($(".weather-icon sun > h3" ).text())
		  			console.log($(".weather-icon sun > span" ).text())
		  			$("#temperature").text(data["weather"].temperature);
		  			$("#currentWeather").text(data["weather"].currentWeather);
		  			$("#cityName").text(data["weather"].cityName);
		  		}
		  		
	  });//end of ajax
	
  }
  
  </script>
  
  
  
  <body>
  
  <div class="site-wrap">
<!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" /> 
      <!-- ToolBar End /////////////////////////////////////-->
<!-- 툴바 인클루드 시작! -->
  

 <!--    <div class="slide-one-item home-slider owl-carousel"> -->
     
      <div class="site-blocks-cover" style="background-image: url(/resources/video/original.gif); width:100%; height:80%;" data-aos="fade" data-stellar-background-ratio="0.5">

            
             <div class="weather-card madrid" style="margin-left:10px;">
				<div class="card-header" align="center" ><span id="cityName">${weather.cityName}</span>
					<select name="cityID" class="cityID" onchange="cityChange(this)">
						<option value="Busan,KR" 	style="font-size:20px;">부산</option>
		  				<option value="Daegu,KR" 	style="font-size:20px;">대구</option>
						<option value="Incheon,KR" 	style="font-size:20px;">인천</option>
						<option value="Gwangju,KR" 	style="font-size:20px;">광주</option>
						<option value="Daejeon,KR" 	style="font-size:20px;">대전</option>
						<option value="Ulsan,KR" 	style="font-size:20px;">울산</option>
						<option value="Sejong,KR" 	style="font-size:20px;">세종특별자치시</option>
						<option value="Jeju,KR" 	style="font-size:20px;">제주특별자치도</option>
					</select>
				</div> 
			  
         		<div class="weather-icon sun"></div>
       			 <strong><h3 id="temperature">${weather.temperature}℃</h3></strong>
        		<span id="currentWeather" style="margin-left:10px;">${weather.currentWeather}</span>
   			 </div>
   			 
   			 
   			 

   	
       <!--   <video autoplay muted loop>
             <source src="/resources/video/run.mp4" type="video/mp4">
         </video> --> 
     
<!--       <div id="openweathermap-widget-15"></div>
     <div class="row">
  		<div class="col-xs-6 col-sm-3">
  		<select name="state" class="ct_input_g" style="width: 200px; height: 40px" onchange="fncGetState(this)">
			<option value="Seoul,KR" 	style="font-size:20px;" selected="">서울</option>
			<option value="Busan,KR" 	style="font-size:20px;">부산</option>
		  	<option value="Daegu,KR" 	style="font-size:20px;">대구</option>
			<option value="Incheon,KR" 	style="font-size:20px;">인천</option>
			<option value="Gwangju,KR" 	style="font-size:20px;">광주</option>
			<option value="Daejeon,KR" 	style="font-size:20px;">대전</option>
			<option value="Ulsan,KR" 	style="font-size:20px;">울산</option>
			<option value="Sejong,KR" 	style="font-size:20px;">세종특별자치시</option>
			<option value="Jeju,KR" 	style="font-size:20px;">제주특별자치도</option>
		</select>
		</div>
     </div> -->
     
  <!--    <div class="weather-wrapper" style="margin-left:50px;"> -->
<%--      <div class="weather-card madrid" style="z-index:1;">
		 <div class="card-header" align="center">${weather.cityName}</div> 
		  
        <div class="weather-icon sun"></div>
        
        <strong><h3>${weather.temperature}℃</h3></strong>
        <span>${weather.currentWeather}</span>
    </div>  --%>
<!-- </div> -->

         
        <div class="container">
          <div class="row align-items-center justify-content-center">
             <div class="col-md-7 text-center" data-aos="fade"> 
            


              
             </div>
          </div>
        </div>
      </div> 
    </div>


    <%-- <div class="featured-classes bg-light py-5 block-13">
      <div class="container">
        
        <div class="heading-with-border">
          <h2 class="heading text-uppercase">임박한 소모임</h2>
        </div>

        <div class="nonloop-block-13 owl-carousel">
          
          <div class="block-media-1 heading-with-border bg-white">
            <img src="/resources/images/img_1.jpg" alt="Image" class="img-fluid meeting">
            <div class="p-4">
              <h3 class="h5 heading">${post.title}</h3>
              
              <input type="hidden" name="postNo" value="${post.postNo}"/> 
              
              <p>${post.contents}</p>
              <span class="d-flex align-items-center">
                <span class="icon-person h4 mr-3"></span>
                <span>${post.nickName}</span>
              </span>
            </div>
          </div>

          <div class="block-media-1 heading-with-border bg-white">
            <img src="/resources/images/img_2.jpg" alt="Image" class="img-fluid meeting">
            <div class="p-4">
              <h3 class="h5 heading">${post.title}</h3>
              
              <input type="hidden" name="postNo" value="${post.postNo}"/> 
              
              <p>${post.contents}</p>
              <span class="d-flex align-items-center">
                <span class="icon-person h4 mr-3"></span>
                <span>${post.nickName}</span>
              </span>
            </div>
          </div>

          <div class="block-media-1 heading-with-border bg-white">
            <img src="/resources/images/img_1.jpg" alt="Image" class="img-fluid meeting">
            <div class="p-4">
              <h3 class="h5 heading" >${post.title}</h3>
                  
             <input type="hidden" name="postNo" value="${post.postNo}"/> 
         
              <p>${post.contents}</p>
              <span class="d-flex align-items-center">
                <span class="icon-person h4 mr-3"></span>
                <span>${post.nickName}</span>
              </span>
            </div>
          </div>

          <div class="block-media-1 heading-with-border bg-white">
            <img src="/resources/images/img_2.jpg" alt="Image" class="img-fluid meeting">
            <div class="p-4">
              <h3 class="h5 heading">${post.title}</h3>
              
              <input type="hidden" name="postNo" value="${post.postNo}"/> 
              
              <p>${post.contents}</p>
              <span class="d-flex align-items-center">
                <span class="icon-person h4 mr-3"></span>
                <span>${post.nickName}</span>
              </span>
            </div>
          </div>

        </div>

      </div>
    </div> --%>




<!-- 날씨별 운동추천 -->
     <div class="featured-classes bg-light py-3 block-13">
        <div class="container">
        
        <div class="heading-with-border">
          <h2 class="heading text-uppercase">날씨별 운동추천</h2>
        </div>

        <div class="nonloop-block-13 owl-carousel">
          
             <c:forEach var="post" items="${weatherList}">
             
              <div class="block-media-1 heading-with-border bg-white exInfo"  data-exinfo ="${post.postNo}" style="width:350px; height:350px;">
          
                  <c:if test="${empty post.photo}">
                     <img  src="/resources/images/1111.jpg"  class="img-fluid" style="width:350px; height:196px;">
                 </c:if>
                  
                   <c:set var="youtubeThumbnail" value="${post.photo}"/>
                 
                  <c:if test="${!empty post.photo}">
                     <c:choose>
                        <c:when test="${fn:contains(youtubeThumbnail,'https')}">
                           <img src="${post.photo}" class="img-fluid" >
                        </c:when>   
                        <c:otherwise>
                           <img src="/resources/images/upload/${post.photo}"  class="img-fluid">
                        </c:otherwise>                     
                     </c:choose>
                  </c:if>
                         
                  <div class="p-4">
                 		<span>
                       <h3 class="h5 heading">${post.title}</h3></span>
                       <div class="heart">
                       		<img src="../resources/images/fullHeart.png" style="width: 35px;">
                       		${post.likeCount}
                       </div>
                    
                       <span class="d-flex align-items-center" style="width:200px; display:inline-block">
                          <div id="userInfo">
                          
                          	<c:if test="${post.userImage != null and post.userImage != '' }">
								 <img src="/resources/images/userImage/${post.userImage}" style="border-radius: 100px; width:50px; height:50px;">
							</c:if>
			
							<c:if test="${post.userImage == null or post.userImage == '' }">
								<img src="/resources/images/userImage/defaultUser.png" style="border-radius: 100px; width:50px; height:50px;">
							</c:if>
							
                          </div>
                         <span>&nbsp;&nbsp;${post.nickName}</span>
                       </span>
                </div>
                </div>
         </c:forEach>
      

        </div>

      </div>
    </div> 

<!-- 식단 커뮤니티 추천 -->
     <div class="featured-classes bg-light py-3 block-13">
        <div class="container">
        
        <div class="heading-with-border">
          <h2 class="heading text-uppercase">식단 커뮤니티 추천</h2>
        </div>

        <div class="nonloop-block-13 owl-carousel">
          
             <c:set var="i" value="0"/>
             <c:set var="i" value="${i+1}"/>
             <c:forEach var="post" items="${dietComList}">
             
              <div class="block-media-1 heading-with-border bg-white dietcom"  data-dietcom ="${post.postNo}" style="width:350px; height:350px;">
          
                  <c:if test="${empty post.photo}">
                     <img  src="/resources/images/1111.jpg"  class="img-fluid"  style="width:350px; height:196px;">
                 </c:if>
                  
                   <c:set var="youtubeThumbnail" value="${post.photo}"/>
                 
                  <c:if test="${!empty post.photo}">
                     <c:choose>
                        <c:when test="${fn:contains(youtubeThumbnail,'https')}">
                           <img src="${post.photo}" class="img-fluid" >
                        </c:when>   
                        <c:otherwise>
                           <img src="/resources/images/upload/${post.photo}"  class="img-fluid">
                        </c:otherwise>                     
                     </c:choose>
                  </c:if>
                         
                  <div class="p-4">
                 		<span>
                       <h3 class="h5 heading">${post.title}</h3></span>
                       <div class="heart">
                       		<img src="../resources/images/fullHeart.png" style="width: 35px;">
                       		${post.likeCount}
                       </div>
                    
                       <span class="d-flex align-items-center" style="width:200px; display:inline-block">
                          <div id="userInfo">
                          	
                          	<c:if test="${post.userImage != null and post.userImage != '' }">
								 <img src="/resources/images/userImage/${post.userImage}" style="border-radius: 100px; width:50px; height:50px;">
							</c:if>
			
							<c:if test="${post.userImage == null or post.userImage == '' }">
								<img src="/resources/images/userImage/defaultUser.png" style="border-radius: 100px; width:50px; height:50px;">
							</c:if>
                          
                          </div>
                         <span>&nbsp;&nbsp;${post.nickName}</span>
                         <!-- <span class="d-flex align-items-center" style="width:100px; padding-left:200px; padding-bottom:100px; float:left">
	                       		<img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:10px;">
	                       </span> -->
                       </span>
                       
                       
                  <%-- <div class="p-4 col-md-4"> -->
                   <div class="likeImage">
                      <img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:30px; margin-top:30px">
                   </div>
                   <div class="likeCount" style="margin-left:38px">
                      <h5>${post.likeCount}</h5>
                   </div> 
                </div> --%>
                
                </div>
                </div>
         </c:forEach>
      

        </div>

      </div>
    </div>
    
   <div class="featured-classes bg-light py-3 block-13" style="margin-bottom:10em;">
      <div class="container">
        
        <div class="heading-with-border">
          <h2 class="heading text-uppercase">운동 커뮤니티 추천</h2>
        </div>

         <div class="nonloop-block-13 owl-carousel">
          
             <c:set var="i" value="0"/>
             <c:set var="i" value="${i+1}"/>
             <c:forEach var="post" items="${exComList}">
             
              <div class="block-media-1 heading-with-border bg-white excom"  data-excom ="${post.postNo}" style="width:350px; height:350px;">
          
                  <c:if test="${empty post.photo}">
                     <img  src="/resources/images/1111.jpg"  class="img-fluid" style="width:350px; height:196px;">
                 </c:if>
                   
                   <c:set var="youtubeThumbnail" value="${post.photo}"/>
                 
                  <c:if test="${!empty post.photo}">
                     <c:choose>
                        <c:when test="${fn:contains(youtubeThumbnail,'https')}">
                           <img src="${post.photo}" class="img-fluid" >
                        </c:when>   
                        <c:otherwise>
                           <img src="/resources/images/upload/${post.photo}"  class="img-fluid">
                        </c:otherwise>                     
                     </c:choose>
                  </c:if>
                         
                  <div class="p-4">
                  <span>
                       <h3 class="h5 heading">${post.title}</h3></span>
                       <div class="heart">
                       		<img src="../resources/images/fullHeart.png" style="width: 35px;">
                       		${post.likeCount}
                       </div>
                    
                       <input type="hidden" name="postNo" value="${post.postNo}"/> 
                       <!-- <p></p> -->
                       <span class="d-flex align-items-center">
                          <div id="userInfo">
                             <c:if test="${post.userImage != null and post.userImage != '' }">
								 <img src="/resources/images/userImage/${post.userImage}" style="border-radius: 100px; width:50px; height:50px;">
							</c:if>
			
							<c:if test="${post.userImage == null or post.userImage == '' }">
								<img src="/resources/images/userImage/defaultUser.png" style="border-radius: 100px; width:50px; height:50px;">
							</c:if>
                          </div>
                         <span>&nbsp;&nbsp;${post.nickName}</span>
                       </span>
                       
                  <%-- <div class="p-4 col-md-4"> -->
                   <div class="likeImage">
                      <img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:30px; margin-top:30px">
                   </div>
                   <div class="likeCount" style="margin-left:38px">
                      <h5>${post.likeCount}</h5>
                   </div> 
                </div> --%>
                
                </div>
                </div>
         </c:forEach>
      

        </div>

      </div>
    </div>
    
<!-- 
     <div class="site-section bg-light">

      <div class="container">
        
        <div class="heading-with-border text-center mb-5">
          <h2 class="heading text-uppercase">Experts Trainer</h2>
        </div>

          <div class="row">

            <div class="col-lg-4 mb-4">
              <div class="block-trainer">
                <img src="/resources/images/person_4.jpg" alt="Image" class="img-fluid">
                <div class="block-trainer-overlay">
                  <h2>Jonah Smith</h2>
                  <p class="text-white">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur quas iste corporis asperiores placeat earum.</p>
                  <p>
                    <a href="#" class="p-2"><span class="icon-facebook"></span></a>
                    <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                    <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                  </p>
                </div>
              </div>    
            </div>
            <div class="col-lg-4 mb-4">
              <div class="block-trainer">
                <img src="/resources/images/person_3.jpg" alt="Image" class="img-fluid">
                <div class="block-trainer-overlay">
                  <h2>Jonah Smith</h2>
                  <p class="text-white">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur quas iste corporis asperiores placeat earum.</p>
                  <p>
                    <a href="#" class="p-2"><span class="icon-facebook"></span></a>
                    <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                    <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-lg-4 mb-4">
              <div class="block-trainer">
                <img src="/resources/images/person_4.jpg" alt="Image" class="img-fluid">
                <div class="block-trainer-overlay">
                  <h2>Jonah Smith</h2>
                  <p class="text-white">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur quas iste corporis asperiores placeat earum.</p>
                  <p>
                    <a href="#" class="p-2"><span class="icon-facebook"></span></a>
                    <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                    <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                  </p>
                </div>
              </div>    
            </div>
            <div class="col-lg-4 mb-4">
              <div class="block-trainer">
                <img src="/resources/images/person_3.jpg" alt="Image" class="img-fluid">
                <div class="block-trainer-overlay">
                  <h2>Jonah Smith</h2>
                  <p class="text-white">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur quas iste corporis asperiores placeat earum.</p>
                  <p>
                    <a href="#" class="p-2"><span class="icon-facebook"></span></a>
                    <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                    <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                  </p>
                </div>
              </div>
            </div>
            <div class="col-lg-4 mb-4">
              <div class="block-trainer">
                <img src="/resources/images/person_2.jpg" alt="Image" class="img-fluid">
                <div class="block-trainer-overlay">
                  <h2>Jonah Smith</h2>
                  <p class="text-white">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur quas iste corporis asperiores placeat earum.</p>
                  <p>
                    <a href="#" class="p-2"><span class="icon-facebook"></span></a>
                    <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                    <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                  </p>
                </div>
              </div>
            </div>

            <div class="col-lg-4 mb-4">
              <div class="block-trainer">
                <img src="/resources/images/person_1.jpg" alt="Image" class="img-fluid">
                <div class="block-trainer-overlay">
                  <h2>Jonah Smith</h2>
                  <p class="text-white">Lorem ipsum dolor sit amet consectetur adipisicing elit. Aspernatur quas iste corporis asperiores placeat earum.</p>
                  <p>
                    <a href="#" class="p-2"><span class="icon-facebook"></span></a>
                    <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                    <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                  </p>
                </div>
              </div>
            </div>

          </div>

      </div>
      
    </div> --> 
    
    <!-- <footer class="site-footer">
      <div class="container">
        

        <div class="row">
          <div class="col-lg-7">
            <div class="row">
              <div class="col-6 col-md-4 col-lg-8 mb-5 mb-lg-0">
                <h3 class="footer-heading mb-4 text-primary">About</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat quos rem ullam, placeat amet sint vel impedit reprehenderit eius expedita nemo consequatur obcaecati aperiam, blanditiis quia iste in! Assumenda, odio?</p>
                <p><a href="#" class="btn btn-primary pill text-white px-4">Read More</a></p>
              </div>
              <div class="col-6 col-md-4 col-lg-4 mb-5 mb-lg-0">
                <h3 class="footer-heading mb-4 text-primary">Quick Menu</h3>
                <ul class="list-unstyled">
                  <li><a href="#">About</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="#">Approach</a></li>
                  <li><a href="#">Sustainability</a></li>
                  <li><a href="#">News</a></li>
                  <li><a href="#">Careers</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-lg-5">
            <div class="row mb-5">
              <div class="col-md-12"><h3 class="footer-heading mb-4 text-primary">Contact Info</h3></div>
              <div class="col-md-6">
                <p>New York - 2398 <br> 10 Hadson Carl Street</p>    
              </div>
              <div class="col-md-6">
                Tel. + (123) 3240-345-9348 <br>
                Mail. usa@youdomain.com
              </div>
            </div>

            <div class="row">
              <div class="col-md-12"><h3 class="footer-heading mb-4 text-primary">Social Icons</h3></div>
              <div class="col-md-12">
                <p>
                  <a href="#" class="pb-2 pr-2 pl-0"><span class="icon-facebook"></span></a>
                  <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                  <a href="#" class="p-2"><span class="icon-vimeo"></span></a>

                </p>
              </div>
            </div>
            
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p>
            Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
            Copyright &copy; <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All Rights Reserved | This template is made with <i class="icon-heart text-primary" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0.
            </p>
          </div>
          
        </div>
      </div>
    </footer> -->
  </div>

  
    
  </body>
</html>