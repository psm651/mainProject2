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
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
 	img{ 
		max-width:120%;
    	border-radius: 100px;
	}
     </style> 
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
		
		//============= 회원정보수정 Event  처리 =============	
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $( "#update" ).on("click" , function() {
				 self.close(); 
                 opener.location.replace("/user/updateUser?userId=${user.userId}");
				 //self.location = "/user/updateUser?userId=${user.userId}"
			});
		});
		
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#delete" ).on("click" , function() {
					 self.close(); 
	                 opener.location.replace("/user/deleteUser?userId=${user.userId}");
					 //self.location = "/user/deleteUser?userId=${user.userId}"
				});
			});
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#chatting" ).on("click" , function() {
					 	var userId = $(this).data("param");
					 	
					 	//var roomId = userId+"+${sessionScope.user.userId}";
						
						//$("#append_here").append('<button type="button" class="btn btn-primary" id="receiveRoom" data-param="'+roomId+'">방 입장하기</button>')
						self.location = "/socket/addChatting?userId2="+userId
					 	//$("#mydiv").append('<div id="mydivheader"><div align="right"><img id="exit" onclick="exit()" src="https://img.icons8.com/color/24/000000/delete-sign.png"></div></div><iframe id="chatting" src="/socket/addChatting?userId2='+userId+'" align="middle" style="height:97%; width: 100%;background:rgba(0,0,0,0.3)" frameborder="0" scrolling="no"></iframe>');
						// $("#mydiv").css("display","inline");
				 });
			});
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#point" ).on("click" , function() {
					 self.close(); 
	                 opener.location.replace("/point/updatePoint?receiverId=${user.userId}");
					 //self.location = "/point/updatePoint?receiverId=${user.userId}"
				});
			});
		 
		 $(function() {
			 <c:set var="i" value="0"/>
		  			
				<c:forEach var = "chatting1" items="${chattinglist1}">
					<c:set var="i" value="${i+1}"/>
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#getChatting${i}" ).on("click" , function() {
					 var roomId = $(this).data("param");
					
					self.location = "/socket/getChatting?roomId="+roomId
					 //$("#mydiv").append('<div id="mydivheader"><div align="right"><img id="exit" onclick="exit()" src="https://img.icons8.com/color/24/000000/delete-sign.png"></div></div><iframe id="chatting" src="/socket/getChatting?roomId='+roomId+'" align="middle" style="height:97%; width: 100%;background:rgba(0,0,0,0.3)" frameborder="0" scrolling="no"></iframe>');
					// $("#mydiv").css("display","inline");
					});
				 </c:forEach>
				
			<c:set var="i" value="0"/>
				<c:forEach var = "chatting2" items="${chattinglist2}">
					<c:set var="i" value="${i+1}"/>
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					 $( "#getChatting${chatting2.user2}${i}" ).on("click" , function() {
						var roomId = $(this).data("param");
						// alert(roomId);
					
						self.location = "/socket/getChatting?roomId="+roomId
						//$("#mydiv").empty();	 
						//$("#mydiv").append('<div id="mydivheader"><div align="right"><img id="exit" onclick="exit()" src="https://img.icons8.com/color/24/000000/delete-sign.png"></div></div><iframe id="chatting" src="/socket/getChatting?roomId='+roomId+'" align="middle" style="height:100%; width: 100%;" frameborder="0" scrolling="no"></iframe>');
						//$("#mydiv").css("display","inline");

						});
					</c:forEach>
			});
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#videochatting" ).on("click" , function() {
					 var roomId = $(this).data("param");
						self.location = "/socket/videochat.jsp"
					});
			});
		 
		 
		 
	</script>
	
</head>

