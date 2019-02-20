<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<!-- JSTL  -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
    
<!DOCTYPE html>
<html lang="ko">
<head>

	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
	<script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
	<link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">


 	
	<script src="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/js/bootstrap.min.js"></script>
	<script src="//code.jquery.com/jquery-1.11.1.min.js"></script>
 
 	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
 	<script src="/resources/js/main.js"></script>
	
    
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
	<link href="//maxcdn.bootstrapcdn.com/bootstrap/3.3.0/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">  
    <link rel="stylesheet" href="/resources/css/aos.css">
    <link rel="stylesheet" href="/resources/css/style.css">


<style type="text/css">

  	input.hidden {
    position: absolute;
    left: -9999px;
	}

#profile-image1 {
    cursor: pointer;
  
     width: 100px;
    height: 100px;
	border:2px solid #03b1ce ;}
	.tital{ font-size:16px; font-weight:500;}
	 .bot-border{ border-bottom:1px #f8f8f8 solid;  margin:5px 0  5px 0
	 }

</style>

<script>


 	function fileInfo(f){
		   var file = f.files; // files 를 사용하면 파일의 정보를 알 수 있음

		   // 파일의 갯수만큼 반복
		   for(var i=0; i<file.length; i++){

		      var reader = new FileReader(); // FileReader 객체 사용
		      
		      reader.onload = function(rst){
		         // append 메소드를 사용해서 이미지 추가
		         // 이미지는 base64 문자열로 추가
		         // 이 방법을 응용하면 선택한 이미지를 미리보기 할 수 있음
		      	 $("#profile-image1").remove();
		          $("#j").append('<img alt="User Pic" src='+rst.target.result+' id="profile-image1" class="img-circle img-responsive">');
		         
		      }   
		      
		      reader.readAsDataURL(file[i]); // 파일을 읽는다      
		            
		   }

		} 

	function fncUpdateUser() {

	 	// Form 유효성 검증
		var nickName = $("input[name='nickName']").val();
		var email = $("input[name='email']").val();
		var password = $("#password").val();
		var password2 = $("input[name='password2']").val();
		

		if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			swal("이메일 형식이 아닙니다.", "", "error");
			return;
    	}
	
		if(nickName == null || nickName.length <1){
			swal("닉네임은  반드시 입력하셔야 합니다.", "", "error");
			return;
		}
	
		if( password == null || password.length<1) {			
			swal("비밀번호를 입력하지 않으셨습니다.", "비밀번호를 입력해주세요", "error");
			$("input:text[name='password']").focus();
			return;
		}
		
		if( password != password2) {			
			swal("비밀번호를 확인해주세요", "비밀번호 확인이 일치하지 않습니다", "error");
			$("input:text[name='password2']").focus();
			$("#checkPW").css("color","red")
			return;
		}
		
		$("form").attr("method" , "POST").attr("action" , "/adminManage/updateUserAdminManage").submit();
	 }

 	

 	$(function(){

 		 $('#cancle').on("click", function(){
 			history.go(-1);
 		 })
 		
		 $(".btn-primary").on("click", function(){
			 fncUpdateUser();
		 });
	 
 	});
 
 	 function CheckNickname(){
     
         var usedNickname = $("#usedNickname").val();
   
       	 
         if(usedNickname !=  $("input[name='nickName']").val() ){
      
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
         if(usedNickname ==  $("input[name='nickName']").val() ){
            $("#checkNickname").css("color","green")
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
		      <input type="file" class="form-control" id="uploadFile" name="originalFileName" value="${user.userImage}">
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
		   <div class="col-md-12 mb-3 mb-md-0">
		    <label for="userStatus" class="font-weight-bold">계정상태</label>
		       <select class="form-control" name="userStatus" id="userStatus">
				  	<option value="0" >일반</option>
					<option value="1" >탈퇴</option>
					<option value="2" >블랙리스트</option>
				</select>
		    </div>
		  </div>
		  
		  <div class="form-group">
		    <div class="col-md-10 mb-3 mb-md-2 text-center">
		      <button type="button" class="btn btn-primary" >수 &nbsp;정</button>
			  <a class="btn btn-primary btn" href="#" role="button" id="cancle">취 &nbsp;소</a>
		    </div>
		  </div>
		</form>
		<!-- form Start /////////////////////////////////////-->
	    </div>
 	</div>
 	</div>
 	</div>
	<!--  화면구성 div Start /////////////////////////////////////-->
 	
</body>
</html>