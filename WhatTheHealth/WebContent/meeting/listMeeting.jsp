<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
  <head>
    <title>소모임 목록 페이지</title>
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
  	$(".post-entry").on("click", function(){
  		var meetNo = $(this).data("param");
  		self.location = "/meeting/getMeetingMap?meetNo="+meetNo;
  	});
  });
  
   $(function() {
		$("#addMeeting").on("click" , function() {
			if("${sessionScope.user}" == null ||"${sessionScope.user}" == ""){				 
				 //alert("로그인이 필요한 서비스입니다.");
				 //self.location = "/" 
				swal("회원만 이용 가능합니다", "로그인해주세요", "error");
				 return;
			 } else if("${sessionScope.user}" != null){
				self.location = "/meeting/addMeeting"	//UserId??????????
			 }
		});
	});	
   
   /* $(function() {
		$("#addSocket").on("click" , function() {
			self.location = "/socket/addLiveStream";
		});
	}); */
	
	   var currentPage=1;

	   $(window).scroll(function(){
		  
	       if ($(window).scrollTop() == $(document).height() - $(window).height()) {
	      
			currentPage++;
	     
	      $.ajax({
	         
	         url: "/meeting/json/listMeeting",
	         method: "POST",
	         data: JSON.stringify({
	            currentPage: currentPage
	         }),
	         dataType: "json",
	         headers : {
	            "Accept" : "application/json",
	            "Content-Type" : "application/json"
	         },
	         success : function(data , status){
	  	
	        	
	               var list = data["list"];
	   
	                  
	             list.forEach(function(item, index, array){     
	            
	            	  
	            	  var youtube = item.post["photo"].indexOf("https");
	            	  var appen = ""; 
	                       
	                  	 appen += '<div class="col-md-6 col-lg-4 mb-4">';
	                  	 appen += '<div class="post-entry bg-white" data-param="'+item.post["postNo"]+'">';
	                 	 appen += '<div class="image" style="width:348px; height:200px">';
	             
	                  if(item.post["photo"]==null){
	              	 	 appen += '<img  src="/resources/images/1111.jpg" class="img-fluid" alt="" width= "340;" height= "200;">'; 	  
	             	  }else if(item.post["photo"]!=null){
	            	  	
	             		 if(youtube!=-1){
	            	  	 appen += '<img src="'+item.post["photo"]+'" class="img-fluid" width= "348;" height= "200;">';
	            	  	 }else{
	            	  	 appen += '<img src="/resources/images/upload/'+item.post["photo"]+'" class="img-fluid">';  
	            	  	}
	              	  }
	             	  appen += '</div>';   
	                  appen += '<div class="text col-md-8">';
	                  appen += '<h5 class="h5 text-black"><a href="#">'+item.post["title"]+'</a></h5>';
	                  appen += '<span class="text-uppercase date d-block mb-3"><small>'+item.post["postDate"]+'</small></span>';
	                  appen += '<div class="userInfo">';
	                 
	                  if(item.post["userImage"] != null && item.post["userImage"] != ''){	
	                  	appen += '<img src="/resources/images/userImage/'+item.post["userImage"]+'" style="border-radius:100px; width:50px; height: 50px;">';
	                  }else{
	                	appen += '<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>';
	                  } 	  
	 				  appen += item.post["nickName"];
	                  appen += '</div>';
	                  appen += '</div>';
	                  appen += '<div class="col-md-4">';
	                  appen += '<div class="likeImage">';
	                  appen += '<img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:30px; margin-top:30px">';
	                  appen += '</div>';
	                  appen += '<div class="likeCount" style="margin-left:38px">';
	                  appen += '<h5>'+item.post["likeCount"]+'</h5>';
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
	
  </script>
  
  
  <body>

   <div class="site-wrap">
     <jsp:include page="/layout/toolbar.jsp" /> 

    <div class="site-mobile-menu">
      <div class="site-mobile-menu-header">
<!--    <div class="site-mobile-menu-close mt-3">
          <span class="icon-close2 js-menu-toggle"></span>
        </div> -->
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    

    
<!--     <div class="site-blocks-cover inner-page overlay" style="background-image: url(images/hero_bg_2.jpg);" data-aos="fade" data-stellar-background-ratio="0.5">
      <div class="container">
        <div class="row align-items-center justify-content-center">
          <div class="col-md-7 text-center">
            <h1 class="mb-5">News &amp; <strong>Updates</strong></h1>
          </div>
        </div>
      </div>
    </div>   -->

    <div class="site-section">
      <div class="container">
      <div><h2>소모임 목록</h2></div> 
      <hr/>
       <p align="right"><a href="#" align="right" class="btn btn-primary pill text-white px-4"  id="addMeeting">글쓰기</a></p>
      <br/>
   
       
        
        <div class="row mb-5" id="scroll">
          <c:set var="i" value="0"/>
          <c:set var="i" value="${i+1}"/>
          <c:forEach var="meeting" items="${list}"> 
          
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="post-entry bg-white box" data-param="${meeting.meetNo}">
              <div class="image"  style="width:348px; height:200px">
              	<c:if test="${empty meeting.post.photo}">
                    <img  src="/resources/images/1111.jpg" class="img-fluid" alt="" width= "340;" height= "200;">
                </c:if>
                <c:set var="youtubeThumbnail" value="${meeting.post.photo}"/>
                <c:if test="${!empty meeting.post.photo}">
                <c:choose>
		               			<c:when test="${fn:contains(youtubeThumbnail,'https')}">
		               				<img src="${meeting.post.photo}" class="img-fluid" width= "348;" height= "200;" >
		               			</c:when>   
		               			<c:otherwise>
		               				<img src="/resources/images/upload/${meeting.post.photo}"  class="img-fluid" width= "348;" height= "200;" >
		               			</c:otherwise>            			
		               		</c:choose>
                	<%-- <img src="/resources/images/upload/${meeting.post.photo}" class="img-fluid" alt=""> --%>
                </c:if>
              </div>
              
              <br/>
              <div class="row">
              <div class="text col-md-8">
                <h5 class="h5" ><a href="#">${meeting.post.title}</a></h5>
                <span class="text-uppercase date d-block mb-3">${meeting.post.postDate}</span>
 				<%-- <p class="mb-0">${meeting.post.likeCount}</p>
                <span class="text-uppercase date d-block mb-3">
                <small>${meeting.post.nickName}</small>
                </span>   --%>              
                <div class="userInfo">
                			<c:if test="${meeting.post.userImage != null and meeting.post.userImage != '' }">
                				<img src="/resources/images/userImage/${meeting.post.userImage}" style="border-radius:100px; width:50px; height: 50px;">
                			</c:if>
                			<c:if test="${meeting.post.userImage == null or meeting.post.userImage ==  ''}">
								<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>
						    </c:if>
                			${meeting.post.nickName}
                		</div>
              </div>
              
              <div class="col-md-4">
 						<div class="likeImage">
 							<img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:30px; margin-top:30px">
 						</div>
 						<div class="likeCount" style="margin-left:38px">
 							<h5>${meeting.post.likeCount}</h5>
 						</div>
 					</div>
 				</div>

            </div>
          </div>    
          
   </c:forEach> 
                          
   </div>    
         <!-- div : end -->
          
   <%-- </c:forEach>  --%>
                          
      </div>
      <!-- container : end -->
    </div>
  </div>
   </body>
</html>