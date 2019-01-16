<%@ page contentType="text/html; charset=euc-kr" %>


<!DOCTYPE html>

<html lang="ko">
	
<head>
	<meta charset="EUC-KR">
	
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	

	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" >
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" >
	<script src="https://code.jquery.com/jquery-3.1.1.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" ></script>
	
	<link rel="stylesheet" href="/css/admin.css" type="text/css">
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
   
    <script src="/javascript/bootstrap-dropdownhover.min.js"></script>
	

  
	<script type="text/javascript">
 

$(function(){
	
	$("button:contains('계산')").on("click", function(){
		alert("jquery 확인");
		
		$.ajax	(
				{
					url : "/calculation/json/getCalculationBMI" ,
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
						alert(JSONdata);
					}
						
				}
				)
	});

});

</script>

</head>

<body>
	
	<jsp:include page="/layout/toolbar.jsp" />
	
   	<br/><br/><br/><br/>
   	
   	<div class="container">
	
		<div class="page-header">
	       <h3 class=" text-info">BMI계산기</h3>
	    </div>
	    
   		<div class="form-group">
		    <label for="height" class="col-sm-offset-1 col-sm-3 control-label">신장</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="height" name="height">
		    </div>
	   </div>
	   
   		<div class="form-group">
		    <label for="weight" class="col-sm-offset-1 col-sm-3 control-label">체중</label>
		    <div class="col-sm-4">
		      <input type="text" class="form-control" id="weight" name="weight">
		    </div>
	   </div>	   
	   
	   
	   <div class="form-group">
		    <div class="col-sm-offset-4  col-sm-4 text-center">
		      <button type="button" class="btn btn-primary">계산</button>
			  <a class="btn btn-primary btn" href="#" role="button">초기화</a>
		    </div>
	   </div>
		  
			
	</div>
</body>

</html>
