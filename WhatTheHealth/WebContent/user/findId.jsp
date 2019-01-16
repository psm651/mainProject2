<%@ page contentType="text/html; charset=EUC-KR" %>
<%@ page pageEncoding="EUC-KR"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- Bootstrap Dropdown Hover CSS -->
   <link href="/css/animate.min.css" rel="stylesheet">
   <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <!-- Bootstrap Dropdown Hover JS -->
   <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
   
	<!--  ///////////////////////// CSS ////////////////////////// -->
	<style>
		body {
            padding-top : 50px;
        }
    </style>
    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
		//============= "수정"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "button.btn.btn-primary" ).on("click" , function() {
				fncfindId();
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
		
		//=============이메일" 유효성Check  Event 처리 =============
		 $(function() {
			 
			 $("input[name='email']").on("change" , function() {
					
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		
		///////////////////////////////////////////////////////////////////////
		function fncfindId() {
			var nickName=$("input[name='nickName']").val();
			
			if(nickName == null || nickName.length <1){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}
				
				
			$("form").attr("method" , "POST").attr("action" , "/user/findId").submit();
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
	
	</script>
	
</head>

<body>

	<!-- ToolBar Start /////////////////////////////////////-->
	<jsp:include page="/layout/toolbar.jsp" />
   	<!-- ToolBar End /////////////////////////////////////-->
	
	<!--  화면구성 div Start /////////////////////////////////////-->
	<div class="container">
	
		<div class="page-header text-center">
	       <h3 class=" text-muted">아이디 찾기</h3>
	   	</div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal">
		
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉 네 임</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" placeholder="닉네임" >
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" placeholder="이메일">
		    </div>
		    <div class="col-sm-3">
		    <button type="button" class="btn btn-info">인증</button>
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
		      <button type="button" class="btn btn-primary"  >찾 &nbsp;기</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>