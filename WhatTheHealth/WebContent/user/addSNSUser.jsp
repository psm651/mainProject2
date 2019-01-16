<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				self.location = "/index.jsp"
			});
		});	
		
		$(function() {
			//==> 문자인증
			$( "button.btn.btn-default" ).on("click" , function() {
				
				var phone = $("#phone").val()
				console.log(phone);
				
				$.ajax( 
						{
							url : "/user/json/sendSMS" ,
							method : "POST" ,
							//dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data :{
								phone: phone
							},
							success : function(data , status) {
								alert(data);
							}
														
				
					});
			});
		});	
		
		$(function() {
			//==> 메일인증
			$( "button.btn.btn-info" ).on("click" , function() {
				
				var email = $("input[name='email']").val().split('.');
				console.log(email);
				
				//self.location = "/user/mailSender?email="+email;
				alert("메일이 전송되었습니다.")
				
				$.ajax( 
						{
							url : "/user/json/sendMail/"+email[0]+"/"+email[1],
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							}/* ,
							data :{
								email: email
							},
							success : function(data , status) {
								alert(data);
							}
												 */		
				
					});
				});
			});	
			

	
		
		function fncAddUser() {
			
			var id=$("input[name='userId']").val();
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var nickName=$("input[name='nickName']").val();
			
			
			if(id == null || id.length <1){
				alert("아이디는 반드시 입력하셔야 합니다.");
				return;
			}
			if(pw == null || pw.length <1){
				alert("패스워드는  반드시 입력하셔야 합니다.");
				return;
			}
			if(pw_confirm == null || pw_confirm.length <1){
				alert("패스워드 확인은  반드시 입력하셔야 합니다.");
				return;
			}
			if(nickName == null || nickName.length <1){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}
			
			if( pw != pw_confirm ) {				
				alert("비밀번호 확인이 일치하지 않습니다.");
				$("input:text[name='password2']").focus();
				$("#checkPW").css("color","red")
				return;
			}
			
			
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

		//==>"이메일" 유효성Check  Event 처리 및 연결
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		
		

		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
		
		function CheckId(){
			//alert("ddd")
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
							userId : $("input[name='userId']").val()
						}),
						success : function(JSONData , status) {
							//alert(JSONData)
							
							if(JSONData){
								//alert("99999999");
								//$("input[name='userId']").css("background-color","skyblue")
								$("#checkId").css("color","green")
							}
							
							if(!JSONData){
								//alert("이미 존재하는 ID입니다.")
								$("#checkId").css("color","red")
							}
						}							
			
				});
		}
		 
		function CheckNickname(){
			//alert("ddd")
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
							//alert(JSONData)
							
							if(JSONData){
								//alert("99999999");
								//$("input[name='userId']").css("background-color","skyblue")
								$("#checkNickname").css("color","green")
							}
							
							if(!JSONData){
								//alert("이미 존재하는 ID입니다.")
								$("#checkNickname").css("color","red")
							}
						}							
			
				});
		}
		
		function CheckAuth(){
			//alert("ddd")
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
							//alert(JSONData)
							
							if(JSONData){
								//alert("99999999");
								//$("input[name='userId']").css("background-color","skyblue")
								$("#checkAuth").css("color","green")
							}
							
							if(!JSONData){
								//alert("이미 존재하는 ID입니다.")
								$("#checkAuth").css("color","red")
							}
						}							
			
				});
		}
		 
		 
		//==>"ID중복확인" Event 처리 및 연결
		/*  $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			 $("button.btn.btn-info").on("click" , function() {
				popWin 
				= window.open("/user/checkDuplication.jsp",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			});
		});	
 */
	</script>		
    
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />

   	<!-- ToolBar End /////////////////////////////////////-->

	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
		<div class="page-header text-center">
		<h1 class="text-muted">회 원 가 입</h1>
		</div>
		<!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <i class="glyphicon glyphicon-ok" id="checkId"></i>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" placeholder="아이디" oninput="CheckId()">
		    </div>
		   
		  </div> 
		  
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <i class="glyphicon glyphicon-ok" id="checkPW"></i>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉네임</label>
		    <i class="glyphicon glyphicon-ok" id="checkNickname"></i>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임" oninput="CheckNickname()">
		    </div>
		  </div>
		  
		  <div class="form-group">
		  	<label for="gender" class="col-sm-offset-1 col-sm-3 control-label">성별</label>
		  		 <div class="col-sm-offset-1  col-sm-2 text-center">
		  			<input type='radio' name='gender' value='0' checked />여
		  			<input type='radio' name='gender' value='1'  />남
		  		</div>
		  </div>
		  
		  <div class="form-group">
		    <label for="uploadFile" class="col-sm-offset-1 col-sm-3 control-label">프로필 사진</label>
		    <div class="col-sm-4">
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile">
		    </div>
		  </div>

		  
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화</label>
		     <div class="col-sm-4">
		       <input type="text" class="form-control" id="phone" name="phone" placeholder="휴대전화">
		    </div>
		  </div>
		  
	
		  
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="이메일">
		    </div>
		  </div>
		  
		  	  
		   <div class="form-group">
		   	<div class="col-sm-offset-4  col-sm-4 text-center">
		   	인증방법을 선택해주세요.<br/>
		   	
		      <button type="button" class="btn btn-info">메일인증</button>
		   	 <button type="button" class="btn btn-default">핸드폰인증</button>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="authNum" class="col-sm-offset-1 col-sm-3 control-label">인증번호</label>
		    <i class="glyphicon glyphicon-ok" id="checkAuth"></i>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="authNum" name="authNum" placeholder="인증번호" oninput="CheckAuth()">
		       </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >가 &nbsp;입</button>
			  <a class="btn btn-primary btn" href="#" role="button">취&nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>