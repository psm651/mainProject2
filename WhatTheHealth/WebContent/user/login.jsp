<%-- <%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>--%>
<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">

	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
<!-- 	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<script type="text/javascript" src="https://static.nid.naver.com/js/naverLogin_implicit-1.0.3.js" charset="utf-8"></script>
  	<script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.min.js"></script> -->
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
<!-- 	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
	
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
    	 body >  div.container{ 
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
    </style> -->
    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		//============= "로그인"  Event 연결 =============
		function fncLogin() {
			
			$("#userId").focus();
			
			var id=$("input:text").val();
			var pw=$("input:password").val();
				
			if(id == null || id.length <1) {
				alert('아이디를 입력하지 않으셨습니다.');
				$("#userId").focus();
				return;
			}
				
			if(pw == null || pw.length <1) {
				alert('패스워드를 입력하지 않으셨습니다.');
				$("#password").focus();
				return;
			}
				
			$("form").attr("method","POST").attr("action","/user/login").submit();
		}

		
			
			
		$( function() {
			
			$("#login").on("click" , function() {
				fncLogin();
			
			});
		});	
		
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		
		 $( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#naver_id_login").on("click" , function() {
				self.location = '/user/naverLogin';
			});
		});
		 
		 $( function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#findId").on("click" , function() {
					self.location = '/user/findId';
				});
			}); 
		 
		 $( function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#findPW").on("click" , function() {
					self.location = '/user/findPassword';
				});
			}); 
		
		
	</script>		
	
</head>

<body>

<%-- <%
    String clientId = "pCIqZTd6HaEQIsJf1Emo";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://192.168.0.51:8080/user/callBack.jsp", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %> --%>


	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->	
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="site-section bg-light">
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
	 		<div class="col-md-6">
		 	 		<h1 class="text-center">로 &nbsp;그 &nbsp;인</h1>

			        <form class="p-5 bg-white">
		  
					  <div class="form-group">
					    <label for="userId" class="col-sm-4 control-label">아 이 디</label>
					    <div class="col-sm-10">
					      <input type="text" class="form-control" name="userId" id="userId"  placeholder="아이디" onkeypress="if(event.keyCode=='13'){fncLogin()}" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <label for="password" class="col-sm-4 control-label">패 스 워 드</label>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" name="password" id="password" placeholder="패스워드" onkeypress="if(event.keyCode=='13'){fncLogin()}" >
					    </div>
					  </div>
					  
					  <div class="form-group">
					    <div class="col-md-10 mb-3 mb-md-2 text-center">
					      <button type="button" class="btn btn-primary" id="login" >로 &nbsp;그 &nbsp;인</button>
					      
					      <img onclick="javascript:location.href='https://kauth.kakao.com/oauth/authorize?client_id=11723e59094c12e0f6ad95a132887387&redirect_uri=http://127.0.0.1:8080/user/kakaoLogin&response_type=code';" 
					      src="/resources/images/kakao_login_btn_medium.png"  height="40">
					      
					      <img id="naver_id_login" src="/resources/images/naver_login_small.png" height="40">
					    
					     <!--  <a class="btn btn-primary btn" href="#" role="button">회 &nbsp;원 &nbsp;가 &nbsp;입</a>
					       <button type="button" class="btn btn-primary" id="findId" >아이디&nbsp;찾기</button>
					       <button type="button" class="btn btn-primary"  id="findPW" >비밀번호&nbsp;찾기</button> -->
					    </div>
					  </div>
					  
					  <div class="form-group">
					  	<div class="col-md-10 mb-3 mb-md-2 text-center">
					  	<a href="/user/addUser" class="col-sm-3">회원가입</a>|
					    <a href="/user/findId" class="col-sm-3">아이디찾기</a>|
					    <a href="/user/findPassword" class="col-sm-3">비밀번호찾기</a> 
					   </div>
					   </div>
					  
					  
					  <%-- <a href="<%=apiURL%>"><img height="50" src="http://static.nid.naver.com/oauth/small_g_in.PNG" align="center"/></a> --%>
					  
					 <!-- <div> 
					  <img id="naver_id_login" src="/resources/images/naver_login.png" height="48">
					  </div>  -->
					  <!-- 네이버아이디로로그인 버튼 노출 영역 -->
					  <!-- <script type="text/javascript">
					  	var naver_id_login = new naver_id_login("jiCyTgVYMmt5oR1k25iy", "http://192.168.0.16:8080/user/callBack.jsp");
					  	var state = naver_id_login.getUniqState();
					  	naver_id_login.setButton("white", 2,40);
					  	naver_id_login.setDomain("http://192.168.0.16:8080/user/loginView.jsp");
					  	naver_id_login.setState(state);
					  	naver_id_login.setPopup();
					  	naver_id_login.init_naver_id_login();
					  </script>  -->
		
					 
					 
<!-- 					  <img onclick="javascript:location.href='https://kauth.kakao.com/oauth/authorize?client_id=11723e59094c12e0f6ad95a132887387&redirect_uri=http://192.168.0.10:8080/user/kakaoLogin&response_type=code';" src="/resources/images/kakao_account_login_btn_medium_narrow.png">
 -->				 
			
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>