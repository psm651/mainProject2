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
				fncUpdateUser();
			});
		});	
		
		
		//============= "취소"  Event 처리 및  연결 =============
		$(function() {
			//==> DOM Object GET 3가지 방법 ==> 1. $(tagName) : 2.(#id) : 3.$(.className)
			$("a[href='#' ]").on("click" , function() {
				$("form")[0].reset();
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
		
		///////////////////////////////////////////////////////////////////////
		function fncUpdateUser() {
			var nickName=$("input[name='nickName']").val();
			
			if(nickName == null || nickName.length <1){
				alert("닉네임은  반드시 입력하셔야 합니다.");
				return;
			}

				
			$("form").attr("method" , "POST").attr("action" , "/user/updateUser").submit();
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
	       <h3 class=" text-muted">회원정보수정</h3>
	       <h5 class="text-muted">내 정보를 <strong class="text-danger">최신정보로 관리</strong>해 주세요.</h5>
	    </div>
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="form-horizontal" enctype="multipart/form-data">
		
		  <div class="form-group">
		    <label for="userId" class="col-sm-offset-1 col-sm-3 control-label">아 이 디</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="userId" name="userId" value="${user.userId }" readonly>
		       <span id="helpBlock" class="help-block">
		      	<strong class="text-danger">아이디는 수정불가</strong>
		      </span>
		    </div>
		  </div>
		
		  <div class="form-group">
		    <label for="password" class="col-sm-offset-1 col-sm-3 control-label">비밀번호</label>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password" name="password" placeholder="변경비밀번호">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="password2" class="col-sm-offset-1 col-sm-3 control-label">비밀번호 확인</label>
		    <i class="glyphicon glyphicon-ok" id="checkPW"></i>
		    <div class="col-sm-4">
		      <input type="password" class="form-control" id="password2" name="password2" placeholder="변경비밀번호 확인">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="nickName" class="col-sm-offset-1 col-sm-3 control-label">닉 네 임</label>
		     <i class="glyphicon glyphicon-ok" id="checkNickname"></i>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="nickName" name="nickName" value="${user.nickName}" oninput="CheckNickname()" placeholder="변경닉네임">
		    </div>
		  </div>
		  
		 
		  <div class="form-group">
		    <label for="phone" class="col-sm-offset-1 col-sm-3 control-label">휴대전화</label>
		     <div class="col-sm-4">
		     	<input type="text" class="form-control" id="phone" name="phone" value="${user.phone}"  placeholder="변경번호">
		    </div>
		  </div>
		  
		   <div class="form-group">
		    <label for="email" class="col-sm-offset-1 col-sm-3 control-label">이메일</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="email" name="email" value="${user.email}" placeholder="변경이메일">
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
		    <label for="holder" class="col-sm-offset-1 col-sm-3 control-label">예 금 주</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="holder" name="holder"  value="${user.holder}" placeholder="예금주">
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="bankName" class="col-sm-offset-1 col-sm-3 control-label">은 행 명</label>
		    <div class="col-sm-4">
		       <select class="form-control" name="bankName" id="bankName">
				  	<option value="국민" >국민</option>
					<option value="신한" >신한</option>
					<option value="우리" >우리</option>
					<option value="농협" >농협</option>
					<option value="하나" >하나</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <label for="accountNum" class="col-sm-offset-1 col-sm-3 control-label">계좌번호</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="accountNum" name="accountNum"  value="${user.accountNum}" placeholder="계좌번호">
		    </div>
		  </div>
		  
		  
		  
		  <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary"  >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>

</html>