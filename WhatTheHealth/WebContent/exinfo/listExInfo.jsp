<%@ page language="java" contentType="text/html; charset=EUC-KR" pageEncoding="EUC-KR"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<html lang="ko">
  <head>
    <title>IronMuscle &mdash; Colorlib Website Template</title>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">

 	<!-- <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
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
    <link rel="stylesheet" href="/resources/css/style.css">-->
    
    <script src="/resources/js/jquery-3.3.1.min.js"></script>
   <!--  <script src="/resources/js/jquery-migrate-3.0.1.min.js"></script>
    <script src="/resources/js/jquery-ui.js"></script>
    <script src="/resources/js/popper.min.js"></script>
    <script src="/resources/js/bootstrap.min.js"></script>
    <script src="/resources/js/owl.carousel.min.js"></script>
    <script src="/resources/js/jquery.stellar.min.js"></script>
    <script src="/resources/js/jquery.countdown.min.js"></script>
    <script src="/resources/js/jquery.magnific-popup.min.js"></script>
    <script src="/resources/js/bootstrap-datepicker.min.js"></script>
    <script src="/resources/js/aos.js"></script>
    <script src="/resources/js/main.js"></script>  -->
    
    
<!--   <link href="/css/animate.min.css" rel="stylesheet"> -->
   <!-- <link href="/css/bootstrap-dropdownhover.min.css" rel="stylesheet"> -->
    <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.2.0/js/bootstrap.min.js"></script> 
  </head>
  
  <script type="text/javascript">
 
   function fncGetExPart(){
	   var exPart = $("select[name='exPart']").val();
	   alert(exPart)
	   self.location="/exInfo/liseExInfo?exPart="+exPart
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
   
   
var currentPage=1;

   $(window).scroll(function(){
      
      if ($(window).scrollTop() == $(document).height() - $(window).height()) {
      
    	  currentPage++;
    	  alert("")
      $.ajax({
         
         url: "/exinfo/json/listExInfo",
         method: "POST",
         data: JSON.stringify({
            currentPage: currentPage+1 ,            
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
  					console.log(data)
                  var list = data["list"];
                  currentPage++;
         }        
         /*    list.forEach(function(item, index, array){
                     
                  
                 	 var appen = ""; 
                	  
                    '<div class="col-md-6 col-lg-4 mb-4">'+
                     '<div class="post-entry bg-white" data-param="${post.postNo}">'+
                       '<div class="image">'+
                       		if(item)
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
                       <div class="text p-6">
                         <h2 class="h3 text-black"><a href="#">${post.title}</a></h2>
                         <span class="text-uppercase date d-block mb-3"><small>${post.postDate}</small></span>
          				<p class="mb-0">${post.likeCount}</p>
                         <span class="text-uppercase date d-block mb-3">
                         <small>${post.nickName}</small>
                         </span>                
                       </div>
                     </div>
                   </div>                      	 
                	 
                	 
                	 
                     $("#enters").append(" <div class='col-sm-6 col-md-3'> <br/> <div class='thumbnail' style='height:400px;'>  <br/> <img src='/images/uploadFiles/"+item['fileName']+"' style='height:200px;'>"+
                           "<div class='caption'> <h3>"+item['prodName']+"</h3> <p>"+item['prodDetail']+"</p> <br/> <p><button type='button' class='btn btn-primary'  data-param4 ="+item['prodNo']+" data-param5 = "+item['proTranCode']+">상세정보</button>"+
                           " </p> </div>   </div>  </div>");
                  });     */
                      
           
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
      <c:if test="${post.category==null}">
      <h3><strong>운동부위</strong></h3>
      </c:if>

      <form class="form-inline" name="detailForm">       
       	
		<div class="form-group">  
			<select class="form-control" id="searchFilter" name="exPart" onchange="javascript:fncGetExPart('1');" >
				<option value=null>카테고리</option>
				<option value="0" ${!empty post.exPart && post.exPart =='0' ? "selected" : "" }>전신</option>
				<option value="1" ${!empty post.exPart && post.exPart =='1' ? "selected" : "" }>복부</option>
				<option value="2" ${!empty post.exPart && post.exPart =='2' ? "selected" : "" }>상체</option>	
				<option value="3" ${!empty post.exPart && post.exPart =='3' ? "selected" : "" }>하체</option>	
				<option value="4" ${!empty post.exPart && post.exPart =='4' ? "selected" : "" }>스트레칭</option>		
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
      <hr/>
      <br/>
      
<!-- Split button -->
<!-- <div class="btn-group">
  <button type="button" class="btn btn-danger">Action</button>
  <button type="button" class="btn btn-danger dropdown-toggle" data-toggle="dropdown" aria-expanded="false">
    <span class="caret"></span>
    <span class="sr-only">Toggle Dropdown</span>
  </button>
  <ul class="dropdown-menu" role="menu">
    <li><a href="#">Action</a></li>
    <li><a href="#">Another action</a></li>
    <li><a href="#">Something else here</a></li>
    <li class="divider"></li>
    <li><a href="#">Separated link</a></li>
  </ul>
</div> -->
     
     
     <c:if test="${sessionScope.user.role == 'admin'}">
        <p align="right"><a href="#" align="right" class="btn btn-primary pill text-white px-4">글쓰기</a></p>
    </c:if>
        <br/>
        
        
        <div class="row mb-5">
          <c:set var="i" value="0"/>
          <c:set var="i" value="${i+1}"/>
          <c:forEach var="post" items="${list}"> 
          
          
          <div class="col-md-6 col-lg-4 mb-4">
            <div class="post-entry bg-white" data-param="${post.postNo}">
              <div class="image">
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
              <div class="text p-6">
                <h2 class="h3 text-black"><a href="#">${post.title}</a></h2>
                <span class="text-uppercase date d-block mb-3"><small>${post.postDate}</small></span>
 				<p class="mb-0">${post.likeCount}</p>
                <span class="text-uppercase date d-block mb-3">
                <small>${post.nickName}</small>
                </span>                
              </div>
            </div>
          </div>      
          
          
   </c:forEach> 
                          
    <footer class="site-footer">
      <div class="container">
        

        <div class="row">
          <div class="col-lg-7">
            <div class="row">
              <div class="col-6 col-md-4 col-lg-8 mb-5 mb-lg-0">
                <h3 class="footer-heading mb-4 text-primary">About</h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Repellat quos rem ullam, placeat amet sint vel impedit reprehenderit eius expedita nemo consequatur obcaecati aperiam, blanditiis quia iste in! Assumenda, odio?</p>
                <p><a href="#" class="btn btn-primary pill text-white px-4">Read More</a></p>
              </div>
              <div class="col-6 col-md-4 col-lg-4 mb-5 mb-lg-0">
                <h3 class="footer-heading mb-4 text-primary">Quick Menu</h3>
                <ul class="list-unstyled">
                  <li><a href="#">About</a></li>
                  <li><a href="#">Services</a></li>
                  <li><a href="#">Approach</a></li>
                  <li><a href="#">Sustainability</a></li>
                  <li><a href="#">News</a></li>
                  <li><a href="#">Careers</a></li>
                </ul>
              </div>
            </div>
          </div>
          <div class="col-lg-5">
            <div class="row mb-5">
              <div class="col-md-12"><h3 class="footer-heading mb-4 text-primary">Contact Info</h3></div>
              <div class="col-md-6">
                <p>New York - 2398 <br> 10 Hadson Carl Street</p>    
              </div>
              <div class="col-md-6">
                Tel. + (123) 3240-345-9348 <br>
                Mail. usa@youdomain.com
              </div>
            </div>

            <div class="row">
              <div class="col-md-12"><h3 class="footer-heading mb-4 text-primary">Social Icons</h3></div>
              <div class="col-md-12">
                <p>
                  <a href="#" class="pb-2 pr-2 pl-0"><span class="icon-facebook"></span></a>
                  <a href="#" class="p-2"><span class="icon-twitter"></span></a>
                  <a href="#" class="p-2"><span class="icon-instagram"></span></a>
                  <a href="#" class="p-2"><span class="icon-vimeo"></span></a>

                </p>
              </div>
            </div>
            
          </div>
        </div>
        <div class="row pt-5 mt-5 text-center">
          <div class="col-md-12">
            <p>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            Copyright &copy; <script data-cfasync="false" src="/cdn-cgi/scripts/5c5dd728/cloudflare-static/email-decode.min.js"></script><script>document.write(new Date().getFullYear());</script> All Rights Reserved | This template is made with <i class="icon-heart text-primary" aria-hidden="true"></i> by <a href="https://colorlib.com" target="_blank" >Colorlib</a>
            <!-- Link back to Colorlib can't be removed. Template is licensed under CC BY 3.0. -->
            </p>
          </div>
          
        </div>
      </div>
    </footer>
      </div>
    </div>
  </div>
   