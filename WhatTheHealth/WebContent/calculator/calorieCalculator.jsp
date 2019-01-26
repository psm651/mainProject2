<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>


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
   	
    </style>
    	
  
<script type="text/javascript">
 
	
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
 			var servingSize = tr.children("td").eq(1).text();
        	var foodCalorie = tr.children("td").eq(2).text();

			var display =  "<tr><th scope='row'>"+index+"</th>"+
	  							 "<td>"+foodName+"</td>"+
		 						 "<td>"+servingSize+"</td>"+
		 	 					 "<td>"+foodCalorie+"</td>"+
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
 			

</script>

</head>

<body>
	
	<jsp:include page="/calculator/test.jsp" />
	
   	<div class="block-schedule overlay site-section" style="background-image: url('/resources/images/upload/calorie.jpg');">
 		<div class="page-header">
	       <h3 class=" text-info" align="center"><span>#WhatTheHealth 와 함께하는 칼로리계산</span></h3>
	    </div>
 	</div>
   	
   	<div class="container">
	
		<br/><br/><br/>
		
   		 <div class="form-group">
		    <div class="row" id="keyword">
		    	<div>
		    		<span><h4><strong>KEYWORD</strong></h4></span>
		    	</div>
		    </div>
		    <div class="row" id="input">
		    	<div>
		    		<input type="text" class="form-control" id="searchFood" name="searchFood">
		    	</div>
		    	<div>
		    		<button type="button" class="btn pull-right" >검색</button>
				</div>
			</div>
			<div class="row">				
			 	내스케줄 담기
			 	 <input type='text' class='datepicker-here' data-language='en' name='meetTime'/> 					
		    </div>
		    <div class="row">
		    	<span text-align:right>추가된 총 칼로리 :</span><span id="amount"></span>
		    </div>
		    
		   </div>
		    
	    </div>

<div class="container">

<!-- 크롤링 append -->
<div class="row">
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

<table class="table" id="calculate">
  	<thead>
    	<tr> 
    	</tr>
    </thead>
    	<tbody>
    	</tbody>
</table>

</div>





		
</body>

</html>