<body>

	<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="site-section">
	 <div id="mydiv"></div>

	<div class="container">
	<div class="row">
	 		
	 		<div class="col-md-2"></div>
	 		<div class="col-md-8">
	
	
	    <form class="p-5 bg-white">
	    
	    <c:if test="${sessionScope.user.userId == param.userId}">
	    
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
	  		<div class="col-xs-4 col-md-2 "><strong>가입일자</strong></div>
			<div class="col-xs-8 col-md-4 text-center">${user.regDate}</div>
		</div>
		
		<hr/>
		
		<div class="row">
	  		<div class="col-md-12 text-center ">
	  			<button type="button" class="btn btn-primary" id="update">회원정보수정</button>
	  			
	  			<button type="button" class="btn btn-primary" id="delete">탈퇴</button>
	  			
	  			<br/><br/>
	  			<c:set var="i" value="0"/>
	  			
					<c:forEach var = "chatting1" items="${chattinglist1}">
						<c:set var="i" value="${i+1}"/>
						<button type="button" class="btn btn-primary" id="getChatting${i}" data-param="${chatting1.roomId}" >
						<c:if test = "${user.userId == chatting1.user1}">
						${chatting1.user2}님과 채팅
						</c:if>
						<c:if test = "${user.userId == chatting1.user2}">
						${chatting1.user1}님과 채팅
						</c:if>
						</button>
					</c:forEach>
				
					
					<c:set var="j" value="0"/>
					<c:forEach var = "chatting2" items="${chattinglist2}">
						<c:set var="j" value="${j+1}"/>
						<button type="button" class="btn btn-primary" id="getChatting${chatting2.user2}${j}" data-param="${chatting2.roomId}" >
						<c:if test = "${user.userId == chatting2.user1}">
						${chatting2.user2}님과 채팅
						</c:if>
						<c:if test = "${user.userId == chatting2.user2}">
						${chatting2.user1}님과 채팅
						</c:if>
						</button>
					</c:forEach>
	  			
	  		</div>
		</div>
		
		
		<br/>
		</c:if>
		
		<c:if test="${sessionScope.user.userId != param.userId}">
		
		<div class="row">
	  		<div class="col-xs-4 col-md-2 "><strong>프로필 사진</strong></div>
	  		
	  		<c:if test="${user.userImage != null and user.userImage != '' }">
			<div class="col-xs-8 col-md-4"><img src = "/resources/images/userImage/${user.userImage}" align="middle" height="200"/></div>
			</c:if>
			
			<c:if test="${user.userImage == null or user.userImage ==  ''}">
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
		<c:if test="${user.userStatus == 0}">
		<div class="row">
	  		<div class="col-md-12 text-center " id="append_here">
	  			<button type="button" class="btn btn-primary" id="chatting" data-param="${user.userId }">1:1 채팅</button>
	  			<button type="button" class="btn btn-primary" id="point">포인트 쏘기</button>
	  			
	  			<br/><br/>
	  			
	  			<c:set var="i" value="0"/>
	  			
					<c:forEach var = "chatting1" items="${chattinglist1}">
						<c:set var="i" value="${i+1}"/>
						<button type="button" class="btn btn-primary" id="getChatting${i}" data-param="${chatting1.roomId}" >
						<c:if test = "${sessionScope.user.userId == chatting1.user1}">
						${chatting1.user2}님과 채팅
						</c:if>
						<c:if test = "${sessionScope.user.userId == chatting1.user2}">
						${chatting1.user1}님과 채팅
						</c:if>
						</button>
					</c:forEach>
				
					
					<c:set var="j" value="0"/>
					<c:forEach var = "chatting2" items="${chattinglist2}">
						<c:set var="j" value="${j+1}"/>
						<button type="button" class="btn btn-primary" id="getChatting${j}" data-param="${chatting2.roomId}" >
						<c:if test = "${sessionScope.user.userId == chatting2.user1}">
						${chatting2.user2}님과 채팅
						</c:if>
						<c:if test = "${sessionScope.user.userId == chatting2.user2}">
						${chatting2.user1}님과 채팅
						</c:if>
						</button>
					</c:forEach>
	  			
	  			
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
		</div>
 	</div>
 	<!--  화면구성 div Start /////////////////////////////////////-->

</body>

</html>