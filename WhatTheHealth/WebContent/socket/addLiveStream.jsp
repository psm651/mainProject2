<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>

<!--  ///////////////////////// JSTL  ////////////////////////// -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->

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
   

    
     <!--  ///////////////////////// JavaScript ////////////////////////// -->
	<script type="text/javascript">

		///////////////////////////////////////////////////////////////////////
 		function addLiveStream() {
 	        if (event.keyCode === 13) {
 	            event.preventDefault();
 	        } 
 	    	
 	        $.ajax({
 	            url : '/socket/json/addLiveStream',
 	            type : 'post',
 	            data : JSON.stringify({
 	            			liveTitle: $('#liveTitle').val()
 	            			}),
 	            dataType:"json",
 	        	headers:{
 	        					"Accept":"application/json",
 	        					"Content-Type": "application/json"
 	        				},
 	            success : function(data){
 	              
 	                   // replyList(); //댓글 작성 후 댓글 목록 reload
 	                    //self.close();
 	                   self.close();
 	                   window.opener.location.reload(); 

 	                  getLiveStream(data);
 	            }
 	        });
 	    }

		
		function getLiveStream(data){
			 popWin 
   			=  window.open("https://127.0.0.1:443/broadcast.html?nickName="+'${user.nickName}'+"&liveTitle="+data.liveTitle+"&img="+'${user.userImage}'+"&roomId="+data.socketNo,
							"popWin2", 
							"left=150,top=200,width=1200,height=650,marginwidth=0,marginheight=0,"+
							"scrollbars=no,scrolling=no,menubar=no,resizable=no");
		}
		
	</script>
	
</head>

<body>


	
	<!--  화면구성 div Start /////////////////////////////////////-->
	
	<div class="site-section">
	<div class="container">
	<div class="row">
	 		
	<div class="col-md-3"></div>
	<div class="col-md-6">
	
	    
	    <!-- form Start /////////////////////////////////////-->
		<form class="p-5 bg-white">
		
		  
		  <input type="hidden"id="userId" name="userId" value="${user.userId }" />
		  
		
		  <div class="form-group">
		    <label for="liveSteam" class="col-sm-4 control-label"  align="center" style="font-size : 18px;"><b>방 이름</b></label>
		    <div class="col-sm-10">
		      <input type="text" class="form-control" id="liveTitle" name="liveTitle"   onkeypress="if(window.event.keyCode=='13'){addLiveStream()}">
		    </div>
		  </div>
		  
		   <div class="form-group"> 
		   	<div class="col-md-10 mb-3 mb-md-2 text-center">
				<a href="#" align="right" class="btn btn-primary pill text-white px-4"  id="addLiveStream"  onclick="addLiveStream();"  >방 개설하기</a>
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