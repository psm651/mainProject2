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
  <script src="/resources/js/bootstrap-datepicker.min.js"></script>
  <script src="/resources/js/aos.js"></script>

  <script src="/resources/js/main.js"></script>
	
    <title>IronMuscle &mdash; Colorlib Website Template</title>
    
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
    
  </head>
  
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
  
  
  $(function(){
	 
	  //임박한 소모임 getMeeting
	  $("#meeting").on("click", function(){
		  alert("미팅");
		 self.locaiton = "/meeting/listMeeting?postNo"+postNo 
	  });
	  
	  //날씨별 운동추천 getWeather
	  $("#exInfo").on("click", function(){
		  alert("운동정보");
		 self.locaiton = "/exinfo/listExinfoWeather?postNo"+postNo 
	  });
	  
	  //추천 식단 커뮤니티
	  $("#dietcom").on("click", function(){
		  alert("추천식단");
		 self.locaiton = "/dietcom/listDietComReCom?postNo="+postNo 
	  });
	  
	  //추천 운동 커뮤니티
	  $(".excom").on("click", function(){
		  alert("추천운동");
		self.locaiton = "/excom/listExComRecom?postNo"+postNo 
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
      
<!--       <div class="site-blocks-cover" style="background-image: url(/resources/images/hero_bg_2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-7 text-center" data-aos="fade">
           
            </div>
          </div>
        </div>
      </div>   -->

      <div class="site-blocks-cover" style="background-image: url(/resources/images/22222.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
        <div class="container">
          <div class="row align-items-center justify-content-center">
            <div class="col-md-7 text-center" data-aos="fade">
            
               <div class="form-group">		    	
		    	<div class="col-sm-4">
		      		<input type="text" class="form-control" id="searchKeyword" name="searchKeyword">
		    	</div>
		    	
		    	<div class="form-group">
		    		<div class="col-sm-offset-4  col-sm-8 text-right">
		      		<button type="button" class="btn btn-primary">검색</button>
		   		 </div>
		  </div>
		  </div>
            </div>
          </div>
        </div>
      </div> 
    </div>
<!-- 
    <div class="border-bottom">
      <div class="row no-gutters">
        <div class="col-md-6 col-lg-3">
          <div class="w-100 h-100 block-feature p-5 bg-light">
            <span class="d-block mb-3">
              <span class="flaticon-padmasana display-4"></span>
            </span>
            <h2>Yoga</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora fugiat iure eveniet perferendis odit est.</p>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="w-100 h-100 block-feature p-5">
            <span class="d-block mb-3">
              <span class="flaticon-weight display-4"></span>
            </span>
            <h2>Weight Lifting</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora fugiat iure eveniet perferendis odit est.</p>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="w-100 h-100 block-feature p-5 bg-light">
            <span class="d-block mb-3">
              <span class="flaticon-boxing-gloves display-4"></span>
            </span>
            
            <h2>Boxing</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora fugiat iure eveniet perferendis odit est.</p>
          </div>
        </div>
        <div class="col-md-6 col-lg-3">
          <div class="w-100 h-100 block-feature p-5">
            <span class="d-block mb-3">
              <span class="flaticon-running display-4"></span>
            </span>
            <h2>Running</h2>
            <p>Lorem ipsum dolor sit amet consectetur adipisicing elit. Tempora fugiat iure eveniet perferendis odit est.</p>
          </div>
        </div>
      </div>
    </div> --> <!-- .block-feature -->

<!--     <div class="site-section">
      <div class="container">
        <div class="row align-items-center">
          <div class="col-md-12 col-lg-5 mb-5 mb-lg-0">
            <h2 class="mb-3 text-uppercase">All About <strong class="text-black font-weight-bold">Our Gym</strong></h2>
            <p class="lead">Lorem ipsum dolor sit amet consectetur adipisicing elit. Eaque accusamus, rerum illo facilis reiciendis.</p>
            <p class="mb-4">Iste aut dolorem veritatis saepe nesciunt distinctio voluptas sapiente sunt perspiciatis autem minima, iure provident. Lorem ipsum dolor sit amet, consectetur adipisicing elit. Vero, quas.</p>
            <ul class="site-block-check">
              <li>Lorem ipsum dolor sit amet, consectetur adipisicing.</li>
              <li>Nemo, voluptate? Voluptates odit, aperiam nostrum! Ipsa.</li>
              <li>Itaque voluptatum ducimus aliquam, est fuga molestiae?</li>
              <li>Accusamus porro at commodi delectus, nesciunt molestiae.</li>
            </ul>
            <p><a href="#" class="btn btn-primary pill px-4">Read More</a></p>
          </div>
          <div class="col-md-12 col-lg-6 ml-auto">
            <img src="/resources/images/about.jpg" alt="Image" class="img-fluid">
          </div>
        </div>
      </div>
    </div> -->

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


	<div class="featured-classes bg-light py-5 block-13">
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


	  <div class="featured-classes bg-light py-5 block-13">
      <div class="container">
        
        <div class="heading-with-border">
          <h2 class="heading text-uppercase">식단 커뮤니티 추천</h2>
        </div>

        <div class="nonloop-block-13 owl-carousel">
          
          <div class="block-media-1 heading-with-border bg-white">
            <img src="/resources/images/img_1.jpg" alt="Image" class="img-fluid dietcom">
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
            <img src="/resources/images/img_2.jpg" alt="Image" class="img-fluid dietcom">
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
            <img src="/resources/images/img_1.jpg" alt="Image" class="img-fluid dietcom">
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
            <img src="/resources/images/img_2.jpg" alt="Image" class="img-fluid dietcom">
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
    
	<div class="featured-classes bg-light py-5 block-13">
      <div class="container">
        
        <div class="heading-with-border">
          <h2 class="heading text-uppercase">운동 커뮤니티 추천</h2>
        </div>

        <div class="nonloop-block-13 owl-carousel">
          
          <div class="block-media-1 heading-with-border bg-white">
            <img src="/resources/images/img_1.jpg" alt="Image" class="img-fluid excom">
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
            <img src="/resources/images/img_2.jpg" alt="Image" class="img-fluid excom">
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
            <img src="/resources/images/img_1.jpg" alt="Image" class="img-fluid excom">
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
            <img src="/resources/images/img_2.jpg" alt="Image" class="img-fluid excom">
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
    


    <div class="block-schedule overlay site-section" style="background-image: url('resources/images/22222.jpg');">
      <div class="container">

        <h2 class="text-white display-4 mb-5">Schedule</h2>

        <ul class="nav nav-pills tab-nav mb-4" id="pills-tab" role="tablist">
          <li class="nav-item">
            <a class="nav-link active" id="pills-sunday-tab" data-toggle="pill" href="#pills-sunday" role="tab" aria-controls="pills-sunday" aria-selected="true">Sunday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-monday-tab" data-toggle="pill" href="#pills-monday" role="tab" aria-controls="pills-monday" aria-selected="true">Monday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-tuesday-tab" data-toggle="pill" href="#pills-tuesday" role="tab" aria-controls="pills-tuesday" aria-selected="false">Tuesday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-wednesday-tab" data-toggle="pill" href="#pills-wednesday" role="tab" aria-controls="pills-wednesday" aria-selected="false">Wednesday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-thursday-tab" data-toggle="pill" href="#pills-thursday" role="tab" aria-controls="pills-thursday" aria-selected="false">Thursday</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" id="pills-friday-tab" data-toggle="pill" href="#pills-friday" role="tab" aria-controls="pills-friday" aria-selected="false">Friday</a>
          </li>
        </ul>
        <div class="tab-content" id="pills-tabContent">
          <div class="tab-pane fade show active" id="pills-sunday" role="tabpanel" aria-labelledby="pills-sunday-tab">
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Running</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> David Holmes</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Weight Lifting</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> Bruce Mars</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Yoga</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> Josh White</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Running</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> David Holmes</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Weight Lifting</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> Bruce Mars</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>

          </div>

          <div class="tab-pane fade" id="pills-monday" role="tabpanel" aria-labelledby="pills-monday-tab">
            
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Weight Lifting</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> Bruce Mars</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Running</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> David Holmes</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Yoga</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> Josh White</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Running</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> David Holmes</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>
            <div class="row-wrap">
              <div class="row bg-white p-4 align-items-center">
                <div class="col-sm-3 col-md-3 col-lg-3"><h3 class="h5">Weight Lifting</h3></div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-clock-o mr-3"></span>8:00am &mdash; 10:00am</div>
                <div class="col-sm-3 col-md-3 col-lg-3"><span class="icon-person mr-3"></span> Bruce Mars</div>
                <div class="col-sm-3 col-md-3 col-lg-3 text-md-right"><a href="#" class="btn btn-primary pill px-4 mt-3 mt-md-0">Join Now</a></div>     
              </div>
            </div>

          </div>

          
        </div>

        

      </div>      
    </div>

    <div class="site-section block-14">

      <div class="container">
        
        <div class="heading-with-border text-center">
          <h2 class="heading text-uppercase">Testimonials</h2>
        </div>

        <div class="nonloop-block-14 owl-carousel">

          <div class="d-flex block-testimony">
            <div class="person mr-3">
              <img src="/resources/images/person_1.jpg" alt="Image" class="img-fluid rounded-circle">
            </div>
            <div>
              <h2 class="h5">Katie Johnson, CEO</h2>
              <blockquote>&ldquo;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias accusantium qui optio, possimus necessitatibus voluptate aliquam velit nostrum tempora ipsam!&rdquo;</blockquote>
            </div>
          </div>
          <div class="d-flex block-testimony">
            <div class="person mr-3">
              <img src="/resources/images/person_2.jpg" alt="Image" class="img-fluid rounded-circle">
            </div>
            <div>
              <h2 class="h5">Jane Mars, Designer</h2>
              <blockquote>&ldquo;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias accusantium qui optio, possimus necessitatibus voluptate aliquam velit nostrum tempora ipsam!&rdquo;</blockquote>
            </div>
          </div>
          <div class="d-flex block-testimony">
            <div class="person mr-3">
              <img src="/resources/images/person_3.jpg" alt="Image" class="img-fluid rounded-circle">
            </div>
            <div>
              <h2 class="h5">Shane Holmes, CEO</h2>
              <blockquote>&ldquo;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias accusantium qui optio, possimus necessitatibus voluptate aliquam velit nostrum tempora ipsam!&rdquo;</blockquote>
            </div>
          </div>
          <div class="d-flex block-testimony">
            <div class="person mr-3">
              <img src="/resources/images/person_4.jpg" alt="Image" class="img-fluid rounded-circle">
            </div>
            <div>
              <h2 class="h5">Mark Johnson, CEO</h2>
              <blockquote>&ldquo;Lorem ipsum dolor sit amet, consectetur adipisicing elit. Alias accusantium qui optio, possimus necessitatibus voluptate aliquam velit nostrum tempora ipsam!&rdquo;</blockquote>
            </div>
          </div>

        </div>

      </div>
      
    </div>



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
      
    </div>
    
    <footer class="site-footer">
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
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
          <!--   Copyright &copy; <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All Rights Reserved | This template is made with <i class="icon-heart text-primary" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a> -->
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
    </footer>
  </div>

  
    
  </body>
</html>