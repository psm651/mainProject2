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
  </style>
  
  <script type="text/javascript">
  
  
  $(function(){
    
     //임박한 소모임 getMeeting
     $("#meeting").on("click", function(){
        alert("미팅");
       self.location = "/meeting/listMeeting?postNo"+postNo 
     });
     
     //날씨별 운동추천 getWeather
     $("#exInfo").on("click", function(){
        alert("운동정보");
       self.location = "/exinfo/listExinfoWeather?postNo"+postNo 
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
  });
  
  </script>
  
  
  
  <body>
  
  <div class="site-wrap">
<!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" /> 
      <!-- ToolBar End /////////////////////////////////////-->
<!-- 툴바 인클루드 시작! -->
  

 <!--    <div class="slide-one-item home-slider owl-carousel"> -->
     
      <div class="site-blocks-cover" style="background-image: url(/resources/video/original.gif); width:100%; height:80%;" data-aos="fade" data-stellar-background-ratio="0.5">
      <!-- <div class="site-blocks-cover" data-aos="fade" data-stellar-background-ratio="0.5">
         <video autoplay muted loop>
             <source src="/resources/video/run.mp4" type="video/mp4">
         </video> -->
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-7 text-center" data-aos="fade">
            
               <!-- <div class="form-group">             
                <div class="col-sm-4">
                     <input type="text" class="form-control" id="searchKeyword" name="searchKeyword">
                </div>
                
                <div class="form-group">
                   <div class="col-sm-offset-4  col-sm-8 text-right">
                     <button type="button" class="btn btn-primary">검색</button>
                   </div>
              </div>
           </div> -->
            </div>
          </div>
        </div>
      </div> 
    </div>


    <div class="featured-classes bg-light py-5 block-13">
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
    </div>


   <div class="featured-classes bg-light py-3 block-13">
      <div class="container">
        
        <div class="heading-with-border">
          <h2 class="heading text-uppercase">날씨별 운동 추천</h2>
        </div>

        <div class="nonloop-block-13 owl-carousel">
          
          <div class="block-media-1 heading-with-border bg-white">
            <img src="/resources/images/img_1.jpg" alt="Image" class="img-fluid exinfo">
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
            <img src="/resources/images/img_2.jpg" alt="Image" class="img-fluid exinfo">
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
            <img src="/resources/images/img_1.jpg" alt="Image" class="img-fluid exinfo">
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
            <img src="/resources/images/img_2.jpg" alt="Image" class="img-fluid exinfo">
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
                     <img  src="/resources/images/1111.jpg"  class="img-fluid">
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
                             <img src="/resources/images/${post.userImage}" style="border-radius: 100px; width:50px; height:50px;">
                          </div>
                         <span>${post.nickName}</span>
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
                     <img  src="/resources/images/1111.jpg"  class="img-fluid">
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
                             <img src="/resources/images/${post.userImage}" style="border-radius: 100px; width:50px; height:50px;">
                          </div>
                         <span>${post.nickName}</span>
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