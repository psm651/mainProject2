<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
  <head>
    <title>라이브방송 목록 페이지</title>
     <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    
    <link rel="stylesheet" href="/resources/css/style.css">
   <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
	<link rel="stylesheet" href="/resources/css/style.css">
    
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
  	<!--   <link rel="stylesheet" href="/resources/css/jquery-ui.css"> -->
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    
	<!--     <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css"> -->
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/resources/css/aos.css">
   
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
    <link href="/css/animate.min.css" rel="stylesheet">
    <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 </head>
 
  <script type="text/javascript">
 	
   $(function(){
	   $(document).on("click", ".post-entry", function(){
  		var socketNo = $(this).data("param");
  		//var bjId = "horan";
  		var bjId = $(this).data("param2");
  		var liveTitle=$(this).data("param3");
  		
  		 if( '${user.userId}'== bjId){
  			popWin 
			= window.open("https://192.168.0.9:443/broadcast.html?nickName="+'${user.nickName}'+"&liveTitle="+liveTitle+"&img="+'${user.userImage}'+"&roomId="+socketNo,
										"popWin", 
										"left=150,top=200,width=1200,height=650,marginwidth=0,marginheight=0,"+
										"scrollbars=no,scrolling=no,menubar=no,resizable=no");
  			 
  		 }else{
  			popWin 
			= window.open("https://192.168.0.9:443/index.html?nickName="+'${user.nickName}'+"&liveTitle="+liveTitle+"&img="+'${user.userImage}'+"&roomId="+socketNo,
										"popWin", 
										"left=150,top=200,width=1200,height=650,marginwidth=0,marginheight=0,"+
										"scrollbars=no,scrolling=no,menubar=no,resizable=no");
  			 
  		 }
  	});
  });
  

   function addLiveRoom(){
		    if( '${user.userId}'== null || '${user.userId}'=='' ){
			  	swal("회원만 이용 가능합니다", "로그인해주세요", "error");
			  	return;
		   } 
			popWin 
			= window.open("/socket/addLiveStream",
										"popWin", 
										"left=300,top=200,width=500,height=300,marginwidth=0,marginheight=0,"+
										"scrollbars=no,scrolling=no,menubar=no,resizable=no");
			

   }

	   var currentPage=1;	
	
	   $(window).scroll(function(){
			  
	       if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      
			currentPage++;
	     
	      $.ajax({
	         
	         url: "/socket/json/listLiveStream",
	         method: "POST",
	         data: JSON.stringify({
	        	 currentPage: currentPage ,            
	             searchCondition: 0,
	             searchKeyword: $("#searchKeyword").val(),
	         }),
	         dataType: "json",
	         headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	         },
	         success : function(data , status){
	  	
	        	
	               var list = data["list"];
	              
	   
	                  
	             list.forEach(function(item, index, array){     

	            	var appen = ""; 
	            	 
	            	 appen += '<div class="col-md-6 col-lg-4 mb-4">';
                  	 appen += '<div class="post-entry bg-white" data-param="'+item["socketNo"]+'"  data-param2="'+item["bjId"]+'"data-param3="'+item["liveTitle"]+'">';
                  	appen +='<div class="image" style="width= "340;" height= "200;">';
	                appen +='<img  src="/resources/images/liveListDefault.jpg" class="img-fluid" alt="" width= "340;" height= "200;">';
	                appen +='</div>';
	                appen +='<div class="text col-md-8">';
                  appen += '<h5 class="h5" ><a href="#">'+item["liveTitle"]+'</a></h5>';
                  appen += '<span class="text-uppercase date d-block mb-3">'+item["liveDate"]+'</span>';
                  appen += '<div class="userInfo">';
                  if(item["userImage"] != null && item["userImage"] != ''){	
	                  	appen += '<img src="/resources/images/userImage/'+item["userImage"]+'" style="border-radius:100px; width:50px; height: 50px;">';
	                  }else{
	                	appen += '<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>';
	                  } 	  
	 				  appen += item["nickname"];
	                  ;
	                  appen += '</div>';
	                  appen += '</div>';
	                  appen += '</div>';
	                  appen += '</div>';        
	                  $("#scroll").append(appen);           
	           
	             });
	                  
	                  
	         }        
	      })
	      
	      
	      }
	   });  	 
	   
	   $(function(){
			$("#searchTitle").on("click", function(){
				
				$("#scroll").empty();
				currentPage = 1;
				var searchKeyword = $("#searchKeyword").val();	
				var searchCondition= 0;
	
				$.ajax({
			         
			         url: "/socket/json/listLiveStream",
			         method: "POST",
			         data: JSON.stringify({
			            currentPage: 1,            
			            searchCondition: searchCondition,
			            searchKeyword: $("#searchKeyword").val(),
			            
			         }),
			         dataType: "json",
			         headers : {
			            "Accept" : "application/json",
			            "Content-Type" : "application/json"
			         },
			         success : function(data , status){
			  	
			                  var list = data["list"];
			                  
			         
			             list.forEach(function(item, index, array){     
			            
			            	  
			            	  var appen = ""; 
			                       
			                  	 appen += '<div class="col-md-6 col-lg-4 mb-4">';
			                  	 appen += '<div class="post-entry bg-white" data-param="'+item["socketNo"]+'"  data-param2="'+item["bjId"]+'"data-param3="'+item["liveTitle"]+'">';
			                  	appen +='<div class="image" style="width= "340;" height= "200;">';
				                appen +='<img  src="/resources/images/liveListDefault.jpg" class="img-fluid" alt="" width= "340;" height= "200;">';
				                appen +='</div>';
				                appen +='<div class="text col-md-8">';
			                  appen += '<h5 class="h5" ><a href="#">'+item["liveTitle"]+'</a></h5>';
			                  appen += '<span class="text-uppercase date d-block mb-3">'+item["liveDate"]+'</span>';
			                  appen += '<div class="userInfo">';
			                  if(item["userImage"] != null && item["userImage"] != ''){	
				                  	appen += '<img src="/resources/images/userImage/'+item["userImage"]+'" style="border-radius:100px; width:50px; height: 50px;">';
				                  }else{
				                	appen += '<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>';
				                  } 	  
				 				  appen += item["nickname"];
				                  ;
				                  appen += '</div>';
				                  appen += '</div>';
				                  appen += '</div>';
				                  appen += '</div>';                

				                  $("#scroll").append(appen);              
	
			      
			             });
			                  
			                  
			         }        
			      })
			      
			});
	  }); 
	
  </script>
  
  
  <body>

   <div class="site-wrap">
     <jsp:include page="/layout/toolbar.jsp" /> 


    <div class="site-section">
      <div class="container">
      <div class="row">
       <div class="col-lg-4" >
     <h2>라이브방송 목록</h2>
      
       </div> 
       <div class="col-lg-7" >
		    	<input type="text" class="form-control" id="searchKeyword" placeholder="제목을 입력하세요" style="height:75%;width:50%;margin-left:5%; float:right"> 
		     </div>
		     <div class="col-lg-1" style="text-align:left;">
		    	<button type="button" id="searchTitle" class="btn btn-danger" style="">
		    		 <span class="icon-search mr-1" aria-hidden="true"></span> 
		    	</button>
		    	</div>
		    </div>
      <hr/>

       <p align="right"><a href="#" align="right" class="btn btn-primary pill text-white px-4"  id="addLiveRoom"  onclick="addLiveRoom();">방개설하기</a></p>
      <br/>
  
       
        
        <div class="row mb-5" id="scroll">
          <c:set var="i" value="0"/>
          <c:set var="i" value="${i+1}"/>
          <c:forEach var="socket" items="${list}"> 
          
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="post-entry bg-white box"  data-param="${socket.socketNo}"   data-param2="${socket.bjId}"   data-param3="${socket.liveTitle}" >
              <div class="image"  style="width:340px; height:200px">
              
                    <img  src="/resources/images/liveListDefault.jpg" class="img-fluid" alt="" width= "340;" height= "200;">
               
              </div>
              <div class="text col-md-8">
                <h5 class="h5" ><a href="#">${socket.liveTitle}</a></h5>
                <span class="text-uppercase date d-block mb-3">${socket.liveDate}</span>
 	              
                <div class="userInfo">
                			<c:if test="${socket.userImage != null and socket.userImage != '' }">
                				<img src="/resources/images/userImage/${socket.userImage}" style="border-radius:100px; width:50px; height: 50px;">
                			</c:if>
                			<c:if test="${socket.userImage == null or socket.userImage ==  ''}">
								<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>
						    </c:if>
                			${socket.nickname}
                		</div>
              </div>
           
            </div>
          </div>    
          
  		 </c:forEach> 
                          
   		</div>    

                          
      </div>

    </div>
  </div>
 </body>
  
</html>