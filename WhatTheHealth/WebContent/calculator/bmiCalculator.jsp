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

$(function(){
	$('#bmiDatepicker').datepicker({
		autoClose: false,
		position:  "right top",
	 	autoClose: true,
		todayButton : true,
		dateFormat : 'yy/mm/dd'
	});
});

$('#bmiDatepicker').data('datepicker');

   
$(function(){

	 $('#save').on('click', function(){
		 
		 var dietScDate = $('#bmiDatepicker').val();
		 var weight = $('#weight').val();
		 var bmiValue = $('#bmiValue').text();
		 var bmiState = $('#bmiState').text();
		 var userId = $('#bmiUserId').val();
		 
		 if(${sessionScope.user.userId == null}) {
		     swal("회원만 이용 가능합니다.")
		 	 return;
		 }
		 
		 if(bmiValue == null || bmiValue.length<1){
		     swal("BMI 계산을 먼저 진행해주세요!")
		 	 return;
		 }
		 if(dietScDate == null || dietScDate.length<1){
			 swal("날짜를 선택해주세요")
			 $('#bmiDatepicker').focus()
			 return;
		 }	
		 
		
			 
 		 	 $.ajax({
			 	
				 url:"/calculator/json/updateScheduleBMI",
				 method: "POST",
				 data : JSON.stringify({
					dietScDateBMI: $('#bmiDatepicker').val(),	
					bmiValue : $('#bmiValue').text(),
					weight : $('#weight').val(),
					userId : userId
				 }),
				 dataType : "json", 
				 headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
				 success : function(JSONdata, status){
						
				 }
			
			 })//end of ajax  
			 
			 swal("스케줄에 저장이 완료되었습니다.", "확인버튼을 눌러주세요", "success");
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
		
		<input type="hidden" name="userId" id="bmiUserId" value="${sessionScope.user.userId}"/>
		
	   <div class="form-group">
	   		<div class="row" style="align:right">
	   			<div>내 스케줄 담기</div>
	   			<input type='text' data-language='en'  id='bmiDatepicker'  name='dietScDate'/> 
	   			<button type="button" id="save" class="btn btn-primary btn-sm" style="position:absolute;top:40%;left:46%;"> 저장</button>
		      	
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
	   
</body>

</html>
