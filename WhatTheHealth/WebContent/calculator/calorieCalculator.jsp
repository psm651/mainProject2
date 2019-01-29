<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html>


<html lang="ko">
	
<head>

	
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	
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
   	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
	
	
	<style>
       body > div.container{border: 3px solid #D6CDB7;margin-top: 5px; }
       .datepicker-here{weight:60px; height: 30px;}	   
       .block-schedule{height:200px;}	
	   #searchFood{
	   height : 26px; 
	   width: 180px;
	   /* margin-left: 180px; */
	   }
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
   	   #input{
   	   margin-top:70px;
   	   }
   	   #bmiIcon{
   	   weight:80px;
   	   height:80px;
   	   }
   	
    </style>
    	
  
<script type="text/javascript">
 
$('#dietScDate').datepicker({
	dateFormat : "yyyy-mm-dd"
});

	$(function(){
		$(".btn:contains('검색')").on("click", function(){
			
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

			var display =  "<tr><th scope='row'>"+index+"</th>"+
	  							 "<td>"+foodName+"</td>"+
	  							
		 						 "<td>"+amountFood+"</td>"+
		 						
		 	 					 "<td>"+foodCalorie+"</td>"+
		 	 					
					   			 "<td align='left'><button type='button' class='btn btn-default btn-sm'>삭제</a></td>"+
					   	  
				 	   	 /* 	"<input type='hidden' id='foodName' name='foodName' value='"+ foodName+"'/>"+
				   			"<input type='hidden' id='amountFood' name='amountFood' value='"+ amountFood+"'/>"+
				   			"<input type='hidden' id='foodCalorie' name='foodCalorie' value='"+ foodCalorie+"'/>" */
 					   	    	"<input type='hidden' name='foodInfos["+(index-1)+"].foodName' value='"+ foodName+"'/>"+
					   			"<input type='hidden' name='foodInfos["+(index-1)+"].amountFood' value='"+ amountFood+"'/>"+
					   			"<input type='hidden' name='foodInfos["+(index-1)+"].foodCalorie' value='"+ foodCalorie+"'/>"  +
					   			"</tr>"
					   	    ;
					   	   console.log(display);
			 $("#calculate").children("tbody").append(display);
		     index++;
		     foodAmountCalorie += parseInt(foodCalorie)
			 alert(foodAmountCalorie)
		     $("#amount").text(foodAmountCalorie);
        });
     });   
     
     
	//삭제 이벤트
 	$(function(){
	
	
	   $(document).on("click",".btn:contains('삭제')",function(){
		     	
        	var tr = $(this).closest("td").closest("tr"); 
        	var calorie = tr.children("td").eq(2).text();
        	tr.remove();
        	tr

    		
		    var amount = parseInt($("#amount").text());
		     	amount = parseInt(amount) - parseInt(calorie) 
		     	console.log(amount)
		    	 $("#amount").text(amount);
		
        });
     });   	

	$(function(){
		$(".btn:contains('저장')").on("click", function(){
			
			var dietScDate =$("input[name='dietScDate']").val();
			var mealTime = $("#mealTime").val();
			var amount = $("#amount").text();
			
			
			if(${sessionScope.user.userId != null}){
			
				 $("#test").attr("method","POST").attr("action", "/calculator/addDietSchedule?dietScDate="+dietScDate+"&mealTime="+mealTime+"&amount="+amount).submit()
			 	/* $("form").attr("method","POST").attr("action", "/exInfo/addDietSchedule?dietScDate='"+dietScDate+"'").submit(); */
			}else{ 
			    swal("회원만 이용 가능합니다.")
			}
		});
	});

 			
/*  	$(function(){

		$("#bmiIcon").draggable();
		$("#bmiIcon").droppable();
	}) ;
 	
 	$(function(){
 	
 		$('#bmiIcon').on("click", function(){
 			
 		});
 	}) */
 	

</script>

</head>

<body>
	
	<jsp:include page="/calculator/test.jsp" />
	
	
	
   	<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/upload/calorie.jpg');">
 		<div class="page-header">
	       <h3 class=" text-info" align="center"><span>#WhatTheHealth 와 함께하는 칼로리계산</span></h3>
	    </div>
 	</div>
 
<!--  	 <img src="/resources/images/upload/BMI.png" alt="Image" class="img-fluid" id="bmiIcon"> --> 

   	<div class="container">
	
		<br/><br/><br/>



	
 
		    <div class="row" id="keyword">
		    	<div>
		    		<span><h4><strong>KEYWORD</strong></h4></span>
		    	</div>
		    </div>
		    <div class="row" id="input" style="margin-top:30px;">
		    	<div>
		    		<input type="text" id="searchFood" name="searchFood">
		    	</div>
		    	<div>
		    		<button type="button" class="btn pull-right" >검색</button>
				</div>
			</div>

	
		
			<div class="row form-group">	
			   <div class="col-md-3">		
			 	 <input type='text' class='datepicker-here' id="dietScDate" data-language='en' name='dietScDate' placeholder="내스케줄담기" style="margin-left:800px;"/> 			
		       </div>
		       <div class="col-md-3">
		    	 <strong style="margin-left:">추가된 총 칼로리:</strong><span id="amount"></span>
			   </div>
	 		   <div class="col-md-3">
				<select class="form-control" name="mealTime" id="mealTime" >
					<option value="0" >아침</option>
					<option value="1" >점심</option>
					<option value="2" >저녁</option>		
				</select>  
			  </div>
			  <div class="col-md-3">	 			
				 <a href="#" class="btn btn-primary pill px-4" id="button"  >저장</a>
		 	  </div>
		   </div>
		    

	   
 <form:form commandName="foodInfos" id="test">

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
		
</form:form>

</div>	
		
</body>

</html>
