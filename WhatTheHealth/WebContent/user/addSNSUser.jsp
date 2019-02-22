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

		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#cancle").on("click" , function() {
				self.close();
				//self.location = "/"
			});
		});	
		

	
		 
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
		 
		 
		 
		 function jQFormSerializeArrToJson(formSerializeArr){
			 var jsonObj = {};
			 jQuery.map( formSerializeArr, function( n, i ) {
			     jsonObj[n.name] = n.value;
			 });

			 return jsonObj;
			}
		 
		 
		 
		 
		 var uploadFile = '';
		 var params = ''
			 $(document).ready(function(){
		
				$("#join").on("click" , function() {
			   
			    params = $("#snsForm").serializeArray();
			    var properJsonObj = jQFormSerializeArrToJson(params);
 
			 
		       	 $.ajax({
		            url : "/user/json/addSNSUser",
		            method : "POST" ,
		            data : JSON.stringify(properJsonObj),
		            dataType:"json",
		        	headers:{
		        					"Accept":"application/json",
		        					"Content-Type": "application/json"
		        				}, 
		            success : function(data){
		                if(data == 1) {
		                	swal("가입이 완료되었습니다", "", "success");
		                    self.close(); //댓글 작성 후 댓글 목록 reload
		                    opener.location.replace("/");
		                }
		            }
		        }); 
		        
		    });
				
		 });
		

		 
		 
	
	</script>		
    
</head>

<body>

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="site-section">
	<div class="container">
	
	<div class="row">
	 		
	 		<div class="col-md-2"></div>
	 		<div class="col-md-8">
		
		<form class="p-5 bg-white" enctype="multipart/form-data" id="snsForm">
			
		   <input type="hidden" name="userId" value = "${user.userId }"  />
		   <input type="hidden" name="password" value="${user.password }"  />
		   <input type="hidden" name="snsType" value="${user.snsType}"  />
		   <input type="hidden" name="idToken" value="${user.idToken}"  />
		   <input type="hidden" name="accessToken" value="${user.accessToken}"  />
		     
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		    <label for="nickName" class="font-weight-bold">닉네임</label>
		    <span class="icon-check mr-3" id="checkNickname"></span>
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName }" oninput="CheckNickname()">
		    </div>
		  </div>
		  
		  <div class="form-group">
		  <div class="col-md-12 mb-3 mb-md-0">
		  	<label for="gender" class="font-weight-bold">성별</label><br/>
		  			<input type='radio' name='gender' value='0' checked />여
		  			<input type='radio' name='gender'  value='1'  />남
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
	
		
 	</div>
	<!--  화면구성 div end /////////////////////////////////////-->
	</div>
	</div>
</body>

</html>