<%@ page contentType="text/html; charset=euc-kr" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />

	<!--  ///////////////////////// Bootstrap, jQuery CDN ////////////////////////// -->
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<!-- 템플릿 -->
 	<script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
	
	<style>
       body > div.container{
        	border: 3px solid #D6CDB7;
            margin-top: 10px;
        }
        
        img { width:500px; }
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
			alert(searchFood);
 		
			$.ajax(
		
					{
					  url : "/calculator/json/getSearchFood/"+searchFood ,
					  method : "GET" ,
					  header : {
						  "Accept" : "application/json",
				    	  "Content-Type" : "application/json"	
				  
					  }, // end of header
				  
					  success : function(data, status){
			
					  
						  var food = "";
						  var foodDisplay = "";

					  
					  	$.each(data, function(index){
							 food = "<div class='col-xs-4 col-md-2' name='foodName'>"+data[index]+"</div>";
						 	 foodDisplay += food; 
					  	});
					 
					  
					    	$(".row").append(foodDisplay);
				
				
				  }//end of success
				  
				}); // end of ajax
				
				
	
		});
	});

</script>

</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp" />
	
   	<br/><br/><br/><br/>
   	
   	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">칼로리계산기</h3>
	    </div>
	    
   		 <div class="form-group">
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="searchFood" name="searchFood">
		    </div>
	    </div>
	    
			<button type="button" class="btn btn-default">검색</button>
		
		<br/>
		<hr/>
		
		
		<div class="row">				
		</div>	
			
	<!-- 	  <div class="form-group">
		    <label for="manuDate" class="col-sm-offset-1 col-sm-3 control-label">스케줄담기</label>
		    <div class="col-sm-4">
		      <div class="input-group date">
           			 <input type="text" name="manuDate" class="form-control"><span class="input-group-addon" >
           			 <i class="glyphicon glyphicon-calendar"></i></span>
           	  </div>
		      </div>	
		  </div>	 -->
			
	</div>
</body>

</html>
