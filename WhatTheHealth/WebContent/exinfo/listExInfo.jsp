<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
  <head>
    <title>IronMuscle &mdash; Colorlib Website Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="/resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="/resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/css/magnific-popup.css">
    <link rel="stylesheet" href="/resources/css/jquery-ui.css">
    <link rel="stylesheet" href="/resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="/resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="/resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="/resources/css/animate.css">
    
    <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/css/bootstrap.min.css">
    <link rel="stylesheet" href="/resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="/resources/css/aos.css">
    <link rel="stylesheet" href="/resources/css/style.css">
    
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
    <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="/resources/js/jquery-ui.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/jquery.countdown.min.js"></script>
    <script src="/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/js/bootstrap-datepicker.min.js"></script>
    <script src="/resources/js/aos.js"></script>
    <script src="/resources/js/main.js"></script>  
    
    
<!--   <link href="/css/animate.min.css" rel="stylesheet"> -->
   <!-- <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
  </head>
  
  <script type="text/javascript">
 

   
   function fncGetList(currentPage){
	   $("#currentPage").val(currentPage);
	   $(".form-inline").attr("method", "POST").attr("action", "/exInfo/listExInfo").submit();
   }
   
  
   $(function(){
  	$(".post-entry").on("click", function(){
  		var postNo =$(this).data("param");
  		self.location = "/exInfo/getExInfo?postNo="+postNo;
  	});
  });
   
   $(function() {
		$("a[href='#' ]").on("click" , function() {
			self.location = "/exinfo/addExInfo.jsp" 
		});
	});	
   
   $(function(){
	  $(document).on("click", ".post-entry", function(){
		var postNo=$(this).data("param");
		self.location = "/exInfo/getExInfo?postNo="+posetNo;
	  });
   });
   
   $(function(){
	  $("button:contains('검색')").on("click", function(){
		  fncGetList('1');
		 
	  }); 
   });
   




   $(window).scroll(function(){
	   var currentPage=1;
      if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      
		currentPage++;
     	alert(currentPage)
      $.ajax({
         
         url: "/exinfo/json/listExInfo",
         method: "POST",
         data: JSON.stringify({
            currentPage: currentPage ,            
            searchCondition: $("#searchCondition").val(),
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
                  appen += '<div class="post-entry bg-white" data-param="'+item["postNo"]+'">';
                  appen += '<div class="image" style="width:400px; height:200px">';
              if(item["photo"]==null){
              	  appen += '<img  src="/resources/images/1111.jpg" class="img-fluid" alt="">'; 	  
              }
                  
                  /* appen += '<c:if test="'+(item["photo"] == null)+'">';
                  appen += '<img  src="/resources/images/1111.jpg" class="img-fluid" alt="">';
                  appen += '</c:if>'; */
                  appen += '<c:set var="youtubeThumbnail" value="'+item["photo"]+'"/>';
                  appen += '<c:if test="'+item["photo"]+'">';
                  appen += '<c:choose>';
                  appen += '<c:when test="${fn:contains(youtubeThumbnail,"https")}">';
                  appen += '<img src="'+item["photo"]+'" class="img-fluid" width= "400;" height= "200;">';
                  appen += '</c:when>';  
                  appen += '<c:otherwise>';
                  appen += '<img src="/resources/images/upload/'+item["photo"]+'" class="img-fluid">';
                  appen += '</c:otherwise>';                    
                  appen += '</c:choose>';
                  appen += '</c:if>';
                  appen += '</div>';
                  appen += '<div class="text col-md-8">';
                  appen += '<h2 class="h3 text-black"><a href="#">'+item["title"]+'</a></h2>';
                  appen += '<span class="text-uppercase date d-block mb-3"><small>'+item["postDate"]+'</small></span>';
                  appen += '<div class="userInfo">';
                  appen += '<c:if test="'+item["userImage"] != null && item["userImage"] != "" +'">';
                  appen += '<img src="/resources/images/userImage/'+item["userImage"]+'" style="border-radius:100px; width:50px; height: 50px;">';
                  appen += '</c:if>';
                  appen += '<c:if test="'+item["userImage"] == null && item["userImage"] == "" +'">';
                  appen += '<img src = "/resources/images/userImage/defaultUser.png" align="middle" style="border-radius:100px; width:50px; height: 50px;"/>';
                  appen += '</c:if>';
                  appen += item["nickName"];
                  appen += '</div>';
                  appen += '</div>';
                  appen += '<div class="col-md-4">';
                  appen += '<div class="likeImage">';
                  appen += '<img src="../resources/images/fullHeart.png" style="width: 25px; margin-left:30px; margin-top:30px">';
                  appen += '</div>';
                  appen += '<div class="likeCount" style="margin-left:38px">';
                  appen += '<h5>${post.likeCount}</h5>';
                  appen += '</div>';
                  appen += '</div>';
                  appen += '</div>';
                  appen += '</div>';                

                  $(".scorll").append(appen);              
                  
              
      
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
      </div>
      <div class="site-mobile-menu-body"></div>
    </div> <!-- .site-mobile-menu -->
    

    <div class="site-section">
      
      <div class="container">
      <div><h2>운동꿀팁 목록</h2></div>
   	  <hr/>
   	  
   	<c:if test="${sessionScope.user.role == 'admin'}">
        <p align="right"><a href="#" align="right" class="btn btn-primary pill text-white px-4">글쓰기</a></p>
    </c:if>
    <form class="form-inline" name="detailForm">    
       	
		<div class="form-group">  
			<select class="form-control" id="searchFilter" name="searchFilter" onchange="fncGetList('1');" >
				<option value=''>카테고리</option>
				<option value="0" ${!empty search.searchFilter && search.searchFilter =='0' ? "selected" : "" }>전신</option>
				<option value="1" ${!empty search.searchFilter && search.searchFilter =='1' ? "selected" : "" }>복부</option>
				<option value="2" ${!empty search.searchFilter && search.searchFilter =='2' ? "selected" : "" }>상체</option>	
				<option value="3" ${!empty search.searchFilter && search.searchFilter =='3' ? "selected" : "" }>하체</option>	
				<option value="4" ${!empty search.searchFilter && search.searchFilter =='4' ? "selected" : "" }>스트레칭</option>		
			</select>   			
		 </div> 
		 
		<div class="form-group">
			<select class="form-control" id="searchCondition"name="searchCondition" >		
				<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
				<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>내용</option>
			</select>
       </div>
					  
	   <div class="form-group" style="align:right">
	     	<input type="text" class="form-control" id="searchKeyword" name="searchKeyword"  placeholder="검색어" 
					value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
	   </div>
        
           <button type="button" class="btn btn-info">검색</button>
        		
           <input type="hidden" id="currentPage" name="currentPage" value=""/>		 
		       
	  </form> 	      
      <br/>
      
       

        <br/>
        
        
        <div class="row mb-5">
          <c:set var="i" value="0"/>
          <c:set var="i" value="${i+1}"/>
          <c:forEach var="post" items="${list}"> 
          
          
          <div class="col-md-6 col-lg-4 mb-4">
          
            <div class="post-entry bg-white" data-param="${post.postNo}">
              <div class="image" style="width:400px; height:200px">
              	<c:if test="${empty post.photo}">
                    <img  src="/resources/images/1111.jpg" class="img-fluid" alt="">
                </c:if>
                <c:set var="youtubeThumbnail" value="${post.photo}"/>
                 
                <c:if test="${!empty post.photo}">
               		<c:choose>
               			<c:when test="${fn:contains(youtubeThumbnail,'https')}">
               				<img src="${post.photo}" class="img-fluid" width= "400;" height= "200;">
               			</c:when>   
               			<c:otherwise>
               				<img src="/resources/images/upload/${post.photo}" class="img-fluid">
               			</c:otherwise>            			
               		</c:choose>
                </c:if>
              </div>
              <div class="text col-md-8">
              <!-- <div class="text p-6"> -->
                <h2 class="h3 text-black"><a href="#">${post.title}</a></h2>
                <span class="text-uppercase date d-block mb-3"><small>${post.postDate}</small></span>
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
          
        </div> 
        
        <span class="scorll"></span>
   </c:forEach> 
                          
   
  	    
      </div>
  
     </div>
    </div>
  </body>
</html>
   