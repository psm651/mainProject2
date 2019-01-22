<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


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
	
		//============= "가입"  Event 연결 =============
		 $(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$( "#join" ).on("click" , function() {
				fncAddUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#cancle").on("click" , function() {
				self.location = "/main.jsp"
			});
		});	
		

		
		function fncAddUser() {
			
			var nickName=$("input[name='nickName']").val();
			var checkNickname = document.getElementById('checkNickname').style.color;
			
			
			if(nickName == null || nickName.length <1){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}
			if(checkNickname == 'red'){
				alert("이미 존재하는 닉네임입니다.")
				return;
			}

			alert("가입이 완료되었습니다.");
			$("form").attr("method" , "POST").attr("action" , "/user/addUser").submit();
		}
		

		//==>"이메일" 유효성Check  Event 처리 및 연결
		/*  $(function() {
			 
			 $("input[name='email']").on("change" , function() {
				
				 var email=$("input[name='email']").val();
			    
				 if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			    	alert("이메일 형식이 아닙니다.");
			     }
			});
			 
		});	
		 */
		

		 ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////

		 
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
   	
   	<div class="site-blocks-cover inner-page overlay" style="background-image: url(/resources/images/1111.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7 text-center">
            <h1 class="mb-5">Join Us</h1>
          </div>
        </div>
      </div>
    </div>  

	<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="site-section bg-light">
	<div class="container">
		<!-- <div class="page-header text-center">
		<h1 class="text-muted">SNS 회 원 가 입</h1>
		</div> -->
		<!-- form Start /////////////////////////////////////-->
		<form class="p-5 bg-white" enctype="multipart/form-data">
			
		   <input type="hidden" name="userId" value = "${user.userId }"  />
		   <input type="hidden" name="password" value="${user.password }"  />
		   <input type="hidden" name="userImage" value="${user.userImage }"  />
		   <input type="hidden" name="snsType" value="${user.snsType}"  />
		   <input type="hidden" name="idToken" value="${user.idToken}"  />
		   <input type="hidden" name="accessToken" value="${user.accessToken}"  />
		     
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="nickName" class="font-weight-bold">닉네임</label>
		   <!--  <i class="glyphicon glyphicon-ok" id="checkNickname"></i> -->
		    <span class="icon-check mr-3" id="checkNickname"></span>
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName }" oninput="CheckNickname()">
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
		    <label for="uploadFile" class="font-weight-bold">프로필 사진</label>
		      <input type="file" class="form-control" id="uploadFile" name="uploadFile" value="${user.userImage }">
		    </div>
		  </div>

		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="phone" class="font-weight-bold">휴대전화</label>
		       <input type="text" class="form-control" id="phone" name="phone" >
		    </div>
		  </div>
		  
	
		  
		  <div class="form-group">
		   <div class="col-md-12 mb-3 mb-md-0">
		    <label for="email" class="font-weight-bold">이메일</label>
		      <input type="text" class="form-control" id="email" name="email" value="${user.email }">
		    </div>
		  </div>
		  
		  	  
		   
		  <div class="form-group">
		    <div class="col-md-12 mb-3 mb-md-0 text-center">
		      <button type="button" class="btn btn-primary pill px-4 py-2" id="join">가 &nbsp;입</button>
			 <button type="button" class="btn btn-primary pill px-4 py-2" id="cancle">취&nbsp;소</button>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	
</body>

</html>