<%@ page contentType="text/html; charset=euc-kr" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<!-- 참조 : http://getbootstrap.com/css/   참조 -->
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	
	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	

   
   
   <!-- jQuery UI toolTip 사용 CSS-->
  <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
  <!-- jQuery UI toolTip 사용 JS-->
  <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	
	<!-- 템플릿 -->
 	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 5px;
        }
        
         img { width:500px; }
		
		#first{
		  margin: 0 auto;
  		  padding: 10px 0;
		}

		#second{
		  margin: 0 auto;
  		  padding: 10px 0;
		}		
		
		
		#first .card{
		
  			margin: 0;
  			padding: 0;
 			display: -webkit-box;
  			display: -moz-box;
 			display: -ms-flexbox;
  			display: -moz-flex;
  			display: -webkit-flex;
  			display: flex;
 			justify-content: space-between;
    		width:150px;
       		height: 100px;
		
		}
				#second .card{
		
  			margin: 0;
  			padding: 0;
 			display: -webkit-box;
  			display: -moz-box;
 			display: -ms-flexbox;
  			display: -moz-flex;
  			display: -webkit-flex;
  			display: flex;
 			justify-content: space-between;
    		width:150px;
       		height: 100px;
		
		}
		
		 
    		


    </style>
    
  
	<script type="text/javascript">
 

/* $(function(){
	
	$('.input-group.date').datepicker({

        calendarWeeks: false,
        todayHighlight: true,
        autoclose: true,
        format: "yyyy/mm/dd",
        language: "kr"

     }); */

	
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
			
					  
						  var name = "칼로리";
						  var amount = "1인분";
						  var display = "";
						  var totalDisplay = "";
					 
					  	$.each(data, function(index){
		                 
					  		if(index<=5){
					  			display = 
									'<div class="col-sm">'+
										'<div class="card">'+
					  						'<div class="card-header">'+data[index].foodName+'</div>'+
					  						'<div class="card-body">'+
					  						'<p>'+data[index].foodCalorie+'</p>'+ 
					      		    		'<p>'+data[index].amountFood+'</p>'+
					  			   		 	'</div>'+
										 '</div>'+
									 '</div>';
								$("#first").append(display);	 
					  		}else if(5<index && index<=11){
					  	
					  			display = 
									'<div class="col-sm">'+
										'<div class="card">'+
					  						'<div class="card-header">'+
					    					 data[index].foodName +
					  						'</div>'+
					  						'<div class="card-body">'+
					  						'<p>'+data[index].foodCalorie+'</p>'+ 
					      		    		'<p>'+data[index].amountFood+'</p>'+
					  			   		 	'</div>'+
										 '</div>'+
									 '</div>';
								$("#second").append(display);	
					  	
					  		}
						/* display = "<tr><th scope='row'>"+(index+1)+"</th>"+
					  				 "<td>"+data[index].foodName+"</td>"+
						 			 "<td>"+data[index].amountFood+"</td>"+
						 	 		 "<td>"+data[index].foodCalorie+"</td>"+
									 "<td align='left'><a href='#' id='button' class='btn btn-default btn-xs' role='button'>추가</a></td></tr>"; */	
						 
					/* 	display = "";			 
									 
									 
						totalDisplay += display;	 */				 
							 
							 
					  	});
					 /*  	$("#append").html(totalDisplay); */
				  }//end of success
				  
				}); // end of ajax
		});
				
	}); 

   $(function(){
	   
	   var index = 0; 
	
	   var foodAmountCalorie = 0;
	   
	   $(document).on("click",".card ",function(){
			
        
        	
        	var cardArray = new Array();
        	
        	var foodName = $(this).children(".card-header").text();
        	var foodCalorie = $(this).children(".card-body").children("p:nth-child(1)").text();
        	var amountFood = $(this).children(".card-body").children("p:nth-child(2)").text();
        	
    		
        	var num = parseInt(foodAmountCalorie);
        	
        	var display = "";
        	
        	if(index<=5){
        		display = 
					'<div class="col-sm">'+
						'<div class="card">'+
	  						'<div class="card-header">'+foodName+'</div>'+
	  						'<div class="card-body">'+
	  						'<p>'+foodCalorie+'</p>'+ 
	      		    		'<p>'+amountFood+'</p>'+
	  			   		 	'</div>'+
						 '</div>'+
					 '</div>';
				$("#firstAppend").append(display);
        		
        	}else if(5<index && index<=11){
        		display = 
					'<div class="col-sm">'+
						'<div class="card">'+
	  						'<div class="card-header">'+foodName +'</div>'+
	  						'<div class="card-body">'+
	  						'<p>'+foodCalorie+'</p>'+ 
	      		    		'<p>'+amountFood+'</p>'+
	  			   		 	'</div>'+
						 '</div>'+
					 '</div>';
				$("#secondAppend").append(display);	
        		
        	}else if(11<index){
        		
        		return alert("더 이상 추가 하실 수가 없습니다.");
        	}
      
     		num += parseInt(foodCalorie);
        	index ++;
        
        	$("#amount").append(foodAmountCalorie).text();

        });
     }); 
     


</script>

</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp" />
	
   	<br/><br/>
   	
   	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info" align="center">칼로리계산기</h3>
	    </div>
	    
   		 <div class="form-group">
		    <div class="col-6 col-md-4">
		      <input type="text" class="form-control" id="searchFood" name="searchFood">
		    </div>
		    
	    </div>
	    
			<button type="button" class="btn pull-right" align="right">검색</button>
		
		<br/><br/><br/><br/>
	
		<br/><br/><br/>
		


<div class="container-fluid">

<!-- 첫번째 줄 음식정보 append -->
<div class="row" id="first">
</div>

<!-- 두번째번째 줄 음식정보 append -->
<div class="row" id="second">
</div>


<hr/><hr/>

<div class="row" id="firstAppend">
</div>

<div class="row" id="secondAppend">
</div>




<div class="row">
<div class="col-xs-4 col-md-2 "><strong>총 칼로리</strong></div>
<div class="col-xs-8 col-md-4" id="amount" ></div>
</div>	 




		</div>
		
	</div>		
		
</body>

</html>
