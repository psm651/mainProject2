<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
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
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script> -->
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <!-- <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
   
    <!-- Bootstrap Dropdown Hover JS -->
<!--    <script src="/javascript/bootstrap-dropdownhover.min.js"></script> -->

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
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncUpdateUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				history.go(-1);
			});
		});	
		
		//=============이메일" 유효성Check  Event 처리 =============
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		
		 function CheckNickname(){
				//alert("ddd")
				var usedNickname = $("#usedNickname").val();
					console.log(usedNickname);
				if(usedNickname !=  $("input[name='nickName']").val() ){
					console.log("ddd");
					console.log(usedNickname);
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
				if(usedNickname ==  $("input[name='nickName']").val() ){
					console.log("zzz");
					$("#checkNickname").css("color","green")
				}
			}
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var pw=$("input[name='password']").val();
			var pw_confirm=$("input[name='password2']").val();
			var nickName=$("input[name='nickName']").val();
			var checkNickname = document.getElementById('checkNickname').style.color;
			
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
			
			if( pw == pw_confirm ) {				
				$("#checkPW").css("color","green")
			
			}
			
			if(checkNickname == 'red'){
				alert("이미 존재하는 닉네임입니다.")
				return;
			}
	
				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
		}
	
	</script>
	
</head>

<body>
	<input type="hidden" id="usedNickname" value="${sessionScope.user.nickName }"/>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="site-section bg-light">
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-muted">회원정보수정</h3>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="p-5 bg-white" enctype="multipart/form-data">
		
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="userId" class="font-weight-bold">아 이 디</label>
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">아이디는 수정불가</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="password" class="font-weight-bold">비밀번호</label>
		      <input type="password" class="form-control" id="password" name="password" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="password2" class="font-weight-bold">비밀번호 확인</label>
		     <span class="icon-check mr-3" id="checkPW"></span>
		      <input type="password" class="form-control" id="password2" name="password2" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		   <div class="col-md-12 mb-3 mb-md-0">
		    <label for="nickName" class="font-weight-bold">닉 네 임</label>
		   <span class="icon-check mr-3" id="checkNickname"></span>
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}" oninput="CheckNickname()">
		    </div>
		  </div>
		  
		 
		  <div class="form-group">
		   <div class="col-md-12 mb-3 mb-md-0">
		    <label for="phone" class="font-weight-bold">휴대전화</label>
		     	<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}"  >
		    </div>
		  </div>
		  
		   <div class="form-group">
		   <div class="col-md-12 mb-3 mb-md-0">
		    <label for="email" class="font-weight-bold">이메일</label>
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" >
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		  	<label for="gender" class="font-weight-bold">성별</label><br/>
		  			<input type='radio' name='gender' value='0' checked />여
		  			<input type='radio' name='gender' value='1'  />남
		  		</div>
		  </div>
		  
		  <div class="form-group">
		   <div class="col-md-12 mb-3 mb-md-0">
		    <label for="uploadFile" class="font-weight-bold">프로필 사진</label><br/>
		      <img src="/resources/images/userImage/${user.userImage}" align="middle" height="200"/><br/>
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" value="${user.userImage}">
		    </div>
		  </div>

		  
		   <div class="form-group">
		   <div class="col-md-12 mb-3 mb-md-0">
		    <label for="holder" class="font-weight-bold">예 금 주</label>
		      <input type="text" class="form-control" id="holder" name="holder"  value="${user.holder}">
		    </div>
		  </div>
		  
		  <div class="form-group">
		   <div class="col-md-12 mb-3 mb-md-0">
		    <label for="bankName" class="font-weight-bold">은 행 명</label>
		       <select class="form-control" name="bankName" id="bankName">
		       		<option value="" ></option>
				  	<option value="국민" >국민</option>
					<option value="신한" >신한</option>
					<option value="우리" >우리</option>
					<option value="농협" >농협</option>
					<option value="하나" >하나</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="accountNum" class="font-weight-bold">계좌번호</label>
		      <input type="text" class="form-control" id="accountNum" name="accountNum"  value="${user.accountNum}">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-md-10 mb-3 mb-md-2 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    </div>
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>