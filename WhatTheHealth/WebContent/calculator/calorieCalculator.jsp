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
			$.ajax(
		
					{
					  url : "/calculator/json/getSearchFood/"+searchFood ,
					  method : "GET" ,
					  header : {
						  "Accept" : "application/json",
				    	  "Content-Type" : "application/json"	
				  
					  }, // end of header
				  
					  success : function(data, status){
			
					  
				
						  var display = "";
						  var totalDisplay = "";
					 
					  	$.each(data, function(index){
		                 

						 display = "<tr><th scope='row'>"+(index+1)+"</th>"+
					  				 "<td>"+data[index].foodName+"</td>"+
						 			 "<td>"+data[index].amountFood+"</td>"+
						 	 		 "<td>"+data[index].foodCalorie+"</td>"+
									 "<td align='left'><a href='#' id='button' class='btn btn-default btn-xs' role='button'>추가</a></td></tr>";	
						 
						totalDisplay += display;					 
							 /* $("#append").append(display); */
							 
					  	});
					  	$("#append").html(totalDisplay);
				  }//end of success
				  
				}); // end of ajax
		});
				
	}); 

   $(function(){
        $(document).on("click",".btn ",function(){

        	var trArray = new Array();
        	var tr = $(this).parents("tr").children("td");
        	var text = tr.text();
			       
        	
        	
        	console.log(tr);
        	console.log(text);
    //        #append > tr:nth-child(1) > td:nth-child(5) 
       /*     	var tr0 = $(this);
       		var tr1 = $(this).parents("td"); */
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
		<hr/>
		<br/><br/><br/>
		

		
	<table class="table table-hover">
  		<thead>
    		<tr>
    		  <th scope="col">번호</th>
    		  <th scope="col">음식명</th>
    		  <th scope="col">1인분</th>
     		  <th scope="col">칼로리</th>
   			</tr>
 	    </thead>
  	<tbody id="append">
     
    </tbody>
	</table>		
	
	<br/><br/>
	

</div>		
		
		
</body>

</html>
