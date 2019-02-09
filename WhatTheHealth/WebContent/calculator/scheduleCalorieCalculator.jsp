<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>


<html lang="ko">
	
<head>

	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
	<script src="/resources/js/jquery-3.3.1.min.js"></script>
	
	<script src="https://apis.google.com/js/client.js?onload=init"></script>
	
	<!-- include datetimepicker css/js-->
	<script type="text/javascript" src="../resources/js/datepicker.js"></script>
	<link rel="stylesheet" href="../resources/css/datepicker.min.css" type="text/css"> 
	<script type="text/javascript" src="../resources/js/datepicker.en.js"></script>

   	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	 <!-- <script src="/resources/js/jquery-3.3.1.min.js"></script>  -->
  	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
  	<script src="/resources/js/jquery-ui.js"></script>
	<!--   <script src="/resources/js/popper.min.js"></script> -->
  	<script src="/resources/js/owl.carousel.min.js"></script>
	  <script src="/resources/js/jquery.stellar.min.js"></script>
	  <script src="/resources/js/jquery.countdown.min.js"></script>
	  <script src="/resources/js/jquery.magnific-popup.min.js"></script> 

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
		
	<style>
      
       .datepicker-here{weight:60px; height: 30px;}	   
       .block-schedule{height:200px;}	

   	   #appendFood{
   	   /* width: 800px; */
   	   /* margin-left: 350px; */
   	   text-align: center;
   	   }
   	   #calculate{
   	   text-align: center;
   	   }
   	   #dietDate{
   	   width : 50px;
   	   }
   	   .datepicker-here{
   	   align: right;
   	   }
   	   .text-info span {
   	   	font-weight : bold;
   	   	color : white;
   	   }

   		#scheduleIcon{
   		weight:50px;
   		height:50px;
   		}

    </style>
    	
  
<script type="text/javascript">
 
/* $('#dietScDate').datepicker({
	dateFormat : "yyyy-mm-dd"
}); */

	$(function(){
		$("#btn-searchFood").on("click", function(){
			
			var searchFood = $("#searchFood").val();	
	
			$.ajax(
		
					{
					  url : "/calculator/json/getSearchFood/"+searchFood ,
					  method : "GET" ,
					  header : {
						  "Accept" : "application/json",
				    	  "Content-Type" : "application/json"	
				  
					  }, // end of header
				  
					  success : function(data, status){
						
					 	var totalDisplay = "";
						$("#appendFood").children("tbody").children("tr").remove();
						
						$.each(data, function(index){

							
						var	display = "<tr><th scope='row'>"+(index+1)+"</th>"+
					  					 "<td>"+data[index].foodName+"</td>"+
						 				 "<td>"+data[index].amountFood+"</td>"+
						 	 			 "<td>"+data[index].foodCalorie+"</td>"+
										 "<td align='left'><button type='button' class='btn btn-default btn-sm'>추가</a></td>"+
									  "</tr>";	
						totalDisplay += display;	 
						});		
						$("#appendFood").children("tbody").append(totalDisplay);
				  }//end of success
				  
				}); // end of ajax
		});
				
	}); 

	
	
     //추가 append
     $(function(){
	
       var foodAmountCalorie = 0;
	   var index = 1;
	   $(document).on("click",".btn:contains('추가')",function(){
		   
		   if( $("#amount").text()==0){
			   foodAmountCalorie=0;
		   }
		     	
        	var tr = $(this).closest("td").closest("tr"); 
        	
        	var num = tr.children("th").text();

        	var foodName = tr.children("td").eq(0).text();
 			var amountFood = tr.children("td").eq(1).text();
        	var foodCalorie = tr.children("td").eq(2).text();

			var display =  "<tr><th scope='row' name='number'>"+index+"</th>"+
	  							 "<td name='foodName["+index+"]'>"+foodName+"</td>"+
		 						 "<td name='amountFood["+index+"]'>"+amountFood+"</td>"+
		 	 					 "<td name='foodCalorie["+index+"]'>"+foodCalorie+"</td>"+
					   			 "<td align='left'><button type='button' class='btn btn-default btn-sm'>삭제</a></td>"+
 					 	   "</tr>";
					   	   
			 $("#calculate").children("tbody").append(display);
		     index++;
		     foodAmountCalorie += parseInt(foodCalorie)
		
		     $("#amount").text(foodAmountCalorie);
        });
     });   
     
     
	//삭제 이벤트
 	$(function(){
	
	
	   $(document).on("click",".btn:contains('삭제')",function(){
		     	
        	var tr = $(this).closest("td").closest("tr"); 
        	var calorie = tr.children("td").eq(2).text();
        	tr.remove();
        

    		
		    var amount = parseInt($("#amount").text());
		     	amount = parseInt(amount) - parseInt(calorie) 
		     	console.log(amount)
		    	 $("#amount").text(amount);
		
        });
     });   	

	$(function(){
		$(".btn:contains('담기')").on("click", function(){
			
			
			var dietScDate =$("input[name='dietScDate']").val();
			var mealTime = $("#mealTime").val();
			var dietScCalorie = parseInt($("#amount").text());
		
			var foodList = [];
		
			var foods = null;
		
		   			
			for(var i=1;i<=$("th[name='number']").length;i++){
				foods = new Object(); 
				foods.foodName = $("td[name='foodName["+i+"]']").text();
				foods.amountFood = $("td[name='amountFood["+i+"]']").text();
				foods.foodCalorie = $("td[name='foodCalorie["+i+"]']").text();
				foodList.push(foods)
			 } 
					

			 if(${sessionScope.user.userId != null}){ 
		
			 $.ajax({
			 	
				 url:"/calculator/json/addDietSchedule" ,
				 method: "POST",
				 data : JSON.stringify({
					 foodList : foodList, 
					 dietScDate : dietScDate, 
					 mealTime : mealTime, 
					 dietScCalorie : dietScCalorie			
				 }),
				 dataType : "json",
				 headers : {
						 "Accept" : "application/json",
						"Content-Type" : "application/json"
					},
				 success : function(JSONdata, status){
						swal(JSONdata)
				 }
			
			 })//end of ajax  
			
			 swal("스케줄에 저장이 완료되었습니다.", "확인버튼을 눌러주세요", "success");
	
			
	 		}else{ 
				swal("회원만 이용 가능합니다.")
			}	 
				
			 	
			
			    
			
		});
	});


