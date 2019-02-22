<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>

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

<style type="text/css">
 	img{ 
		max-width:120%;
    	border-radius: 100px;
	}
  	input.hidden {
    position: absolute;
    left: -9999px;
	}

#profile-image1 {
    cursor: pointer;
  
     width: 100px;
    height: 100px;
	border:2px solid #03b1ce ;}
	.tital{ font-size:16px; font-weight:500;}
	 .bot-border{ border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0
	 }

</style>

<script>


  $(function(){
	$("button:contains('회원정보수정')").on("click", function(){
		self.location="/adminManage/updateUserAdminManage?userId=${user.userId}"
	});	  
	
  });

</script>

</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="site-section">
	<div class="container">
	<div class="row">
	 		
	 		<div class="col-md-2"></div>
	 		<div class="col-md-8">
	
	
	    <form class="p-5 bg-white">
	    

	    
	    <div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>프로필 사진</strong></div>

	  		<c:if test="${user.userImage != null and user.userImage != '' }">
			<div class="col-xs-8 col-md-4"><img src = "/resources/images/userImage/${user.userImage}" align="middle" height="200"/></div>
			</c:if>
			
			<c:if test="${user.userImage == null or user.userImage == '' }">
			<div class="col-xs-8 col-md-4"><img src = "/resources/images/userImage/defaultUser.png" align="middle" height="200"/></div>
			</c:if>
			
		</div>
		
		<hr/>
	
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>아 이 디</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.userId}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>닉 네 임</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.nickName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>보유 포인트</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.havingPoint}P</div>
		</div>
		
		<hr/>
		
		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>성  별</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.gender == 0 ? '여자' : '남자'}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>휴대전화</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.phone}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>이 메 일</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.email}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>예 금 주</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.holder}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>은 행 명</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.bankName}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>계좌번호</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.accountNum}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2"><strong>계정상태</strong></div>
	  		<c:if test="${user.userStatus =='0'}">
				<div class="col-xs-8 col-md-4 text-center">일반</div>
			</c:if>
	  		<c:if test="${user.userStatus =='1'}">
				<div class="col-xs-8 col-md-4 text-center">탈퇴</div>
			</c:if>
	  		<c:if test="${user.userStatus =='2'}">
				<div class="col-xs-8 col-md-4 text-center">블랙리스트</div>
			</c:if>						
		</div>
		
		<hr/>		
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>가입일자</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id="update">회원정보수정</button>

	  		</div>
		</div>
		
		
		<br/>

		
	
		
		<br/>
	
	
		</form>
		</div>
		</div>
		</div>
 	</div>

</body>
</html>