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
  <script src="/resources/js/owl.carousel.min.js"></script>
  <script src="/resources/js/jquery.stellar.min.js"></script>
  <script src="/resources/js/jquery.countdown.min.js"></script>
  <script src="/resources/js/jquery.magnific-popup.min.js"></script>
  <script src="/resources/js/aos.js"></script>
   <script src="/resources/js/main.js"></script>
   
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	

  <!-- ---------- 모달 -------- -->
  
  <!-- <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
 -->
 <!-- ---------- 모달 -------- -->
  
  <!-- CDN(Content Delivery Network) 호스트 사용 -->
 <!-- 	  <script src="http://code.jquery.com/jquery-2.1.4.min.js"></script> -->
	<script type="text/javascript">
	$(function() {
		
		$( "#login_toolbar").on("click", function(){
			/* self.location = "/user/login"	 */
			$('#loginModal').modal('show')
			/*  $('#loginModal').on('shown.bs.modal', function () { 
               $('#loginModal').modal('show');
			 }); */
			 
/* 			$("#loginModal").modal('show').css({
			    'margin-top': function () { //vertical centering
			        return -($(this).height() / 2);
			    },
			    'margin-left': function () { //Horizontal centering
			        return -($(this).width() / 2);
			    }
			}); */
	 	 });
		
		//$("#kakao_login").on("click", function(){
			//alert("ddddddd");
			//$('#loginModal').hide();
			
			/* if("${sessionScope.user}" != null && "${sessionScope.user}" !=""){
				  
				//location.replace("/main.jsp");
				location.replace("/meeting/listMeeting.jsp");
				
			} ; */
			
			//window.close();
		//});
		
		$( "#logout_toolbar").on("click", function(){
			self.location = "/user/logout"	
	 	 });
		
		$( "#main").on("click", function(){
			self.location = "/"	
	 	 });
		
		 /////////////////////////////////////// 운동꿀팁 메뉴바 ///////////////////////////////////////
		
		 $(document).on("click", '#exinfo_toolbar', function() {
			 //$(self.location).attr("href", "/exInfo/listExInfo")
			  self.location= "/exInfo/listExInfo";
		 });

		 /////////////////////////////////////// 스케줄 메뉴바 ///////////////////////////////////////
		
		 $(document).on("click", '#myschedule_toolbar', function() {
			 if("${sessionScope.user}" == null ||"${sessionScope.user}" == ""){				 
				
				 swal("회원만 이용 가능합니다.", "로그인해주세요", "error");
			
			 } else if("${sessionScope.user}" != null){
				self.location = "/schedule/listSchedule"	//UserId??????????
			 }
		 });
		
		 $(document).on("click", '#calculator_toolbar', function() {
				self.location = "/calculator/calorieCalculator.jsp"	//URL??????????????
		 });
		 
		 $(document).on("click", '#bmi_toolbar', function() {
				self.location = "/calculator/bmiCalculator.jsp"	//URL??????????????
		 });
		 
		 /////////////////////////////////////// 커뮤니티 메뉴바 ///////////////////////////////////////
		 /* $( "a[href='#' ]:contains('커뮤니티')").on("click", function(){
				self.location = "/product/listProduct?menu=manage"
		 }); */
		 $(document).on("click", '#excom_toolbar', function() {
				self.location = "/community/listExCom"
		 });
		 
		 $(document).on("click", '#dietcom_toolbar', function() {
				self.location = "/community/listDietCom"
		 });
		 
		 /////////////////////////////////////// 소모임 메뉴바 ////////////////////////////////////
		 $(document).on("click", '#meeting_toolbar', function() {
				self.location = "/meeting/listMeeting"
		 });
		 
		/////////////////////////////////////// 라이브방송 메뉴바 ////////////////////////////////////
		 $(document).on("click", '#live_toolbar', function() {
				self.location = "/socket/listSocket"
		 });
		 
		/////////////////////////////////////// 마이페이지 메뉴바 ////////////////////////////////////
		 $(document).on("click", '#getuser_toolbar', function() {
				self.location = "/user/getUser?userId=${sessionScope.user.userId}"
		 });
		 
		 $(document).on("click", '#activity_toolbar', function() {
				self.location = "/activity/listMyPost"
		 });
		 
		 $(document).on("click", '#point_toolbar', function() {
				self.location = "/point/listPoint"
		 });
		 
		 $(document).on("click", '#refund_toolbar', function() {
				self.location = "/refund/listRefund"
		 });
		 
		 $(document).on("click", '#history_toolbar', function() {
				self.location = "/schedule/getHistoryChart"
		 });
		 
		  /////////////////////////////////////// 관리페이지 메뉴바 ////////////////////////////////////
		  /*  $( "a[href='#' ]:contains('마이페이지')").on("click", function(){
					self.location = "/activity/listActivity"
		  }); */
		  $(document).on("click", '#useradmin_toolbar', function() { 
				self.location = "/adminManage/listUserAdminManage"
		  });
			 
		  
		  $(document).on("click", '#claim_toolbar', function() { 
				self.location = "/claim/listClaim"	//????????
		  });
			 
		  
		  $(document).on("click", '#pointadmin_toolbar', function() { 
				self.location = "/adminManage/listPointAdminManage"	//??????????
		  });
			 
	 	  $(document).on("click", '#refundadmin_toolbar', function() { 
				self.location = "/refund/listRefundAdmin"	
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
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
  
    <link rel="stylesheet" href="/resources/css/aos.css">

    <link rel="stylesheet" href="/resources/css/style.css">
    
  </head>
  
  <style>
  #main {
  		color: white;
		}

	h2{
		cursor:pointer;
	}

 #loginModal{
/* 	height: 700px;
	margin: 0 auto;
	position: absolute;
    left: 50%;
    top: 50%;
    margin-left: -250px; */
    margin-top: 273px;
}	

  </style>
  
  <body>
  
 <!--  <div class="site-wrap"> -->

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
            <div class="col-8">
             
            </div>
            <div class="col-4">
              <div class="d-flex ml-auto">
            
               	
                <a href="#" class="d-flex align-items-center ml-auto mr-4"> 
               	 <c:if test="${sessionScope.user != null}"> 
                  <span class="icon-heart mr-2"></span>
                  <span class="d-none d-md-inline-block">${sessionScope.user.nickName}님 환영합니다!</span>
                   </c:if>
                </a>
               
               
                <!-- <a href="tel://12912830302" class="d-flex align-items-center">
                  <span class="icon-phone mr-2"></span>
                  <span class="d-none d-md-inline-block">+1 291 2830 302</span>
                </a> -->
                <a href="#" class="d-flex align-items-center ml-auto mr-4"> 
                 <c:if test="${sessionScope.user == null}"> 
                 <span class="icon-user mr-2" id="login_toolbar" data-toggle="modal" data-target="#loginModal">&nbsp; Login</span>
                  </c:if>
                   <c:if test="${sessionScope.user != null}" > 
                   <span class="icon-user mr-2" id="logout_toolbar">&nbsp; Logout</span>
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
                <h2 class="mb-0 site-logo" id="main">What the <strong>Health</strong> </h2>
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
                       <a href="#" id="exinfo_toolbar">운동꿀팁</a>
                       
                      </li>
                      <li class = "has-children">
                      	<a>스케줄</a>
                      	<ul class="dropdown arrow-top">
                          <li><a href="#" id="myschedule_toolbar">내 스케줄 관리</a></li>
                       	  <li><a href="#" id="calculator_toolbar">칼로리 계산기</a></li>
                       	  <li><a href="#" id="bmi_toolbar">BMI 계산기</a></li>
                        </ul>
                      </li>
                      <li class = "has-children">
                      	<a>커뮤니티</a>
                      	<ul class="dropdown arrow-top">
                          <li><a href="#" id="excom_toolbar">운동 커뮤니티</a></li>
                          <li><a href="#" id="dietcom_toolbar">식단 커뮤니티</a></li>
                        </ul>
                      </li>
                   
                      <li class = "has-children">
                      	<a href="#" id="meeting_toolbar">소모임</a>
                      </li>
                      <li class = "has-children">
                      	<a href="#" id="live_toolbar">라이브방송</a>
                      </li>
                      <c:if test="${sessionScope.user.role == 'user'}"> 
                      <li class = "has-children">
                      	<a>마이페이지</a>
                      	<ul class="dropdown arrow-top">
                          <li><a href="#" id="getuser_toolbar">내정보 보기</a></li>
                          <li><a href="#" id="activity_toolbar">활동정보</a></li>
                          <li><a href="#" id="point_toolbar">포인트</a></li>
                          <li><a href="#" id="refund_toolbar">환급</a></li>
                          <li><a href="#" id="history_toolbar">History Chart</a></li>
                        </ul>
                      </li>
                       </c:if>
                      <c:if test="${sessionScope.user.role == 'admin'}"> 
                      <li class = "has-children">
                      	<a>관리페이지</a>
                      	<ul class="dropdown arrow-top">
                          <li><a href="#" id="useradmin_toolbar">회원관리</a></li>
                          <li><a href="#" id="claim_toolbar">신고관리</a></li>
                          <li><a href="#" id="pointadmin_toolbar">포인트관리</a></li>
                          <li><a href="#" id="refundadmin_toolbar">환급관리</a></li>
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
<!-- </div> -->



   <!-- Modal -->
  <div class="modal modal-center fade" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="my80sizeCenterModalLabel" >
  <div class="modal-dialog modal-lg" role="document">
    <div class="modal-content modal-80size">
      <div class="modal-header">Login
        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
      </div>
      <div class="modal-body">
      
     <jsp:include page="/user/login.jsp" />  
        
      </div>
    </div>
  </div>
</div>  

</body>
</html>