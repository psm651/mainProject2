<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>
<html>
  <head>
  <!-- 템플릿 js -->
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
  
  <!-- CDN(Content Delivery Network) 호스트 사용 -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	$(function() {
		
		$( "a[href='#' ]:contains('Login')").on("click", function(){
			self.location = "/user/login"	
	 	 });
		
		$( "a[href='#' ]:contains('Logout')").on("click", function(){
			self.location = "/user/logout"	
	 	 });
		
		$( "#main").on("click", function(){
			self.location = "/"	
	 	 });
		
		 /////////////////////////////////////// 운동꿀팁 메뉴바 ///////////////////////////////////////
		 $( "a[href='#' ]:contains('운동꿀팁')").on("click", function(){
			self.location = "/exInfo/listExInfo"
		 });
		 
		 $( "a[href='#' ]:contains('상체')").on("click", function(){
				self.location = "/exInfo/listExInfo?exPart=0"
			 });
		 
		 $( "a[href='#' ]:contains('하체')").on("click", function(){
				self.location = "/exInfo/listExInfo?exPart=1"
			 });
		 
		 $( "a[href='#' ]:contains('복부')").on("click", function(){
				self.location = "/exInfo/listExInfo?exPart=2"
			 });
		 
		 $( "a[href='#' ]:contains('스트레칭')").on("click", function(){
				self.location = "/exInfo/listExInfo?exPart=3"
			 });
		 
		 $( "a[href='#' ]:contains('전신')").on("click", function(){
				self.location = "/exInfo/listExInfo?exPart=4"
			 });
		 
		 /////////////////////////////////////// 스케줄 메뉴바 ///////////////////////////////////////
		 $( "a[href='#' ]:contains('스케줄')").on("click", function(){
				self.location = "/schedule/listSchedule"	//UserId??????????
		 });
		 
		 $( "a[href='#' ]:contains('내 스케줄 관리')").on("click", function(){
				self.location = "/schedule/listSchedule"	//UserId??????????
		 });
		 
		 /* $( "a[href='#' ]:contains('식단')").on("click", function(){
				self.location = "/schedule/getSchedule"	//UserId??????????
		 }); */
		 
		 $( "a[href='#' ]:contains('BMI 계산기')").on("click", function(){
				self.location = "/calculator/bmiCalculator.jsp"	//URL??????????????
		 });
		 
		 $( "a[href='#' ]:contains('칼로리 계산기')").on("click", function(){
				self.location = "/calculator/calorieCalculator.jsp"	//URL??????????????
		 });
		 
		 /////////////////////////////////////// 커뮤니티 메뉴바 ///////////////////////////////////////
		 /* $( "a[href='#' ]:contains('커뮤니티')").on("click", function(){
				self.location = "/product/listProduct?menu=manage"
		 }); */
		 
		 $( "a[href='#' ]:contains('운동 커뮤니티')").on("click", function(){
				self.location = "/exCom/listExCom"
		 });
		 
		 $( "a[href='#' ]:contains('식단 커뮤니티')").on("click", function(){
				self.location = "/dietCom/listDietCom"
		 });
		 
		 /////////////////////////////////////// 소모임 메뉴바 ////////////////////////////////////
		 $( "a[href='#' ]:contains('소모임')").on("click", function(){
				self.location = "/meeing/listMeeting"
		 });
		 
		/////////////////////////////////////// 라이브방송 메뉴바 ////////////////////////////////////
		 $( "a[href='#' ]:contains('라이브방송')").on("click", function(){
				self.location = "/socket/listSocket"
		 });
		 
		/////////////////////////////////////// 마이페이지 메뉴바 ////////////////////////////////////
		/*  $( "a[href='#' ]:contains('마이페이지')").on("click", function(){
				self.location = "/activity/listActivity"
		 }); */
		 
		 $( "a[href='#' ]:contains('내정보 보기')").on("click", function(){
				self.location = "/user/getUser?userId=${sessionScope.user.userId}"
		 });
		 
		 $( "a[href='#' ]:contains('활동정보')").on("click", function(){
				self.location = "/activity/listActivity"
		 });
		 
		 $( "a[href='#' ]:contains('포인트')").on("click", function(){
				self.location = "/point/listPoint"
		 });
		 
		 $( "a[href='#' ]:contains('환급')").on("click", function(){
				self.location = "/refund/listRefund"
		 });
		 
		 $( "a[href='#' ]:contains('History Chart')").on("click", function(){
				self.location = "/schedule/getHistoryChart"
		 });
		 
		  /////////////////////////////////////// 관리페이지 메뉴바 ////////////////////////////////////
		  /*  $( "a[href='#' ]:contains('마이페이지')").on("click", function(){
					self.location = "/activity/listActivity"
		  }); */
			 
		  $( "a[href='#' ]:contains('회원관리')").on("click", function(){
				self.location = "/adminManage/listUserAdminManage"
		  });
			 
		  $( "a[href='#' ]:contains('신고관리')").on("click", function(){
				self.location = "/claim/listClaim"	//????????
		  });
			 
	 	  $( "a[href='#' ]:contains('포인트관리')").on("click", function(){
				self.location = "/adminManage/listPointAdminManage"	//??????????
		  });
			 
 		  $( "a[href='#' ]:contains('환급관리')").on("click", function(){
				self.location = "/refund/listRefund"	//////???????????
		  }); 
 		  
 		 	 

		 
	});
	
	
	
	</script>
	
    <title>IronMuscle &mdash; Colorlib Website Template</title>
    <!-- <meta charset="utf-8"> -->
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
  #main {
  		color: white;
		}
  </style>
  
  <body>
  
  <div class="site-wrap">

