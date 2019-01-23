<%@ page contentType="text/html; charset=UTF-8" %>
<%@ page pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>


<html lang="ko">
<head>
   
   <title>운동꿀팁 게시물 조회</title>
   
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
   
   .img-fluid{
   	width : 30px;
   	 height: 30px;
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
   
    
    function emptyHeart(){
      $.ajax({
            url : '/favorite/json/addLike/'+'${post.postNo}',
            type : "GET",
            success : function(data){
            	alert(data)
                if(data == 1) {
                  favoriteList(); 
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
          
            $.ajax({
                  url : '/claim/json/addClaim/'+'${post.postNo}',
                  type : "GET",
                  success : function(data){
                     }
                  });
            }
          
       
       $( function (){
          $( "a[href='#' ]:contains('수정')").on("click", function(){
        		var postNo = $(this).data("param");
        	  self.location="/exInfo/updateExInfo?postNo="+postNo
            });
          $( "a[href='#' ]:contains('삭제')").on("click", function(){
               self.location="/exInfo/deleteExInfo?postNo=${post.postNo}"
            });
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
   <div class="site-section">
      <div class="container">
      
    	<input type="hidden" name="postNo" value="${post.postNo }"/>
        <div class="row align-items-center">
          <div class="col-md-10 col-lg-5 mb-5 mb-lg-0">
            <h4 class="mb-3">${post.title}</h4>
             <small>좋아요 수  : ${post.likeCount}</small> 
             <small>조회 수 : ${post.clickCount}</small> 
             <hr/>
            <span><h6>프로그램 간략정보</h6></span>   
            
           <div class="col-md-10 col-lg-5 mb-5 mb-lg-0">
                <img src="/resources/images/upload/clock.png" alt="Image" class="img-fluid">
                <span>${post.exVideoTime}</span >
           </div>   
           
                    
            <div class="col-md-10 col-lg-5 mb-5 mb-lg-0">
                <img src="/resources/images/upload/run.png" alt="Image" class="img-fluid">
                <span>${post.exCalorie} kcal</span>
            </div>  
            
              <div class="col-md-10 col-lg-5 mb-5 mb-lg-0">
                <img src="/resources/images/upload/exPart.png" alt="Image" class="img-fluid">
                <c:if test="${post.exPart=='0'}">
                                     전신  
                </c:if>
                <c:if test="${post.exPart=='1'}">
                                     복부  
                </c:if>
                <c:if test="${post.exPart=='2'}">
                                     상체  
                </c:if>
                <c:if test="${post.exPart=='3'}">
                                     하체  
                </c:if>
                <c:if test="${post.exPart=='4'}">
                                    스트레칭  
                </c:if>                                                                
              </div>  
              
            <p class="mb-4">${post.contents}</p>
             
             
            
             <div class="text-center border-bottom border-top margin-ten padding-four no-margin-bottom favorite">
                <div class="favoriteListHere">
                   <div style="float: left; width: 33%;" class="like">
                   <img src="../resources/images/emptyHeart.png" width="60px" class="likeImage" onclick="emptyHeart()">
                   </div>
                   <div style="float: left; width: 33%;" class="interest">
                   <img src="../resources/images/emptyStar.png"  width="60px" class="interestImage" onclick="emptyStar()">
                   </div>
                   <div style="float: left; width: 33%;" class="claim">
                   <img src="../resources/images/fullSiren.png"  width="60px" class="claimImage" onclick="fullSiren()">
                   </div>
                </div>
            
            <p><a href="#" class="btn btn-primary pill px-4"  data-param="${post.postNo }">수정</a>
            <a href="#" class="btn btn-primary pill px-4">삭제</a></p>
          </div>
        </div>
      </div>
    

   <jsp:include page="/reply/listReply.jsp" /> 
   </div>
</div>
</body>
</html>