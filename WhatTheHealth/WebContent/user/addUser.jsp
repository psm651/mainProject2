<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


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
  
  <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	

    
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#join" ).on("click" , function() {
				fncAddUser();
				console.log("가입되라고")
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
		
			$("#cancle").on("click" , function() {
				self.location = "/"
			});
		});	
		
		$(function() {
			//==> 문자인증
			$( "#authSMS" ).on("click" , function() {
				
				var phone = $("#phone").val()
				console.log(phone);
				
				if(phone == "" || phone.length <1 ){
					swal("휴대전화 번호를 입력해주세요", "휴대전화 번호를 입력하지 않으셨습니다", "error");
				 
				    return;
				  }
				
				$.ajax( 
						{
							url : "/user/json/sendSMS" ,
							method : "POST" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data :{
								phone: phone
							},
							success : function(data , status) {
								
							}
														
				
					});
				swal("문자전송이 완료되었습니다.", "","success");
			});
		});	
		
		$(function() {
			//==> 메일인증
			$( "#authMail" ).on("click" , function() {
		
				var email = $("input[name='email']").val().split('.');
				console.log(email);
				 if(email == "" || email.length <1 ){
				    swal("이메일을 입력해주세요", "이메일을 입력하지 않으셨습니다", "error");
				    return;
				  }
				
				swal("메일이 전송되었습니다", "인증번호를 입력해주세요", "success");
		
				$("#checkAuth").css("color","red")
				
				
				$.ajax( 
						{
							url : "/user/json/sendMail/"+email[0]+"/"+email[1],
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}
				
					});
				});
			});	
			

	
		
		function fncAddUser() {
			
			var id=$("#userId").val();
			var pw=$("#password").val();
			var pw_confirm=$("input[name='password2']").val();
			var nickName=$("input[name='nickName']").val();
			var authNum=$("input[name='authNum']").val();
			
			var checkId = document.getElementById('checkId').style.color;
			var checkNickname = document.getElementById('checkNickname').style.color;
			var checkAuth = document.getElementById('checkAuth').style.color;
			console.log(checkAuth);
			
			
			
			
			if(id == null || id.length <1){
				
				swal("아이디를 입력해주세요", "아이디는 반드시 입력해야 합니다", "error");
				return;
			}
			if(pw == null || pw.length <1){
				
				swal("비밀번호를 입력해주세요", "비밀번호는 반드시 입력해야 합니다", "error");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				
				swal("비밀번호 확인을 진행해주세요", "비밀번호 확인은 반드시 입력해야 합니다", "error");
				return;
			}
			if(nickName == null || nickName.length <1){
			
				swal("닉네임을 입력해주세요", "닉네임은 반드시 입력해야 합니다", "error");
				return;
			}
			
			if(authNum == null || authNum.length <1){
		
				swal("메일인증 또는 문자 인증을 진행해주세요", "인증은 반드시 진행해야 합니다", "error");
				return;
			}
			
			if( pw != pw_confirm ) {				
				
				swal("비밀번호를 확인해주세요", "비밀번호 확인이 일치하지 않습니다", "error");
				$("input:text[name='password2']").focus();
				$("#checkPW").css("color","red")
				return;
			}
			
			if( pw == pw_confirm ) {				
				$("#checkPW").css("color","green")
			
			}
			
			if(checkId == 'red'){
		
				swal("이미 존재하는 아이디입니다", "다른 아이디를 입력해주세요", "error");
				return;
			}
			
			if(checkNickname == 'red'){
			
				swal("이미 존재하는 닉네임입니다", "다른 닉네임을 입력해주세요", "error");
				return;
			}
			

			
			if(checkAuth == 'red'){
			
				swal("인증번호가 일치하지 않습니다", "인증번호를 확인해주세요", "error");
				return;
			}
			
			
	
			swal("가입이 완료되었습니다", "", "success");
			$("#addForm").attr("method" , "POST").attr("action" , "/user/addUser").submit();
			
		}
		

		//==>"이메일" 유효성Check  Event 처리 및 연결
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
		
					 swal("이메일 형식이 아닙니다", "이메일을 확인해주세요", "error");
			     }
			});
			 
		});	
		
		

		
		function CheckId(){
			
			$.ajax( 
					{
						url : "/user/json/checkId" ,
						method : "POST" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							userId : $("#userId").val()
						}),
						success : function(JSONData , status) {
					
							
							if(JSONData){
						
								$("#checkId").css("color","green")
							}
							
							if(!JSONData){
								$("#checkId").css("color","red")
							}
						}							
			
				});
		}
		 
		function CheckNickname(){
		
			$.ajax( 
					{
						url : "/user/json/checkNickname" ,
						method : "POST" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							nickName : $("input[name='nickName']").val()
						}),
						success : function(JSONData , status) {
							
							
							if(JSONData){
								
								$("#checkNickname").css("color","green")
							}
							
							if(!JSONData){
								$("#checkNickname").css("color","red")
							}
						}							
			
				});
		}
		
		function CheckAuth(){
			var inputNum = $("input[name='authNum']").val();

			$.ajax( 
					{
						url : "/user/json/checkAuth/"+ inputNum ,
						method : "GET" ,
						dataType : "json" ,
						headers : {
							"Accept" : "application/json",
							"Content-Type" : "application/json"
						},
						data : JSON.stringify({
							inputNum : inputNum
						}),
						success : function(JSONData , status) {
							
							
							if(JSONData){
								
								$("#checkAuth").css("color","green")
							}
							
							if(!JSONData){
								
								$("#checkAuth").css("color","red")
							}
						}							
			
				});
		}
		
		function CheckPw(){
			var pw=$("#password").val();
			var pw_confirm=$("input[name='password2']").val();
			
			if( pw != pw_confirm ) {				
				$("input:text[name='password2']").focus();
				$("#checkPW").css("color","red")
				return;
			}
			
			if( pw == pw_confirm ) {				
				$("#checkPW").css("color","green")
			
			}
			
		}
		 
	
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
		
		<form class="p-5 bg-white" enctype="multipart/form-data" id="addForm">
		
		  <div class="form-group ">
		  
		  	<div class="col-md-12 mb-3 mb-md-0">
		     <label for="userId" class="font-weight-bold">아 이 디</label> 
		    
		     <span class="icon-check mr-3" id="checkId"></span>
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디" oninput="CheckId()">
		   
		    </div>
		  </div> 
		  
		  <div class="form-group">
		  	<div class="col-md-12 mb-3 mb-md-0">
		    <label for="password" class="font-weight-bold">비밀번호</label>
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="password2" class="font-weight-bold">비밀번호 확인</label>
		 
		    <span class="icon-check mr-3" id="checkPW"></span>
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인" oninput="CheckPw()">
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="nickName" class="font-weight-bold">닉네임</label>
		
		    <span class="icon-check mr-3" id="checkNickname"></span>
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임" oninput="CheckNickname()">
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		  	<label for="gender" class="font-weight-bold">성별</label><br/>
		  	
		  			<input type='radio' name='gender' value='0' checked />여&nbsp;&nbsp;&nbsp;
		  			<input type='radio' name='gender' value='1'  />남
		  </div>
		  </div>
		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="uploadFile" class="font-weight-bold">프로필 사진</label>
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile">
		    </div>
		  </div>

		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="phone" class="font-weight-bold">휴대전화</label>
		       <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대전화">
		    </div>
		  </div>
		  
	
		  
		  <div class="form-group">
		   <div class="col-md-12 mb-3 mb-md-0">
		    <label for="email" class="font-weight-bold">이메일</label>
		      <input type="text" class="form-control" id="email" name="email" placeholder="이메일">
		    </div>
		  </div>
		  
		  	  
		   <div class="form-group">
		   	<div class="col-md-12 mb-3 mb-md-0 text-center">
		   	인증방법을 선택해주세요.<br/>
		     <button type="button" class="btn btn-primary pill text-white px-4" id="authMail">메일인증</button>
		   	 <button type="button" class="btn btn-primary pill text-white px-4" id="authSMS">문자인증</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="authNum" class="font-weight-bold">인증번호</label>
		   
		     <span class="icon-check mr-3" id="checkAuth"></span>
		      <input type="text" class="form-control" id="authNum" name="authNum" placeholder="인증번호" oninput="CheckAuth()">
		       </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-md-12 mb-3 mb-md-0 text-center">
		      <button type="button" class="btn btn-primary pill px-4 py-2" id="join">가 &nbsp;&nbsp;입</button>
			   <button type="button" class="btn btn-primary pill px-4 py-2" id="cancle">취&nbsp;&nbsp;소</button>
		    </div>
		  </div>
		</form>
		
		</div>
 	</div>
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	</div>
</body>

</html>