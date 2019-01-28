<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   
   <title>커뮤니티 게시물 조회페이지</title>
   
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
   
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="../resources/fonts/icomoon/style.css">

    <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/magnific-popup.css">
    <link rel="stylesheet" href="../resources/css/jquery-ui.css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    
    <link rel="stylesheet" href="../resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="../resources/css/aos.css">
    <link rel="stylesheet" href="../resources/css/style.css">
   
   <style>
   
   	.giyong{
   		margin-top : 5em;
   		padding : 2em;
   		border : 1px solid gray;
   		border-radius : 15px;
   		text-align : center;
   	}
   	
   	.contents{
   		display : block;
   		text-align : center;
   	}
   	
   	.giyong ul{
   		display : block;
   		height : 60px;
   		overflow : hidden;
   		padding-inline-start : 0;
   		margin : 0 auto;
   		text-align : center;
   		padding-left : 30em;
   	}
   	
   	.giyong li{
   		display : block;
   		list-style-type : none;
   		float : left;
   	}
   	
   	.Kimgiyong{
   		display : block;
   		height : 60px;
   	}
   	
   	.giyongInput{
   		margin-top : 50px;
   		text-align : left;
   	}
   	
   </style>
   <script type="text/javascript">
  
    function favoriteList(){
           $.ajax({
               url : '/favorite/json/listFavorite/'+'${post.postNo}',
               type : 'GET',
               success : function(JSONData){
                    var a =''; 
                    var b ='';
                    $.each(JSONData, function(i){
                       console.log(JSONData);
                        var list = JSONData[i];
                        console.log(JSONData[i]);
                        console.log(list.pressedStatus);
                        if(list.pressedStatus == '1'){
                           if(list.favoriteType == '0'){
                              a += '<img src="../resources/images/fullHeart.png"  width="60px" class="likeImage" onclick="fullHeart()">';
                              $(".likeImage").remove();
                              
                           }else if(list.favoriteType == '1'){
                              $(".interestImage").remove();
                              b += '<img src="../resources/images/fullStar.png" width="60px" class="interestImage" onclick="fullStar()" >';
                               
                           }
                        }
                   });
                    if(a != ''){
                       $(".like").append(a); 
                    }
                    if(b != ''){
                       $(".interest").append(b);
                    }
               }
           });
       } 
    
   
    $(document).ready(function(){
       favoriteList(); 
       });

    //var likeCount = $(this).data("param");
    var likeCount = '${post.likeCount}';
    
    function emptyHeart(){
      $.ajax({
            url : '/favorite/json/addLike/'+'${post.postNo}',
            type : "GET",
            success : function(data){
                if(data == 1) {
                  favoriteList(); 
                  likeCount++;
                  //likeCount.attr('likeCount'); 
                  $(".likeCount").replaceWith("좋아요 수  : "+ likeCount);
                  }
               }            
            });
      }
    
    function fullHeart(){
       
         $.ajax({
               url : '/favorite/json/deleteLike/'+'${post.postNo}',
               type : "GET",
               success : function(data){
                  var a =''; 
                  
                   if(data == 1) {
                      a += '<img src="../resources/images/emptyHeart.png"  width="60px" class="likeImage" onclick="emptyHeart()">';
                             $(".likeImage").remove();
                      likeCount--;
                      //likeCount.attr('likeCount');
                      $(".likeCount").replaceWith("좋아요 수  : "+ likeCount);        
                     }
                   $(".like").append(a); 
                  }
               });
         }
    
    function emptyStar(){
         $.ajax({
               url : '/favorite/json/addInterest/'+'${post.postNo}',
               type : "GET",
               success : function(data){
                   if(data == 1) {
                     favoriteList(); 
                     }
                  }            
               });
         }
       
       function fullStar(){
          
            $.ajax({
                  url : '/favorite/json/deleteInterest/'+'${post.postNo}',
                  type : "GET",
                  success : function(data){
                     var a =''; 
                     
                      if(data == 1) {
                         a += '<img src="../resources/images/emptyStar.png"  width="60px" class="interestImage" onclick="emptyStar()">';
                                $(".interestImage").remove();
                        }
                      $(".interest").append(a); 
                     }
                  });
            }
       
       function fullSiren(){
          
    	   popWin 
           = window.open("/claim/addClaim?targetNo="+${post.postNo}+"&menu=post",
                                "popWin", 
                                "left=100,top=200,width=580,height=500,marginwidth=0,marginheight=0,"+
                                "scrollbars=no,scrolling=no,menubar=no,resizable=no");
            }
          
       
       $( function (){
          $( "a[href='#' ]:contains('수정')").on("click", function(){
               self.location="/community/updateCommunity?postNo=${post.postNo}"
            });
          
          if("${post.category == '2'}"){
          $( "a[href='#' ]:contains('삭제')").on("click", function(){
               self.location="/community/deleteExCom?postNo=${post.postNo}"
            });
	       }else if("${post.category == '3'}"){
	    	   $( "a[href='#' ]:contains('삭제')").on("click", function(){
	               self.location="/community/deleteDietCom?postNo=${post.postNo}"
	            });
	       }
         });
       
   </script>
