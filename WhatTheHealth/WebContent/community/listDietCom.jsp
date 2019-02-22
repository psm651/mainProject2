<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
  <head>
    <title>식단 커뮤니티 목록 페이지</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    
    <link rel="stylesheet" href="/resources/css/style.css">
   	<link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">
	<link rel="stylesheet" href="/resources/css/style.css">
    
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">

    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/resources/css/aos.css">
   	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
    
   	<link href="/css/animate.min.css" rel="stylesheet">
   	<link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet">
  	 <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script>
 
   	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
	
  </head>
  
  <script type="text/javascript">
 	
   $(function(){
  	$(".post-entry").on("click", function(){
  		var postNo = $(this).data("param");
  		var blindStatus = $(this).data("blind");
  		if(blindStatus == '1'){
  			swal("블라인드 처리된 게시물입니다", "", "error");
  			return false;
  		}
  		self.location = "/community/getCommunity?postNo="+postNo;
  	});
  });
   
   $(function(){
		  $(document).on("click", ".post-entry", function(){
			var postNo=$(this).data("param");
			var blindStatus = $(this).data("blind");
	  		if(blindStatus == '1'){
	  			swal("블라인드 처리된 게시물입니다", "", "error");
	  			return false;
	  		}
			self.location = "/community/getCommunity?postNo="+postNo;
		  });
	   });
  
   $(function() {
		$("#addDietCom").on("click" , function() {
			
			if("${sessionScope.user}" == null ||"${sessionScope.user}" == ""){				 
				 swal("회원만 이용 가능합니다", "로그인해주세요", "error");
				  return;
			
			 } else if("${sessionScope.user}" != null){
				self.location = "/community/addDietCom"	
			 }

		});
	});	
   
   var currentPage=1;

   $(window).scroll(function(){

	   
       if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      
		currentPage++;
     
		
		
      $.ajax({
         
         url: "/community/json/dietCommunitylist",
         method: "POST",
         data: JSON.stringify({
            currentPage: currentPage ,            
            searchCondition: 0,
            searchKeyword: $("#searchKeyword").val(),
        	searchFilter : $("#exPart").val()
            
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
                  	 appen += '<div class="post-entry bg-white" data-param="'+item["postNo"]+'" data-blind="'+item["blindStatus"]+'">';
                  	
                  	 if(item["blindStatus"]=='1'){	
                  	 	appen += '<img src = "/resources/images/blind.PNG" style="width:348px; height:200px">';
                  	}else if(item["blindStatus"]=='0'){
                    	appen += '<div class="image" style="width:348px; height:200px">';
                  
             
                  if(item["photo"]==null){
              	 	 appen += '<img  src="/resources/images/1111.jpg" class="img-fluid" alt="" width= "340;" height= "200;" >'; 	  
             	 
                  }else if(item["photo"]!=null){
             		 var youtube = item["photo"].indexOf("https");
             		 if(youtube!=-1){
            	  	 appen += '<img src="'+item["photo"]+'" class="img-fluid" width= "348;" height= "200;">';
            	  	 }else{
            	  	 appen += '<img src="/resources/images/upload/'+item["photo"]+'" class="img-fluid">';  
            	  }
              	}
             	  appen += '</div><br/><div class="row">';   
                  appen += '<div class="text col-md-8">';
                  appen += '<h5 class="h5 text-black"><a href="#">'+item["title"]+'</a></h5>';
                  appen += '<span class="text-uppercase date d-block mb-3"><small>'+item["postDate"]+'</small></span>';
                  appen += '<div class="userInfo">';
                 
                  if(item["userImage"] != null && item["userImage"] != ''){	
                  	appen += '<img src="/resources/images/userImage/'+item["userImage"]+'" style="border-radius:100px; width:50px; height: 50px;">';
                  }else{
                	appen += '<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>';
                  } 	  
 				  appen += item["nickName"];
                  appen += '</div>';
                  appen += '</div>';
                  appen += '<div class="col-md-4">';
                  appen += '<div class="likeImage">';
                  appen += '<img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:30px; margin-top:30px">';
                  appen += '</div>';
                  appen += '<div class="likeCount" style="margin-left:38px">';
                  appen += '<h5>'+item["likeCount"]+'</h5>';
                  appen += '</div>';
                  appen += '</div>';
                  appen += '</div>';
                  
                   }
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
		         
		         url: "/community/json/dietCommunitylist",
		         method: "POST",
		         data: JSON.stringify({
		            currentPage: 1,            
		            searchCondition: searchCondition,
		            searchKeyword: $("#searchKeyword").val(),
		        	searchFilter : $("#exPart").val()
		            
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
	                  	 appen += '<div class="post-entry bg-white" data-param="'+item["postNo"]+'" data-blind="'+item["blindStatus"]+'">';
	                  	
	                  	 if(item["blindStatus"]=='1'){	
	                  	 	appen += '<img src = "/resources/images/blind.PNG" style="width:348px; height:200px">';
	                  	}else if(item["blindStatus"]=='0'){
	                    	appen += '<div class="image" style="width:348px; height:200px">';
	                  
	             
	                  if(item["photo"]==null){
	              	 	 appen += '<img  src="/resources/images/1111.jpg" class="img-fluid" alt="" width= "340;" height= "200;" >'; 	  
	             	 
	                  }else if(item["photo"]!=null){
	             		 var youtube = item["photo"].indexOf("https");
	             		 if(youtube!=-1){
	            	  	 appen += '<img src="'+item["photo"]+'" class="img-fluid" width= "348;" height= "200;">';
	            	  	 }else{
	            	  	 appen += '<img src="/resources/images/upload/'+item["photo"]+'" class="img-fluid">';  
	            	  }
	              	}
	             	  appen += '</div><br/><div class="row">';   
	                  appen += '<div class="text col-md-8">';
	                  appen += '<h5 class="h5 text-black"><a href="#">'+item["title"]+'</a></h5>';
	                  appen += '<span class="text-uppercase date d-block mb-3"><small>'+item["postDate"]+'</small></span>';
	                  appen += '<div class="userInfo">';
	                 
	                  if(item["userImage"] != null && item["userImage"] != ''){	
	                  	appen += '<img src="/resources/images/userImage/'+item["userImage"]+'" style="border-radius:100px; width:50px; height: 50px;">';
	                  }else{
	                	appen += '<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>';
	                  } 	  
	 				  appen += item["nickName"];
	                  appen += '</div>';
	                  appen += '</div>';
	                  appen += '<div class="col-md-4">';
	                  appen += '<div class="likeImage">';
	                  appen += '<img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:30px; margin-top:30px">';
	                  appen += '</div>';
	                  appen += '<div class="likeCount" style="margin-left:38px">';
	                  appen += '<h5>'+item["likeCount"]+'</h5>';
	                  appen += '</div>';
	                  appen += '</div>';
	                  appen += '</div>';
	                  
	                   }
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

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> 
    
    <div class="site-section">
    	
      <div class="container">
      <div class="row">
       <div class="col-lg-4" >
      <h2>식단 커뮤니티 목록</h2>
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
 
        <p align="right"><a href="#" align="right" id="addDietCom" class="btn btn-primary pill text-white px-4">글쓰기</a></p>
        <br/>
        
  
         <div class="row mb-5" id="scroll"> 
        	<c:set var="i" value="0"/>
          	<c:set var="i" value="${i+1}"/>
          	<c:forEach var="post" items="${list}"> 
          
          	<div class="col-md-6 col-lg-4 mb-4">
          		
          	
            	<div class="post-entry bg-white box" data-param="${post.postNo}" data-blind="${post.blindStatus}">
            	<c:if test = "${post.blindStatus == '1'}">
            		<img src = "/resources/images/blind.PNG" style="width:348px; height:200px">
            	</c:if>
            	<c:if test = "${post.blindStatus == '0'}">
              		<div class="image"  style="width:348px; height:200px">
	              		<c:if test="${empty post.photo}">
	                    	<img  src="/resources/images/1111.jpg"  class="img-fluid" width= "340;" height= "200;">
	                	</c:if>
	                	<c:set var="youtubeThumbnail" value="${post.photo}"/>
	                 
	                	<c:if test="${!empty post.photo}">
		               		<c:choose>
		               			<c:when test="${fn:contains(youtubeThumbnail,'https')}">
		               				<img src="${post.photo}" class="img-fluid" width= "348px" height= "200;" >
		               			</c:when>   
		               			<c:otherwise>
		               				<img src="/resources/images/upload/${post.photo}"  class="img-fluid" width= "348px" height= "200;">
		               			</c:otherwise>            			
		               		</c:choose>
	                	</c:if>
              		</div>
              		
              		<br/>
              		<div class="row">
              		<div class="text col-md-8">
                		<h5 class="h5"><a href="#">${post.title}</a></h5>
                		<span class="text-uppercase date d-block mb-3">${post.postDate}</span>
                		<div class="userInfo">
                			<c:if test="${post.userImage != null and post.userImage != '' }">
                				<img src="/resources/images/userImage/${post.userImage}" style="border-radius:100px; width:50px; height: 50px;">
                			</c:if>
                			<c:if test="${post.userImage == null or post.userImage ==  ''}">
								<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>
						    </c:if>
                			${post.nickName}
                		</div>
              		</div>
              		
              		<div class="col-md-4">
 						<div class="likeImage">
 							<img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:30px; margin-top:30px">
 						</div>
 						<div class="likeCount" style="margin-left:38px">
 							<h5>${post.likeCount}</h5>
 						</div>
 					</div>
 					</div>
 					</c:if>
 					</div>
              	</div>


            </c:forEach> 
         </div>    

      </div>

    </div>

   </body>
</html>