<!-- 툴바 인클루드 시작! -->
    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
        <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div>
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    
    <div class="site-navbar-wrap bg-white">
      <div class="site-navbar-top">
        <div class="container py-2">
          <div class="row align-items-center">
            <div class="col-6">
              <a href="#" class="p-2 pl-0"><span class="icon-twitter"></span></a>
              <a href="#" class="p-2 pl-0"><span class="icon-facebook"></span></a>
              <a href="#" class="p-2 pl-0"><span class="icon-linkedin"></span></a>
              <a href="#" class="p-2 pl-0"><span class="icon-instagram"></span></a>
            </div>
            <div class="col-6">
              <div class="d-flex ml-auto">
              
                <a href="#" class="d-flex align-items-center ml-auto mr-4">
                	<c:if test="${user.userId != null}"> 
                  <span class="icon-envelope mr-2"></span>
                  <span class="d-none d-md-inline-block">${user.nickName}님 환영합니다!</span>
                   </c:if>
                </a>
               
                <!-- <a href="tel://12912830302" class="d-flex align-items-center">
                  <span class="icon-phone mr-2"></span>
                  <span class="d-none d-md-inline-block">+1 291 2830 302</span>
                </a> -->
                <a href="#" class="d-flex align-items-center">
                 <c:if test="${user.userId == null}"> 
                  <span class="d-none d-md-inline-block">Login</span>
                  </c:if>
                   <c:if test="${user.userId != null}"> 
                   <span class="d-none d-md-inline-block">Logout</span>
                   </c:if>
                </a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <div class="site-navbar-wrap bg-white">
      
      <div class="container">
        <div class="site-navbar bg-light">
          <div class="py-1">
            <div class="row align-items-center">
              <div class="col-3">
                <h2 class="mb-0 site-logo" id="main">What the <strong>Health</strong> </a></h2>
              </div>
              <div class="col-9">
                <nav class="site-navigation text-right" role="navigation">
                  <div class="container">
                    <div class="d-inline-block d-lg-none ml-md-0 mr-auto py-3"><a href="#" class="site-menu-toggle js-menu-toggle text-black"><span class="icon-menu h3"></span></a></div>

                    <ul class="site-menu js-clone-nav d-none d-lg-block">
                      <!-- <li class="active">
                        <a href="index.jsp">Home</a>
                      </li> -->
                      <li class="has-children">
                       <a href="#">운동꿀팁</a>
                        <ul class="dropdown arrow-top">
                          <li><a href="#">상체</a></li>
                          <li><a href="#">하체</a></li>
                          <li><a href="#">복부</a></li>
                          <li><a href="#">스트레칭</a></li>
                          <li><a href="#">전신</a></li>
                        </ul>
                      </li>
                      <li class = "has-children">
                      	<a href="#">스케줄</a>
                      	<ul class="dropdown arrow-top">
                          <li><a href="#">내 스케줄 관리</a></li>
                       	  <li class="has-children">
                            <a href="#">식단</a>
                            <ul class="dropdown">
                              <li><a href="#">BMI 계산기</a></li>
                              <li><a href="#">칼로리 계산기</a></li>
                            </ul>
                          </li>
                        </ul>
                      </li>
                      <li class = "has-children">
                      	<a href="#">커뮤니티</a>
                      	<ul class="dropdown arrow-top">
                          <li><a href="#">운동 커뮤니티</a></li>
                          <li><a href="#">식단 커뮤니티</a></li>
                        </ul>
                      </li>
                      </li>
                      <li class = "has-children">
                      	<a href="#">소모임</a>
                      </li>
                      <li class = "has-children">
                      	<a href="#">라이브방송</a>
                      </li>
                      <c:if test="${sessionScope.user.role == 'user'}"> 
                      <li class = "has-children">
                      	<a href="#">마이페이지</a>
                      	<ul class="dropdown arrow-top">
                          <li><a href="#">내정보 보기</a></li>
                          <li><a href="#">활동정보</a></li>
                          <li><a href="#">포인트</a></li>
                          <li><a href="#">환급</a></li>
                          <li><a href="#">History Chart</a></li>
                        </ul>
                      </li>
                       </c:if>
                      <c:if test="${sessionScope.user.role == 'admin'}"> 
                      <li class = "has-children">
                      	<a href="#">관리페이지</a>
                      	<ul class="dropdown arrow-top">
                          <li><a href="#">회원관리</a></li>
                          <li><a href="#">신고관리</a></li>
                          <li><a href="#">포인트관리</a></li>
                          <li><a href="#">환급관리</a></li>
                        </ul>
                      </li>
                     </c:if> 
                      
                     <!--  <li><a href="news.html">News</a></li>
                      
                      <li><a href="about.html">About</a></li>
                      <li><a href="contact.html">Contact</a></li> -->
                    </ul>
                  </div>
                </nav>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    <!-- 툴바 인클루드 끝 -->


</body>
</html>