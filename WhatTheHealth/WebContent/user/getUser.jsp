<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<!-- <meta name="viewport" content="width=device-width, initial-scale=1.0" /> -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<!-- <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	 -->
	<!-- Bootstrap Dropdown Hover CSS -->
<!--    <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
   
    <!-- Bootstrap Dropdown Hover JS -->
 <!--   <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->
 
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
	<!-- <style>
 		body {
            padding-top : 50px;
        }
     </style> -->
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#update" ).on("click" , function() {
					self.location = "/user/updateUser?userId=${user.userId}"
				});
		});
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#delete" ).on("click" , function() {
						self.location = "/user/deleteUser?userId=${user.userId}"
					});
			});
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#chatting" ).on("click" , function() {
						self.location = "/user/updateUser?userId=${user.userId}"
					});
			});
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#point" ).on("click" , function() {
						self.location = "/point/updatePoint?receiverId=${user.userId}"
					});
			});
		
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="site-section bg-light">
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-muted">회원정보조회</h3>
	    </div>
	    
	    <form class="p-5 bg-white">
	    
	    <c:if test="${sessionScope.user.userId == param.userId}">
	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>프로필 사진</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "/resources/images/userImage/${user.userImage}" align="middle" height="200"/></div>
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>닉 네 임</strong></div>
			<div class="col-xs-8 col-md-4">${user.nickName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>보유 포인트</strong></div>
			<div class="col-xs-8 col-md-4">${user.havingPoint}P</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성  별</strong></div>
			<div class="col-xs-8 col-md-4">${user.gender == 0 ? '여자' : '남자'}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>휴대전화</strong></div>
			<div class="col-xs-8 col-md-4">${user.phone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이 메 일</strong></div>
			<div class="col-xs-8 col-md-4">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>예 금 주</strong></div>
			<div class="col-xs-8 col-md-4">${user.holder}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>은 행 명</strong></div>
			<div class="col-xs-8 col-md-4">${user.bankName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>계좌번호</strong></div>
			<div class="col-xs-8 col-md-4">${user.accountNum}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가입일자</strong></div>
			<div class="col-xs-8 col-md-4">${user.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id="update">회원정보수정</button>
	  			<button type="button" class="btn btn-primary" id="delete">탈퇴</button>
	  		</div>
		</div>
		
		
		<br/>
		</c:if>
		
		<c:if test="${sessionScope.user.userId != param.userId}">
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>프로필 사진</strong></div>
			<div class="col-xs-8 col-md-4"><img src = "/resources/images/userImage/${user.userImage}" align="middle" height="200"/></div>
		</div>
		
		<hr/>
		
		<div class="row">
	  	<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
		<div class="col-xs-8 col-md-4">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  	<div class="col-xs-4 col-md-2 "><strong>닉 네 임</strong></div>
		<div class="col-xs-8 col-md-4">${user.nickName}</div>
		</div>
		
		<hr/>
		<c:if test="${user.userStatus == 0}">
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id="chatting">1:1 채팅</button>
	  			<button type="button" class="btn btn-primary" id="point">포인트 쏘기</button>
	  		</div>
		</div>
		</c:if>
		
		<c:if test="${user.userStatus == 1}">
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<span id="receiverId" class="help-block">
		      	 	<strong class="text-danger">탈퇴한 회원입니다.</strong>
		      	</span>
	  		</div>
		</div>
		</c:if>
		
		<c:if test="${user.userStatus == 2}">
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<span id="receiverId" class="help-block">
		      	 	<strong class="text-danger">블랙리스트 처리된 회원입니다.</strong>
		      	</span>
	  		</div>
		</div>
		</c:if>
		
		<br/>
		
		</c:if>
	
		</form>
		</div>
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>