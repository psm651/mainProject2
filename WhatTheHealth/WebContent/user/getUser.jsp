<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">

 
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
	
	
	
	
/* /////////////////////////////draggable///////////////////////// */


#mydiv {
  position: absolute;
  z-index: 8;
  text-align: center;
  background : rgba(0,0,0,0);
  height: 650px; 
  width: 500px;
  display: none;
}

#mydivheader {
  cursor: move;
  z-index: 9;
  background-color: rgba(0,0,0,0.3);
  color: #fff;

}

/* /////////////////////////////draggable///////////////////////// */

     </style> 
     
     
     
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
/////////////////////////////draggable/////////////////////////

	$(function(){
	    dragElement(document.getElementById("mydiv"));
	    function dragElement(elmnt) {
		var pos1 = 0, pos2 = 0, pos3 = 0, pos4 = 0;
			if (document.getElementById(elmnt.id + "header")) {
				/* if present, the header is where you move the DIV from:*/
				document.getElementById(elmnt.id + "header").onmousedown = dragMouseDown;
			} else {
				/* otherwise, move the DIV from anywhere inside the DIV:*/
				elmnt.onmousedown = dragMouseDown;
			}
	
		function dragMouseDown(e) {
			e = e || window.event;
			e.preventDefault();
			// get the mouse cursor position at startup:
			pos3 = e.clientX;
			pos4 = e.clientY;
			document.onmouseup = closeDragElement;
			// call a function whenever the cursor moves:
			document.onmousemove = elementDrag;
		}
	
		function elementDrag(e) {
			e = e || window.event;
			e.preventDefault();
			// calculate the new cursor position:
			pos1 = pos3 - e.clientX;
			pos2 = pos4 - e.clientY;
			pos3 = e.clientX;
			pos4 = e.clientY;
			// set the element's new position:
			elmnt.style.top = (elmnt.offsetTop - pos2) + "px";
			elmnt.style.left = (elmnt.offsetLeft - pos1) + "px";
		}
	
		function closeDragElement() {
			/* stop moving when mouse button is released:*/
			document.onmouseup = null;
			document.onmousemove = null;
			}
		}
	 })
	 
	 function exit(){
				$("#mydiv").css("display","none"); 
				$("#mydiv").empty();
			
	}
	
	 /////////////////////////////draggable/////////////////////////
		
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
					 	var userId = $(this).data("param");
					 
					 	$("#mydiv").append('<div id="mydivheader"><div align="right"><img id="exit" onclick="exit()" src="https://img.icons8.com/color/24/000000/delete-sign.png"></div></div><iframe id="chatting" src="/socket/addChatting?userId2='+userId+'" align="middle" style="height:97%; width: 100%;background:rgba(0,0,0,0.3)" frameborder="0" scrolling="no"></iframe>');
						 $("#mydiv").css("display","inline");
				 });
			});
		 
		 $(function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				 $( "#point" ).on("click" , function() {
						self.location = "/point/updatePoint?receiverId=${user.userId}"
					});
			});
		 
		 $(function() {
		
			<c:set var="i" value="0"/>
				<c:forEach var = "chatting1" items="${chattinglist1}">
					<c:set var="i" value="${i+1}"/>
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					 $( "#getChatting${chatting1.user1}${i}" ).on("click" , function() {
						 var roomId = $(this).data("param");
					
							 $("#mydiv").append('<div id="mydivheader"><div align="right"><img id="exit" onclick="exit()" src="https://img.icons8.com/color/24/000000/delete-sign.png"></div></div><iframe id="chatting" src="/socket/getChatting?roomId='+roomId+'" align="middle" style="height:97%; width: 100%;background:rgba(0,0,0,0.3)" frameborder="0" scrolling="no"></iframe>');
							 $("#mydiv").css("display","inline");
							
					
					 });
				</c:forEach>
					
			<c:set var="i" value="0"/>
				<c:forEach var = "chatting2" items="${chattinglist2}">
					<c:set var="i" value="${i+1}"/>
					//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
					 $( "#getChatting${chatting2.user2}${i}" ).on("click" , function() {
						var roomId = $(this).data("param");
						
							$("#mydiv").append('<div id="mydivheader"><div align="right"><img id="exit" onclick="exit()" src="https://img.icons8.com/color/24/000000/delete-sign.png"></div></div><iframe id="chatting" src="/socket/getChatting?roomId='+roomId+'" align="middle" style="height:100%; width: 100%;" frameborder="0" scrolling="no"></iframe>');
							$("#mydiv").css("display","inline");

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

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="site-section">
	 	
	 	<div id="mydiv">
	 	
	 	</div>
	
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
						<button type="button" class="btn btn-primary" id="getChatting${chatting1.user1}${i}" data-param="${chatting1.roomId}" >
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
	  		<div class="col-md-12 text-center " id="append_here">\
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