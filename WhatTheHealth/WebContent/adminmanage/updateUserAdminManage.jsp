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
		       alert(rst.target.result);
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
	
		if(email != "" && (email.indexOf('@') < 1 || email.indexOf('.') == -1) ){
			alert("이메일 형식이 아닙니다.");
    	}
	
		if(nickName == null || nickName.length <1){
			alert("닉네임은  반드시 입력하셔야 합니다.");
			return;
		}
	
            	   
		$("form").attr("method" , "POST").attr("action" , "/adminManage/updateUserAdminManage").submit();
	 }

 	function resetData() {
		document.detailForm.reset();
	 }

 	$(function(){

		 $("button:contains('수정')").on("click", function(){
	
			 fncUpdateUser();
		 });
	 
 	});
 
 	 function CheckNickname(){
        
         var usedNickname = $("#usedNickname").val();
       	 	console.log(usedNickname);
       	 
         if(usedNickname !=  $("input[name='nickName']").val() ){
        	console.log("들어왔다")
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

                        $("#checkNicName").css("color","green")
                     }
                     
                     if(!JSONData){
                        //alert("이미 존재하는 ID입니다.")
                        $("#checkNicName").css("color","red")
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
	



	<div class="container">
	<br/><br/>
		<div class="row">
      	 <div class="col-md-7 ">

			<div class="panel panel-default">
  				 <div class="panel-body">
       
  				  <div class="box box-info">
  		<!-- <form action="submitReport1.do" method="post" enctype="multipart/form-data"></form> -->
  				  <form class="form-horizontal" method="post" enctype="multipart/form-data">
	    	
	    			  <input type="hidden" name="userId" value="${user.userId}" />

        
          			  <div class="box-body">
                      <div class="col-sm-6">
                      <div align="center"> 
                      
                      <div class="form-group" id="j">
                      <img alt="User Pic" src="/resources/images/upload/${!empty user.userImage? user.userImage : 'user_profile.png'}" 
                     		 id="profile-image1" class="img-circle img-responsive"> 
                     		 
                     <!--   <input type="file"  id="fileForm" name="uploadFile" width="100px;" onchange="ChangeImage()"/>   -->
                    <div style="text-align:center;">
   					<input multiple="multiple" type="file" name="originalFileName" style="width:500px;" accept="image/*" multiple onchange="fileInfo(this)"/><br>
   					<div id="img_box"></div> 
              
                	  </div>
                	  </div> 
   
					</div>
              <br>
            </div>
            
            
            
         
            <div class="form-group">
            	<div class="col-sm-6">
           		   <h3 style="color:#00b1b1;" text-align="center">${user.userId}</h3>      
           		 </div>
           	</div>
           		 
           	<div class="form-group">	 
            	<div class="col-sm-offset-4  col-sm-4 text-full-right">
		    	<button type="button" class="btn btn-primary">수정</button>
		    	</div>
            	<div class="clearfix"></div>
            	<hr style="margin:5px 0 5px 0;">
    		</div>
    		
            <div class="form-group"> 
				<div class="col-sm-5 col-xs-6 tital">아이디</div>
				<div class="col-sm-7 col-xs-6">${user.userId}</div>
     			<div class="clearfix"></div>
				<div class="bot-border"></div>			
			</div>
			
			<div class="form-group">
				<div class="col-sm-5 col-xs-6 tital">닉네임</div>
				<div class="col-sm-7">
					<input type="text" name="nickName"  value="${user.nickName}" oninput="CheckNickname()"/>
					<span id="checkNicName" class="icon-check mr-3"></span>
				</div>
  				<div class="clearfix"></div>
				<div class="bot-border"></div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-5 col-xs-6 tital">이메일</div>
				<div class="col-sm-7">
					<input type="text" name="email" value="${user.email}"/>
				</div>
 				<div class="clearfix"></div>
				<div class="bot-border"></div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-5 col-xs-6 tital">휴대전화</div>
				<div class="col-sm-7">
					<input type="text" name="phone" value="${user.phone}"/>	
				</div>
  				<div class="clearfix"></div>
				<div class="bot-border"></div>
			</div>
		
<%-- 			<div class="form-group">
				<div class="col-sm-5 col-xs-6 tital">계정상태</div>
				<div class="col-sm-7">
				<c:if test="${user.userStatus=='0'}">
					<input type="text" name="userStatus" value="일반"/>
				</c:if>
				<c:if test="${user.userStatus=='1'}">
					<input type="text" name="userStatus" value="탈퇴"/>
				</c:if>
				<c:if test="${user.userStatus=='2'}">
					<input type="text" name="userStatus" value="블랙리스트"/>
				</c:if>			
							
				</div> --%>
			<div class="form-group">	
 			<div class="col-sm-5 col-xs-6 tital">계정상태</div>
 				 <div class="col-sm-7">			
		      	 <select name="userStatus" class="form-control">
					<option value="0" ${user.userStatus=='0' ? 'selected' : ''}>일반</option>
					<option value="1" ${user.userStatus=='1' ? 'selected' : ''}>탈퇴</option>
					<option value="2" ${user.userStatus=='2' ? 'selected' : ''}>블랙리스트</option>
				</select>
				</div>				
 				<div class="clearfix"></div>
				<div class="bot-border"></div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-5 col-xs-6 tital" >예금주</div>
				<div class="col-sm-7">
					<input type="text" name="holder" value="${user.holder}"/>
				</div>
				<div class="clearfix"></div>
				<div class="bot-border"></div>
			</div>

			<div class="form-group">
				<div class="col-sm-5 col-xs-6 tital" >은행</div>
				<div class="col-sm-7">
					<input type="text" name="bankName" value="${user.bankName}"/>
				</div>
				<div class="clearfix"></div>
				<div class="bot-border"></div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-5 col-xs-6 tital">계좌번호</div>
				<div class="col-sm-7">
					<input type="text" name="accountNum" value="${user.accountNum}"/>
				</div>
				<div class="clearfix"></div>
				<div class="bot-border"></div>
			</div>
			
			<div class="form-group">
				<div class="col-sm-5 col-xs-6 tital">포인트</div>
				<div class="col-sm-7">
					<input type="text" name="havingPoint" value="${user.havingPoint}"/>
				</div>
			</div>



          </div> 
          </form> 
       </div>
   </div>
</div>
</div>
</div>
</div>

</body>
</html>