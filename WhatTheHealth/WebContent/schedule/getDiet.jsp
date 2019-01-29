<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
          <meta charset="utf-8"> 
          <meta name="viewport" content="width=device-width, initial-scale=1">
<head> 
          <title>Bootstrap Card</title> 
 
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/css/bootstrap.min.css"> 
          <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script> 
          <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.12.6/umd/popper.min.js"></script> 
          <script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-beta.2/js/bootstrap.min.js"></script>
          
          <style>
      #jb-container {
        width: 580px;;
        margin: 10px auto;
        padding: 20px;
      }
      #jb-header {
        padding: 10px;
        width: 580px;
        margin-bottom: 10px;
        
      }
      #jb-content {
        width: 580px;
        padding: 20px;
        margin-bottom: 20px;
      }
      
      #jb-footer {
        clear: both;
        width: 580px;
        text-align : right;
        padding: 20px;
        border: 1px solid #bcbcbc;
      }
      @media ( max-width: 480px ) {
        #jb-container {
          width: auto;
        }
        #jb-content {
          float: none;
          width: auto;
        }
        #jb-sidebar {
          float: none;
          width: auto;
        }
      }
    </style> 
</head> 
<title>Insert title here</title>
<script>
$( function() {
	$( ".btn-primary" ).on("click" , function() {
		var exScName = $("#exScName").val();
		var exScContents = $("#exScContents").val();
		var exScCalorie = $("#exScCalorie").val();
	        $.ajax( {
	          url: "/schedule/json/addDietSchedule",
	          dataType: "json",
	          method : "POST",
	          data: JSON.stringify({
	        	  dietScDate:$("#exScDate").val(),
	        	  mealTime:$("#exScName").val(),
	        	  exScContents:$("#exScContents").val(),
	        	  exScCalorie:$("#exScCalorie").val()
	          }),
	          headers : {
	  			"Accept" : "application/json",
	  			"Content-Type" : "application/json"},
	  	   success: function( data ) {
	  			alert("수정 완료");
				self.close(); 
      		  } 
	        } );
	     
	    } );
});

$( function() {
	$( ".btn-default" ).on("click" , function() {
		var exScName = $("#exScName").val();
		var exScContents = $("#exScContents").val();
		var exScCalorie = $("#exScCalorie").val();
		
	        $.ajax( {
	          url: "/schedule/json/deleteExSchedule/"+exScNo,
	          dataType: "json",
	          method : "GET",
	          headers : {
	  			"Accept" : "application/json",
	  			"Content-Type" : "application/json"},
	  	   success: function( data ) {
	  			alert("삭제 완료");
				opener.location.reload();
				self.close(); 
      		  } 
	        } );
	     
	    } );
});
</script>
</head>
<body>
	<div id="jb-container">
		<div id="jb-header" >
        	<h4>맛있게 먹으면 0칼로리</h4>
      	</div>
      	<div id="jb-content" style="overflow-y:hidden;  ">
<div class="row" style="height: 500px; width:500px; margin: 0 auto;">
	<c:set var="i" value="0"/>
	<c:forEach var="defo" items="${food}">
	<c:set var ="i" value="${i+1 }"/>

      	<div class="col-xs-3 col-sm-3" style="max-width:150px; height:150px; margin-bottom : 2.5em;">
     		 <div class="card" >
     		 <div class="card-header" align="center">${defo.foodName}</div>
     		 <div class="card-body" style="padding-bottom:-110px;padding-bottom: 8px;padding-top: 8px;" align="center">
			<p>${ defo.amountFood} </p>
 				<p>${ defo.foodCalorie} </p>                               
          	</div>                                      
       	   </div>
      	</div>
                         
                         
                     
                         
                         
                	</c:forEach>
                	</div>
                      </div>          
                  <div id="jb-footer">
                <button type="button" class="btn btn-primary">등록</button>                <button type="button" class="btn btn-default">삭제</button>
</div>
</div>
</body>
</html>