$(function(){
	

		$('#dietScDate').datepicker({
			dateFormat : "yyyy-mm-dd",
			autoClose: false,
			position:  "right top",
			autoClose: true,
			todayButton : true,
	 		onSelect: function onSelect(){			
	
	 		} 
		});


		$('#dietScDate').data('datepicker');


});
 	

</script>

</head>

<body>
	


   	<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/upload/calorie.jpg');">
 		<div class="page-header">
	       <h3 class=" text-info" align="center"><span>#WhatTheHealth 와 함께하는 칼로리계산</span></h3>
	    </div>
 	</div>
 
  	

   	<div class="container">
	
		<br/><br/><br/>
		
		    <div class="row form-group" > 
		     <div class="col-lg-7" >
		    	<input type="text" class="form-control" id="searchFood" placeholder="원하는 음식을 검색하세요" style="height:109%;width:45%;margin-left:60%"> 
		     </div>
		     <div class="col-lg-4" style="text-align:left;">
		    	<button type="button" id="btn-searchFood" class="btn btn-danger" style="">
		    		 <span class="icon-search mr-1" aria-hidden="true"></span> 
		    	</button>
		    	</div>
		    </div>


			<br/>
		
			<div class="form-inline">	
				<div class="row">
		       <div class="col-md-3" style="margin-left:2em; float:right;">
		    	 <strong style="back-ground:##ddd">Total:</strong><span id="amount"></span>
			   </div>			
			

	 		   <div class="col-md-3" >
				<select class="form-control" name="mealTime" id="mealTime" >
					<option value="0" >아침</option>
					<option value="1" >점심</option>
					<option value="2" >저녁</option>		
				</select>  
			  </div>
		
			   <div class="col-md-3" style="align:right">		
			 	 <input type='text' id="dietScDate" data-language='en' name='dietScDate' placeholder="내스케줄담기" /> 		
		       </div>
			  
			  <div class="col-md-3" >	 			
				 <a href="#" class="btn btn-primary pill px-4" id="button" >담기</a>
		 	  </div>
		 	  </div>
		   </div>
		    
	   
<%--  <form:form commandName="foodInfos" id="foodInfomation"> --%>

	<!-- 크롤링 append -->
	<div class="row form-group">
	<table class="table" id="appendFood">
  		<thead>
    		<tr> 
    			<th scope="col">번호</th>
      			<th scope="col">음식</th>
      			<th scope="col">1인분</th>
      			<th scope="col">칼로리</th>
    		</tr>
   		</thead>
   			<tbody>
   	    	</tbody>
	</table>
	
	</div>

	<div class="row form-group">	
		<table class="table" id="calculate">
  			<thead>
    			<tr> 
    			</tr>
    			</thead>
    			<tbody>
    			</tbody>
		</table>
	</div>
		
<%-- </form:form> --%>

</div>	
		
		</div>
</body>

</html>
