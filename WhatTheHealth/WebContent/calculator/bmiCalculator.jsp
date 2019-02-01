<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="UTF-8">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	

	<script src="/resources/js/jquery-3.3.1.min.js"></script>


	<!-- include datetimepicker css/js-->
	<script type="text/javascript" src="/resources/js/datepicker.js"></script>
	<link rel="stylesheet" href="/resources/css/datepicker.min.css" type="text/css">
	<script type="text/javascript" src="/resources/js/datepicker.en.js"></script>
 
    <!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>


	<style>
	em{font-size:10px}
	
	.block-schedule{
		height:200px;
	      .bar {
      float:left;
      clear:both;
      width:100%;
      height:40px;
      position:relative;
      }
        
.label {
  display: inline-block;
  margin: 0 5px 20px;
  padding: 3px 8px;
  color: #aaa;
  text-shadow: 0 1px black;
  border-radius: 3px;
  cursor: pointer;
}
       
   </style>
	
	

  
	<script type="text/javascript">
 

$(function(){
	
	$("button:contains('계산')").on("click", function(){
	
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
					success : function(JSONdata, status){
						
			 
						if($("#bmiValue").text()!=""){
							$("#bmiValue").empty().text();
							$("#bmiState").empty().text();
						}
						
							$("#bmiValue").text(JSONdata.bmiValue);
							$("#bmiState").text(" ("+JSONdata.bmiState+")");
					
						var total = JSONdata.bmiValue + "("+JSONdata.bmiState+")";
							
				/* 		var bar1 = $("#1").offset();
						var bar2 = $("#12").offset();
						var bar3 = $("#123").offset();
						var bar4 = $("#1234").offset(); */
						
						if($("em").text()!=''){
							$("em").text('');
							
						}
				
						$("em").text(total);
						
					     if(JSONdata.bmiState=='저체중'){
							$("em").css({
								 "position" : "absolute",
								  "top" : "560px",
								  "left" : "420px"
							 });					
						}else if(JSONdata.bmiState=='정상'){				
							/* $("em").css({
								   "position" : "absolute",
								   "top" : "560px",
								   "left" : "552px"
								}); */
							$("em").css({
								   "position" : "relative",
								   "top" : "30%",
								   "left" : "14%"
								});								
						}else if(JSONdata.bmiState=='비만'){
							$("em").css({
								   "position" : "absolute",
								   "top" : "560px",
								   "left" : "710px"
								});
						}else if(JSONdata.bmiState=='고도비만'){
							$("em").css({
								   "position" : "absolute",
								   "top" : "560px",
								   "left" : "833px"
								});
						} 
						
					}
						
				})//end of ajax
	});//end of button event

});//end of function

/* 
//////////////////////////////////////달력////////////////////////////////
// Initialization
$('#bmiDatepicker').datepicker({inline : false})
//Access instance of plugin
$('#bmiDatepicker').data('datepicker') 
 */
////////////////////////////////////달력달력///////////////////////////////////
$(function(){
	$('#bmiDatepicker').datepicker({
		autoClose: false,
		position:  "right top",
	 	autoClose: true,
		todayButton : true
	});
});

