<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   
   <title>식단 커뮤니티 게시물 조회페이지</title>
   
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
    
    <link rel="stylesheet"  href="../resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet"  href="../resources/fonts/posting/font/horan.css">
    <link rel="stylesheet" href="../resources/css/aos.css">
    <link rel="stylesheet" href="../resources/css/style.css">
   
   <script type="text/javascript">
   
  /*  $( function (){
	   alert(${user.userId});
	   alert(${meeting.post.userId});
   }); */



    function favoriteList(){
           $.ajax({
               url : '/favorite/json/listFavorite/'+'${meeting.post.postNo}',
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
            url : '/favorite/json/addLike/'+'${meeting.post.postNo}',
            type : "GET",
            success : function(data){
                if(data == 1) {
                  favoriteList(); 
                  }
               }            
            });
      }
    
    function fullHeart(){
       
         $.ajax({
               url : '/favorite/json/deleteLike/'+'${meeting.post.postNo}',
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
               url : '/favorite/json/addInterest/'+'${meeting.post.postNo}',
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
                  url : '/favorite/json/deleteInterest/'+'${meeting.post.postNo}',
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
                  url : '/claim/json/addClaim/'+'${meeting.post.postNo}',
                  type : "GET",
                  success : function(data){
                     }
                  });
            }
          
       
       $( function (){
          $( "a[href='#' ]:contains('수정')").on("click", function(){
               self.location="/dietCom/updateDietCom?postNo=${post.postNo}"
            });
          $( "a[href='#' ]:contains('삭제')").on("click", function(){
               self.location="/dietCom/deleteDietCom?postNo=${post.postNo}"
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
   <div class="site-section bg-light">
       <div class="container"> 
      
        <!-- <div class="row align-items-center"> -->
        <div class="col-md-12 col-lg-8 mb-5">
          <!-- <div class="col-md-10 col-lg-5 mb-5 mb-lg-0"> -->
            <h4 class="mb-3">  ${meeting.post.title} </h4>
             <small>좋아요 수  : ${meeting.post.likeCount}</small> 
             <small>조회 수 : ${meeting.post.clickCount}</small>       
             <div class="row form-group">
			 	<div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">참가비</label>
                  </div>
                  <div class="col-md-7 mb-5 mb-md-0">
                	${meeting.entryfee}원
                </div>     
              </div> 
              
                  <div class="row form-group">
                <div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">선금 </label>
                   </div>         
                <div class="col-md-7 mb-5 mb-md-0">
                	${meeting.depoAmount}원
                </div>    
                </div>    
               
                <div class="row form-group">
				<div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">선금계좌</label>
                </div>   
                <div class="col-md-2 mb-5 mb-md-0">
                	[은행명]
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.depoBank}
                </div> 
                <div class="col-md-2 mb-5 mb-md-0">
                	[예금주]
                </div>    
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.depoAccHolder}
                </div> 
                  </div>
                  
                  <div class="row form-group">
                  <div class="col-md-3 mb-5 mb-md-0">
                
                </div>   
                   <div class="col-md-2 mb-5 mb-md-0">
                	[계좌번호]
                </div> 
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.depoAccount} 
                </div> 
                </div>
                
                <div class="row form-group">
				<div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">인원정원</label>
                </div>   
                <div class="col-md-2 mb-5 mb-md-0">
                	[최소인원]
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.minParty} 명
                </div> 
                <div class="col-md-2 mb-5 mb-md-0">
                	[최대인원]
                </div>    
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.maxParty} 명
                </div> 
                  </div>
                  
                  <div class="row form-group">
				<div class="col-md-3 mb-5 mb-md-0">
                  <label class="font-weight-bold" for="fullname">시간/장소</label>
                </div>   
                <div class="col-md-2 mb-5 mb-md-0">
                	[모임시간]
                </div>    
                <div class="col-md-2 mb-5 mb-md-0">
                	${meeting.meetTime}
                </div> 
                <div class="col-md-2 mb-5 mb-md-0">
                	[모임장소]
                </div>    
                <div class="col-md-3 mb-5 mb-md-0">
                	${meeting.post.locationTagName}
                </div> 
                  </div>
                  
                
                 <p class="col-md-12 mb-4">${meeting.post.contents}</p>
         
           
           
            
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
                <c:if test = "${user.userId == meeting.post.userId}">

            <p><a href="#" class="btn btn-primary pill px-4">수정</a>
            <a href="#" class="btn btn-primary pill px-4">삭제</a></p>
              </c:if >
              </div>
              
               
            </div>
            
            
          </div>
         </div> 
      </div>


   <jsp:include page="/reply/listReplyMeeting.jsp" /> 

</body>
</html>