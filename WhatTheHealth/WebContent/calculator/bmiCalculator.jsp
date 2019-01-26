<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	

	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	

	<!-- include libraries(jQuery, bootstrap) -->
	<script src="http://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.js"></script> 
	<script src="http://netdna.bootstrapcdn.com/bootstrap/3.3.5/js/bootstrap.js"></script> 

	<script src="https://apis.google.com/js/client.js?onload=init"></script>
	<script src="/resources/js/app.js"></script>
	
	<!-- include datetimepicker css/js-->
	<script type="text/javascript" src="../resources/js/datepicker.js"></script>
	<link rel="stylesheet" href="../resources/css/datepicker.min.css" type="text/css">
 	<!-- <script type="text/javascript" src="../resources/js/datepicker.min.js"></script>  --> 
	<script type="text/javascript" src="../resources/js/datepicker.en.js"></script>

	<style>
	.block-schedule{
		height:200px;
	}
	
	</style>	
  
	<script type="text/javascript">
 

$(function(){
	
	$("button:contains('계산')").on("click", function(){
		alert("jquery 확인");
		
		$.ajax	(
				{
					url : "/calculator/json/getCalculationBMI" ,
					method : "POST",
					data : JSON.stringify({
						height : $("#height").val(),
						weight : $("#weight").val()
					}), 
					dataType : "json", 
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
					success : function(JSONdata, status) {
						console.log(JSONdata);
					}
						
				}
				)
	});

});

</script>

</head>

<body>
	
	<jsp:include page="/calculator/test.jsp" />
	
   	
   		<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/upload/bmi.jpg');">
 		<div class="page-header">
	       <h3 class=" text-info" align="center"><span>#WhatTheHealth 와 함께하는 BMI계산</span></h3>
	    </div>
 	</div>
			
			
		<div class="container">
			<!-- <div class="row"> -->
			
   			<div class="row form-group">
   			<div class="col-md-6 mb-5 mb-md-0">
		      		신장 <input type="text" class="form-control" id="height" name="height">
		    		</div>
	   		
	  <div class="col-md-6 mb-5 mb-md-0">
		      		체중<input type="text" class="form-control" id="weight" name="weight">
		</div>
		
		 </div>
	  	 
	  	 	
		</div>
	 <!--  </div> -->
	
	   <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">계산</button>
			  <a class="btn btn-primary btn" href="#" role="button">초기화</a>
		    </div>
	   </div>	
	   
	    
	   <div class="container">
	   
  		<div class="progress" style="width:800px">
    		<div class="progress-bar" style="width:20%;background-color:green;">저체중</div>
    		<div class="progress-bar" style="width:30%">정상</div>
    		<div class="progress-bar" style="width:30%;background-color:gray;">비만</div>
    		<div class="progress-bar" style="width:20%;background-color:black;">고도비만</div>
  		</div>
	   </div>
	   

	   
	   

	   
	   
</body>

</html>
