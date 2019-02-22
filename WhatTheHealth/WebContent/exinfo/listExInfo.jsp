<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
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
  
  </head>
  
  <script type="text/javascript">
 

  function fncGetList(currentPage){
	   $("#currentPage").val(currentPage);
	   $(".form-inline").attr("method", "POST").attr("action", "/exInfo/listExInfo").submit();
   } 
   $(function(){
	  	$(".post-entry").on("click", function(){
	  		var postNo = $(this).data("param");
	  		var blindStatus = $(this).data("blind");
	  		if(blindStatus == '1'){
	  			alert('블라인드 처리된 게시물입니다.');
	  			return;
	  		}
	  		self.location = "/exInfo/getExInfo?postNo="+postNo;
	  	});
	  });
  

   //글쓰기
   $(function() {
		$("#writeExinfo").on("click" , function() {
			self.location = "/exinfo/addExInfo.jsp" 
		});
	});	
   
   //글 보기
   $(function(){
	  $(document).on("click", ".post-entry", function(){
		var postNo=$(this).data("param");
		self.location = "/exInfo/getExInfo?postNo="+postNo;
	  });
   });
   
   $(function(){
	  $("#searchButton").on("click", function(){
		  fncGetList('1');
		 
	  }); 
   });
   


   var currentPage=1;

   $(window).scroll(function(){
	  
       if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      
		currentPage++;
		
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
                  	 appen += '<div class="post-entry bg-white" data-param="'+item["postNo"]+'" data-blind="'+item["blindStatus"]+'">';
                 	 appen += '<div class="image" style="width:348px; height:200px">';
             
                  if(item["photo"]==null){
              	 	 appen += '<img  src="/resources/images/1111.jpg" class="img-fluid" alt="" style="width:340px; height:200px">'; 	  
             	  }else if(item["photo"]!=null){
             		 var youtube = item["photo"].indexOf("https");
             		 if(youtube!=-1){
            	  	 appen += '<img src="'+item["photo"]+'" class="img-fluid" style="width:348px; height:200px">';
            	  	 }else{
            	  	 appen += '<img src="/resources/images/upload/'+item["photo"]+'" class="img-fluid" style="width:348px; height:200px">';  
            	  }
              	}
             	  appen += '</div><br/><div class="row">';   
                  appen += '<div class="text col-md-8">';
                  appen += '<h5 class="h5 text-black"><a href="#">'+item["title"]+'</a></h5>';
                  appen += '<span class="text-uppercase date d-block mb-3"><small>'+item["postDate"]+'</small></span>';
                  appen += '<div class="userInfo">';
                 
                  
                  if(item["userImage"] != null && item["userImage"] != ''){	
                  	appen += '<img src="/resources/images/userImage/'+item["userImage"]+'" style="border-radius:100px; width:50px; height: 50px;">';
                  }else {
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
      </div>
      <div class="site-mobile-menu-body"></div>
    </div>
    

    <div class="site-section">
      
      <div class="container">
      <div class="row">
       <div class="col-lg-6" >
      <h2>운동꿀팁 목록</h2>
      </div>
      

      <form class="form-inline" name="detailForm">    
       	
       	<div class="col-lg-3" style="padding-left: 30px;">
		<div class="form-group">  
			<select class="form-control" id="searchFilter" name="searchFilter" onchange="fncGetList('1');"  style="height:75%;" >
				<option value=''>카테고리</option>
				<option value="0" ${!empty search.searchFilter && search.searchFilter =='0' ? "selected" : "" }>전신</option>
				<option value="1" ${!empty search.searchFilter && search.searchFilter =='1' ? "selected" : "" }>복부</option>
				<option value="2" ${!empty search.searchFilter && search.searchFilter =='2' ? "selected" : "" }>상체</option>	
				<option value="3" ${!empty search.searchFilter && search.searchFilter =='3' ? "selected" : "" }>하체</option>	
				<option value="4" ${!empty search.searchFilter && search.searchFilter =='4' ? "selected" : "" }>스트레칭</option>		
			</select>   			
		 </div> 
		</div>
		
		<div class="col-lg-2" > 
		<div class="form-group">
			<select class="form-control" id="searchCondition"name="searchCondition"  style="height:75%;">		
				<option value="0" ${! empty search.searchCondition && search.searchCondition==0 ? "selected" : "" }>제목</option>
				<option value="1" ${! empty search.searchCondition && search.searchCondition==1 ? "selected" : "" }>내용</option>
			</select>
       </div>
		</div>
		
		<div class="col-lg-6" >			  
	   <div class="form-group" style="align:right;">
	     	<input type="text" class="form-control" style="height:90%; width:120%" id="searchKeyword" name="searchKeyword"  placeholder="검색어" 
					value="${! empty search.searchKeyword ? search.searchKeyword : '' }"  >
	   </div>
	   </div>
        <div class="col-lg-1" >	
           <button type="button" class="btn btn-danger" id="searchButton">
		     <span class="icon-search mr-1" aria-hidden="true"></span> 
		    </button>
		    
           <input type="hidden" id="currentPage" name="currentPage" value=""/>		 
		  </div>     
		  
	  </form> 	      

      </div>
   	  <hr/>
   	  
   	<c:if test="${sessionScope.user.role == 'admin'}">
        <p align="right"><a href="#" align="right" class="btn btn-primary pill text-white px-4" id="writeExinfo">글쓰기</a></p>
    </c:if>
    
      <br/>
      
       

        <br/>
        
        
        <div class="row mb-5" id="scroll">
          <c:set var="i" value="0"/>
          <c:set var="i" value="${i+1}"/>
          <c:forEach var="post" items="${list}"> 
          
          
          <div class="col-md-6 col-lg-4 mb-4">
          
            <div class="post-entry bg-white" data-param="${post.postNo}" data-blind="${post.blindStatus}">
              <div class="image" style="width:348px; height:200px">
              	<c:if test="${empty post.photo}">
                    <img  src="/resources/images/1111.jpg" class="img-fluid" alt="" width= "340;" height= "200;">
                </c:if>
                <c:set var="youtubeThumbnail" value="${post.photo}"/>
                 
                <c:if test="${!empty post.photo}">
               		<c:choose>
               			<c:when test="${fn:contains(youtubeThumbnail,'https')}">
               				<img src="${post.photo}" class="img-fluid" style="width:348px; height:200px">
               			</c:when>   
               			<c:otherwise>
               				<img src="/resources/images/upload/${post.photo}" class="img-fluid" style="width:348px; height:200px">
               			</c:otherwise>            			
               		</c:choose>
                </c:if>
              </div>
              <br/>
              <div class="row">
              <div class="text col-md-8">
             
                <h5 class="h5 text-black"><a href="#">${post.title}</a></h5>
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
          
        </div> 
        
        
   </c:forEach> 
        
   
  	    
      </div>
  
     </div>
    </div>
  </body>
</html>
   