</head>
<body>
   
   <div class="site-wrap">
   <!-- ToolBar Start /////////////////////////////////////-->
   <jsp:include page="/layout/toolbar.jsp" /> 
   <!-- ToolBar End /////////////////////////////////////-->
   <!-- 툴바 인클루드 시작! -->
   
   </div>
   <!-- <div class="site-section" align="center"> -->
      <div class="container">
      
        <div class="giyong">
          	<h4>${post.title}</h4>
          	<ul>
          		<%-- <li><span class="likeCount" data-param="${post.likeCount}">좋아요 수  : ${post.likeCount}</span></li> --%>
          		<li><span class="likeCount">좋아요 수  : ${post.likeCount}</span></li>
          		<li><span>&nbsp; 조회 수 : ${post.clickCount}</span></li>
          	</ul>
          	
          	<!-- <span class="title" > -->
            	<%-- <h4 class="mb-3">${post.title}</h4> --%>
            <!-- </span> -->
            <!-- <span class="etc" > -->
	             <%-- <small>좋아요 수  : ${post.likeCount}</small> --%> 
	             <%-- <small>조회 수 : ${post.clickCount}</small> --%>
	        <!-- </span> -->
             
            <div class="contents" >
				<p>${post.contents}</p>
           		 <%-- <p class="mb-4">${post.contents}</p> --%>
           	</div>
                     <!-- 다음맵지도 -->
              <c:if test="${post.coordinate!=null}">
			  	  
	              <!-- <div class="col-md-10 col-lg-5 mb-5 mb-lg-0"> -->  
	            	  <jsp:include page="/common/getMap.jsp" /> 
	              
                </c:if>

		<div class="Kimgiyong">                        
             <!-- <div class="text-center border-bottom border-top margin-ten padding-four no-margin-bottom favorite"> -->
                
                <div class="favoriteListHere" >
                   <div style="float: left; width: 47%;" class="like">
                   <img src="../resources/images/emptyHeart.png" width="60px" class="likeImage" onclick="emptyHeart()">
                   </div>
                   <div style="float: left; width: -2%;" class="interest">
                   <img src="../resources/images/emptyStar.png"  width="60px" class="interestImage" onclick="emptyStar()">
                   </div>
                   <div style="float: left; width: 45%;" class="claim">
                   <img src="../resources/images/fullSiren.png"  width="60px" class="claimImage" onclick="fullSiren()">
                   </div>
                </div>
            
            <c:if test = "${user.userId == post.userId}">
            	<div style="margin-top : 5em;">
	            	<p>
	            		<a href="#" class="btn btn-primary pill px-4">수정</a>
	            		<a href="#" class="btn btn-primary pill px-4">삭제</a>
	            	</p>
	            </div>
            </c:if>
          </div>
          
          <div class="giyongInput">
           <jsp:include page="/reply/listReply.jsp" />
          </div>
           
        
      </div>
    <!-- </div> -->

  

</body>
</html>