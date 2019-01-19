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


  $(function(){
	$("button:contains('수정')").on("click", function(){
		self.location="/adminManage/updateUserAdminManage?userId=${user.userId}"
	});	  
	
  });

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

          		  <div class="box-body">
                  <div class="col-sm-6">
                  <div align="center"> 
                   <img alt="User Pic" src="/resources/images/upload/${!empty user.userImage? user.userImage : 'user_profile.png'}" 
                       id="profile-image1" class="img-circle img-responsive"> 
           <!--         <input id="profile-image-upload" name="originalFileName" class="hidden" type="file"> -->
                  </div>
		          </div>             
              <br>
            </div>
            <div class="col-sm-6">
            <h3 style="color:#00b1b1;" text-align="center" >${user.userId}</h3>      
            </div>
		    <div class="col-sm-offset-4  col-sm-4 text-full-right">
		      <button type="button" class="btn btn-primary">수정</button>
		    </div>
            <div class="clearfix"></div>
            <hr style="margin:5px 0 5px 0;">
            

    
              
			<div class="col-sm-5 col-xs-6 tital">아이디</div>
			<div class="col-sm-7 col-xs-6 ">${user.userId}</div>
     		<div class="clearfix"></div>
			<div class="bot-border"></div>			

			<div class="col-sm-5 col-xs-6 tital">닉네임</div>
			<div class="col-sm-7">${user.nickName}</div>
  			<div class="clearfix"></div>
			<div class="bot-border"></div>

			<div class="col-sm-5 col-xs-6 tital">이메일</div>
			<div class="col-sm-7">${user.email}</div>
 			<div class="clearfix"></div>
			<div class="bot-border"></div>
			
	
			<div class="form-group">
				<div class="col-sm-5 col-xs-6 tital">휴대전화</div>
				<div class="col-sm-7">${user.phone}</div>
  				<div class="clearfix"></div>
				<div class="bot-border"></div>
		    </div>
		    
		    <div class="form-group">
			<div class="col-sm-5 col-xs-6 tital">계정상태</div>
			<div class="col-sm-7">
			<c:if test="${user.userStatus=='0'}">
			일반
			</c:if>
			<c:if test="${user.userStatus=='1'}">
			탈퇴
			</c:if>
			<c:if test="${user.userStatus=='2'}">
			블랙리스트
			</c:if>	
			</div>
 			<div class="clearfix"></div>
			<div class="bot-border"></div>
			</div>

			<div class="col-sm-5 col-xs-6 tital" >예금주</div>
			<div class="col-sm-7">${user.holder}</div>
			<div class="clearfix"></div>
			<div class="bot-border"></div>

			<div class="col-sm-5 col-xs-6 tital" >은행</div>
			<div class="col-sm-7">${user.bankName}</div>
			<div class="clearfix"></div>
			<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital">계좌번호</div>
			<div class="col-sm-7">${user.accountNum}</div>
			<div class="clearfix"></div>
			<div class="bot-border"></div>
			
			<div class="col-sm-5 col-xs-6 tital">포인트</div>
			<div class="col-sm-7">${user.havingPoint}</div>



          </div>  
       </div>
   </div>
</div>
</div>
</div>





         
      
  
<%-- 		<img src="/resources/images/upload/${!empty user.userImage? user.userImage : 'user_profile.png'}" 
		class="rounded mx-auto d-block" text-align="center" width="270px;" height="170px;"/>
 		 </div>
 		 </div>
 		 </div> --%>
</body>
</html>