$('#bmiDatepicker').data('datepicker');
////////////////////////////////////달력달력///////////////////////////////////




 

   
$(function(){
	/*  $( "#draggable" ).draggable(); */
	/*  $("#bmiIcon").on("click", function(){	
	}); */
	 
	 $('.btn:contains("저장")').on('click', function(){
		 
		 var dietScDate = $('#bmiDatepicker').val();
		 var weight = $('#weight').val();
		 var bmiValue = $('#bmiValue').text();
		 var bmiState = $('#bmiState').text();
		 
		 if(weight =='' || bmiValue=='' || bmiState=='' || dietDate==''){
			 swal("제대로 된 값을 입력해주세요", "입력되지 않는 값이 있는지 확인해주세요", "error");
		 }else if(${sessionScope.user.userId==null}){
			 swal("로그인이 필요한 서비스입니다.", "로그인을 해주세요", "warning")
		 }else{
			 
			 $.ajax({
			 	
				 url:"/calculator/json/updateScheduleBMI",
				 method: "POST",
				 data : JSON.stringify({
					dietScDate: dietScDate,
					weight : weight,
					bmiValue : bmiValue,
					bmiState : bmiState
				 }),
				 dataType: "json",
				 header: {
					"Accept" : "application/json",
					"Content-Type" : "application/json"
				 }
			 
			 })//end of ajax
			 
		 }
	 })	
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
	
			<br/><br/><br/>
		
	   <div class="form-group">
	   		<div class="row" style="align:right">
	   			<div>내 스케줄 담기</div>
	   			<input type='text' data-language='en'  id='bmiDatepicker'  name='dietScDate'/> 
	   			<button type="button" class="btn btn-primary btn-sm" style="margin-left:1.2%"> 저장</button>
		      	
	   		</div>
	   </div>
		
	   <hr/>	
		
   	   <div class="form-group">
   			<div class="row">
   				<div class="col-sm-2" style="margin-right:-150px;">
   					<label class="font-weight-bold" for="fullname">신장</label>
   				</div>
   				<div class="col-sm-2">
		      	 	<input type="text" class="form-control" id="height" name="height" style="width:130px; height:30px; ">
		      	</div> 	
		    	<div class="col-sm-2" style="margin-left:-10px;margin-right:-150px;">
		    		<label class="font-weight-bold" for="fullname">체중</label>
		    	</div>
		    	<div class="col-sm-2" style="margin-left:0px;">
		      		<input type="text" class="form-control" id="weight" name="weight" style="width:130px; height:30px;">
		   		</div>
		   		
		   		<div class="col-sm-2">
		      		<button type="button" class="btn btn-primary btn-sm" style="margin-left:-40px;margin-right:-70px;height:30px;">계산</button>
		      	</div>	
		      	<div class="col-sm-2">
			 		<a class="btn btn-primary btn-sm" href="#" role="button" style="margin-left:-180px;height:30px;">초기화</a>
			    </div>		
		    </div>
		</div>   		

	   <br/>

		   <strong><h7>나의 신체질량 지수 : </h7></strong><span id ="bmiValue" name="bmiValue"></span><span id="bmiState" name="bmiState"></span>
		
	   <br/><br/>

			
	   <div class="form-group">
	   	<div calss="row" id="bmi">
	   	
	  
	   	<em></em>
	   	
	   	</div>
	   </div>	
	   
	   
	   
	   
	   
	   
<!-- 	<div class="container">
 

  <div class="progress">
    <div class="progress-bar"></div>
  </div>
</div>
	    -->
	   
	   
	   
  		<div class="progress" style="width:525px">
    		<div class="progress-bar" id="1" style="width:20%;background-color:#f0ad4e;">저체중</div>
    		<div class="progress-bar" id="12" style="width:30%">정상</div>
    		<div class="progress-bar" id="123" style="width:30%;background-color:#5cb85c;">비만</div>
    		<div class="progress-bar" id="1234" style="width:20%;background-color:#5bc0de;">고도비만</div>
  		</div>
  		
 

  <label for="twentyfive" class="label" style="margin-left:90px">18.5</label>

  
  <label for="fifty" class="label" style="margin-left:130px">25</label>


  <label for="onehundred" class="label" style="margin-left:133px">30</label>  		

	 </div>
	   
 <div id="draggable">	
	<img src="/resources/images/upload/BMI.png" alt="Image" class="img-fluid" id="bmiIcon" onclick="">	   
	<iframe id="iframe" src="/calculator/bmiCalculator.jsp"></iframe>
</div>
<!-- <img src="image.jpg" onclick="window.open('welcome.html')">  -->
	   

	   
	   
</body>

</html>
