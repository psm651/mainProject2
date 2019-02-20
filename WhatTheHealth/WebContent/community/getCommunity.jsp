<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   
   <title>커뮤니티 게시물 조회페이지</title>
   
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
    
    <!-- div 때문에 인클루드 -->
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Nunito+Sans:200,300,400,700,900|Roboto+Mono:300,400,500"> 
    <link rel="stylesheet" href="../resources/fonts/icomoon/style.css">
    
     <link rel="stylesheet" href="../resources/css/bootstrap.min.css">
    <link rel="stylesheet" href="../resources/css/magnific-popup.css">
    <link rel="stylesheet" href="../resources/css/jquery-ui.css">
    <link rel="stylesheet" href="../resources/css/owl.carousel.min.css">
    <link rel="stylesheet" href="../resources/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="../resources/css/animate.css">
    
    <link rel="stylesheet"  href="../resources/fonts/flaticon/font/flaticon.css">
    <link rel="stylesheet" href="../resources/css/aos.css">
    <link rel="stylesheet" href="../resources/css/style.css">

   
     <!-- sweetalert -->
   <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>   
   <style>
   #floatMenu {
      position: absolute;
      width: 10%;
      height: 30vw;
      /* height: 450px; */
      /* right: 200px; */
      right:20%; 
      padding:0;
      margin:0;
      bottom: 25px; 
      text-align:center;
      background-color: #FFFFFF;
      color: #000000;
      border:1px solid;
      font-size: 15px;
      overflow: hidden;
   }
   
      .postHere{
      /*    width: 63%; */
         padding : 3em; 
         border : 1px solid gray;
         border-radius : 15px;
         text-align : center;
         margin-bottom : 5em;
      }
      
      #map{
         display : block;
         float: center;
      }
      
      .contents{
         /* display : block; */
         text-align : left;
         font-size : 18px;
      }
 
       .postHere li{
         /* display : block; */
         list-style-type : none;
         float : left;
      } 

      .replyInclude{
         text-align : left;
      } 
      
      h4{
         display: block;
         font-size: 24px;
       padding-bottom: 8px;
       margin-bottom: 20px;
       border-bottom: 2px solid #5d5d5d;
       line-height: 1.3em;
       color: #2e2e2e;
       font-weight: 600;
       text-align:left
       
      }       
      
    .likeandview{
      border-bottom: 1px solid #DCDCDC; 
      list-style-type: none; 
      float: right; 
      padding-left: 5px;  
      color: gray; 
      font-size: 15px; 
    }
          
      .postImage{
       width :110px;
       height: 120px;
     padding: 3px;
       border : 1px solid gray;
         
      } 
            
      .imagelocation li{
         width:230px;
         hegiht:245px;
         
       padding-right: 0px;
         padding-bottom: 0px;
       padding-left: 0px;
       list-style-type : none;

      }
      
      .ytp-cued-thumbnail-overlay-image{
         
      }
 
    .imagelocation{
       margin-top:-104%;
       margin-left:70%
    }
    .right{margin-left:37.7%;margin-top:-41%}      
    
 	#user_image{ 
		max-width:120%;
    	border-radius: 100px;
	}
      
   </style>
   <script type="text/javascript">
   $(document).ready(function() {
	   function imageClick(e){

		   	  var userId = e.getAttribute("paramid");

		   	  popWin 
						= window.open("/user/getUserMeeting?userId="+userId,
													"popWin", 
													"left=300,top=200,width=1000%,height=700%,marginwidth=0,marginheight=0,"+
													"scrollbars=no,scrolling=no,menubar=no ");  
		    } 
	  
       
      }); 
   
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
                              $(".likeImage").remove();
                              a += '<img src="../resources/images/fullHeart.png"  width="30px" class="likeImage" onclick="fullHeart()">';
                              
                           }else if(list.favoriteType == '1'){
                              $(".interestImage").remove();
                              b += '<img src="../resources/images/fullStar.png" width="30px" class="interestImage" onclick="fullStar()" >';
                               
                           }
                        }
                   });
                    if(a != ''){
                       $("#like").append(a); 
                    }
                    if(b != ''){
                       $("#interest").append(b);
                    }
               }
           });
       } 
    
   
    $(document).ready(function(){
       favoriteList(); 
    });

    var likeCount = '${post.likeCount}';
    
    function emptyHeart(){
      $.ajax({
            url : '/favorite/json/addLike/'+'${post.postNo}',
            type : "GET",
            success : function(data){
                if(data == 1) {
                  favoriteList(); 
                  likeCount++;
                  $(".likeCount").html("<li><span class='likeCount'><img src='../resources/images/emptyHeart.png' width='17px'  style='opacity: 0.7'>&nbsp;<b>"+likeCount+"</b></span></li>");        
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
                      a += '<img src="../resources/images/emptyHeart.png"  width="30px" class="likeImage" onclick="emptyHeart()">';
                             $(".likeImage").remove();
                      likeCount--;
                      
                      $(".likeCount").html("<li><span class='likeCount'><img src='../resources/images/emptyHeart.png' width='17px'  style='opacity: 0.7'>&nbsp;<b>"+likeCount+"</b></span></li>");        
                     }
                   $("#like").append(a); 
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
                         a += '<img src="../resources/images/emptyStar.png"  width="30px" class="interestImage" onclick="emptyStar()">';
                                $(".interestImage").remove();
                        }
                      $("#interest").append(a); 
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
          
          $( "a[href='#' ]:contains('목록으로')").on("click", function(){
        	
             if("${post.category}" == '2'){
            
                   self.location="/community/listExCom"
             }else if("${post.category}" == '3'){
          
                self.location="/community/listDietCom"
             }
           });
          
          $( "a[href='#' ]:contains('삭제')").on("click", function(){
              if("${post.category}" == '2'){
                  self.location="/community/deleteExCom?postNo=${post.postNo}"
               }else if("${post.category}" == '3'){
                     self.location="/community/deleteDietCom?postNo=${post.postNo}"
               }
            }); 
        });
       
       
       
       
       
   </script>
   
  <style>
  label {
    display: inline-block;
    width: 5em;
  }
  </style>
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
      
         <div class="row">
         <div class="col-md-12 col-lg-12 mb-5">
          <div class="container">
         <div class="postHere"> 
         
             
          
            <input type="hidden" name="postNo" value="${post.postNo }"/>
      
       
     
          
             <h4 ><b>${post.title}</b></h4>
             <ul class="likeandview" >
                <li><span>
            <c:if test="${post.userImage != null and post.userImage != '' }">
				<img src = "/resources/images/userImage/${post.userImage}" align="middle" height="30px"  width="30px" id="user_image" paramid = "${post.userId}" onclick = "imageClick(this);"/>
			</c:if>
			<c:if test="${post.userImage == null or post.userImage == '' }">
			<img src = "/resources/images/userImage/defaultUser.png" align="middle" height="30px" id="user_image" paramid = "${post.userId}"  onclick = "imageClick(this);"/>
			</c:if>
            <b>${post.nickName}</b>&nbsp;&nbsp; &nbsp;</span></li>
                <li><span><b> <img src="../resources/images/dateImage.png" width="25px"  style="opacity: 0.7">&nbsp;${post.postDate}</b>&nbsp;&nbsp; &nbsp;</span></li><!-- 등록일자 이미지 -->
                <li><span class="likeCount"  ><b><img src="../resources/images/emptyHeart.png" width="25px"  style="opacity: 0.7">&nbsp;${post.likeCount}</b></span></li><!-- 좋아요수 이미지 -->
                <li><span>&nbsp;&nbsp;&nbsp;<b><img src="/resources/images/eyeImage.png" height="23px"  style="margin-bottom: 2px; opacity: 0.7">&nbsp;${post.clickCount}</b></span></li><!-- 조회수 이미지 -->
             </ul>
             
           <div style="margin-top:40px;  background-color:white; padding:2em;" > 
            <div class="contents"  >
            <div class="row">
            <div class="col-md-2 mb-5" ></div>
            <div class="col-md-8 mb-5" >
                   
 		<p>${post.contents}</p> 
              </div>
               <div class="col-md-2 mb-5" ></div>
              </div>
              </div>
               <!-- 다음맵지도 -->
              <c:if test="${post.coordinate!=null}">
              <b style="font-size: 17px; float: left; border-bottom:2px solid #DCDCDC; padding-left: 10px; margin-top: 5px;"><img src="../resources/images/map/marker-480.png" width="25px"  style="opacity: 0.7">위치 &nbsp;</b>
              <div style="float:center; background-color: #EDEDED; padding: 2em; padding-left:2.5em; border-radius:15px 50px;">
                <jsp:include page="/common/getMap.jsp" /> 
              </div>
              </c:if>
              </div>
             
     
                <div class = "row"  style="margin-top:20px; " >
               	   <div class="col-md-8 mb-5" >
                   </div>
                   <div class="col-md-4 mb-5"    >
                    <a href="#" class="btn btn-primary pill px-4"  style="font-size:13px; height: 30px; float:right;"><b>목록으로</b></a>
               <c:if test = "${user.userId == post.userId}">
                    <a href="#" class="btn btn-primary pill px-4" style="font-size:13px; height: 30px; float:center;"><b>삭제</b></a>
                     <a href="#" class="btn btn-primary pill px-4"  style="font-size:13px; height: 30px; float:left;"><b>수정</b></a>
               </c:if> 
                    
               	</div>
               
               </div>
                
                
                 <div class="row " >
                <div class="col-md-3 mb-5" >
                   </div>
              
                   <div  class="col-md-2 "  style="border: 3px solid #DCDCDC; border-radius : 15px;  padding: 7px;" id="like" >
                   <img src="../resources/images/emptyHeart.png" width="30px" id = "likeImage" class="likeImage" alt="하뚜" onclick="emptyHeart()">
                   </div>
                   <div class="col-md-2"   style="border: 3px solid #DCDCDC; border-radius : 15px;  padding: 7px;" id="interest">
                   <img src="../resources/images/emptyStar.png"  width="30px" class="interestImage" onclick="emptyStar()">
                   </div>
                   <div  class="col-md-2"  style="border: 3px solid #DCDCDC; border-radius : 15px; padding: 7px;" id="claim">
                   <img src="../resources/images/fullSiren.png"  width="30px" class="claimImage" onclick="fullSiren()">
                   </div>
                   <div class="col-md-3 mb-5" >
                   </div>
                  </div>
               
              
         
           <div class="replyInclude">
           <jsp:include page="/reply/listReply.jsp" />
           </div>

       
          </div>
          </div> 
   </div>
    
     
     
   </div>
   
   </div>
   
</div>

</div>

  

</body>
</html>