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
	
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	<script src="/resources/js/bootstrap.min.js"></script>

    
    <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">
	
	$(document).ready(function() {
	       if("${sessionScope.user}" != null && "${sessionScope.user}" !=""){
	            
	            self.close();
	            opener.location.replace("/");
	         }  
	    });
	
	

		//============= "로그인"  Event 연결 =============
		function fncLogin() {
			
			$("#modalUserId").focus();
			

			var id=$("#modalUserId").val();
			//alert(id)
			var pw=$("#modalPassword").val();
				
			if(id == null || id.length <1) {
				swal("아이디를 입력해주세요", "", "error");
				$("#modalUserId").focus();
				return;
			}
				
			if(pw == null || pw.length <1) {
				swal("비밀번호를 입력해주세요", "비밀번호를 입력하지 않으셨습니다", "error");
				$("#modalPassword").focus();
				return;
			}
			
	
				$.ajax( 
						{
							url : "/user/json/login" ,
							method : "POST" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							data : JSON.stringify({
								userId : id,
								password: pw
							}),
							success : function(JSONData , status) {
								//alert(JSONData)
								
								if(JSONData == '111'){
									swal("존재하지 않는 회원입니다", "회원가입을 먼저 진행해주세요", "error");
								}
								
								if(JSONData == '222'){
									swal("아이디 혹은 비밀번호가 틀렸습니다", "아이디 혹은 비밀번호를 다시 확인해주세요", "error");
								}
								
								if(JSONData == '333'){
									swal("탈퇴한 회원입니다", "아이디 혹은 비밀번호를 다시 확인해주세요", "error");
								}
								
								if(JSONData == '444'){
									swal("블랙리스트 처리된 회원입니다", "아이디 혹은 비밀번호를 다시 확인해주세요", "error");
								}
								
								if(JSONData == '555'){
									self.location = "/";
								}
								
								
							}	

					});
			}
			
		
	
			
		$( function() {
			
			$("#login").on("click" , function() {
				fncLogin();
			
			});
		});	
		
		
		//============= 회원원가입화면이동 =============
		$( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#addUser").on("click" , function() {
				self.location = "/user/addUser"
			});
		});
		var selfClose = 1;
		 $( function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("#naver_id_login").on("click" , function() {
				
				//self.location = '/user/naverLogin';
				$('#loginModal').hide();
				
				
				popWin 
				= window.open("/user/naverLogin",
											"popWin", 
											"left=300,top=200,width=780,height=130,marginwidth=0,marginheight=0,"+
											"scrollbars=no,scrolling=no,menubar=no,resizable=no");
				
			});
		});
		 
		
		 $( function() {
				//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
				$("#kakao_login").on("click" , function() {
					
					$('#loginModal').hide();

					popWin 
					= window.open("https://kauth.kakao.com/oauth/authorize?client_id=11723e59094c12e0f6ad95a132887387&redirect_uri=http://192.168.0.15:8080/user/kakaoLogin&response_type=code",
												"popWin", 
												"left=300,top=200,width=550,height=650,marginwidth=0,marginheight=0,"+
												"scrollbars=no,scrolling=no,menubar=no,resizable=no"); 
			
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

	
	<!--  화면구성 div Start /////////////////////////////////////-->
	 <div class="site-section">
	<div class="container">
		<!--  row Start /////////////////////////////////////-->
	

			        <form class="form-horizontal" id="loginForm">
		  
					  <div class="form-group">
					    <div class ="row">
					  <div class="col-sm-1"></div>
					    <label for="userId" class="col-sm-4 control-label">아 이 디</label>
					    </div>
					    <div class ="row">
					    <div class="col-sm-1"></div>
					    <div class="col-sm-10"">
					      <input type="text" class="form-control" name="userId" id="modalUserId"  placeholder="아이디" onkeypress="if(event.keyCode=='13'){fncLogin()}" >
					    </div>
					  </div>
					  </div>
					  
					  <div class="form-group">
					    <div class ="row">
					  <div class="col-sm-1"></div>
					    <label for="password" class="col-sm-4 control-label">패 스 워 드</label>
					    </div>
					    <div class ="row">
					    <div class="col-sm-1"></div>
					    <div class="col-sm-10">
					      <input type="password" class="form-control" name="password" id="modalPassword" placeholder="패스워드" onkeypress="if(event.keyCode=='13'){fncLogin()}" >
					    </div>
					  </div>
					    </div>
					  
					  <div class="form-group">
					    <div class="col-md-12 mb-3 mb-md-2 text-center">
					      <button type="button" class="btn btn-primary" id="login" >로 &nbsp;그 &nbsp;인</button>
					      
					      <img src="/resources/images/kakao_login_btn_medium.png" id="kakao_login" height="40">
					      
					      <img id="naver_id_login" src="/resources/images/naver_login_small.png" height="40">
					   
					    </div>
					  </div>
					  
					  <div class="form-group">
					  	<div class="col-md-12 mb-3 mb-md-2 text-center">
					  	<a href="/user/addUser" class="col-sm-3">회원가입</a>
					    <a href="/user/findId" class="col-sm-3">아이디찾기</a>
					    <a href="/user/findPassword" class="col-sm-3">비밀번호찾기</a> 
					   </div>
					   </div>
					  
	
					</form>
			   	 </div>
			
			</div>
			
  	 	</div>
  	 	<!--  row Start /////////////////////////////////////-->
  	 	
 	</div>
 	<!--  화면구성 div end /////////////////////////////////////-->

</body>

</html>