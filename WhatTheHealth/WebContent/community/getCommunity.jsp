<%@ page pageEncoding="UTF-8" contentType="text/html; charset=UTF-8"%> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
   
   <title>커뮤니티 게시물 조회페이지</title>
   
   <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
   
    <script src="../resources/js/jquery-3.3.1.min.js"></script>
   
   	<!-- sweetalert -->
	<script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>	
   
   <style>
   
   	.giyong{
   	/* 	width: 63%; */
   		margin-top : 5em;
   		padding : 3em;
   		border : 1px solid gray;
   		border-radius : 15px;
   		text-align : center;
   		margin-bottom : 5em;
   	}
   	
   	.contents{
   		display : block;
   		text-align : left;
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
   	
	.like and view{text-align:right;}
	   	
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
 
 	.imagelocation{
 		margin-top:-104%;
 		margin-left:70%
 	}
 	.right{margin-left:37.7%;margin-top:-41%}   	
   	
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
                  $(".likeCount").html("<li><span class='likeCount'>좋아요 수  : "+likeCount+"</span></li>");        
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
                      
                      $(".likeCount").html("<li><span class='likeCount'>좋아요 수  : "+likeCount+"</span></li>");        
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
   <!-- <div class="site-section" align="center"> -->
      <div class="container">
      
      	<div class="row">
       		<div class="col-lg-8">
       	
      		<input type="hidden" name="postNo" value="${post.postNo }"/>
      
        <div class="giyong">
          	<h4 >${post.title}</h4>
          	<ul class="like and view">
          		<li><span class="likeCount">좋아요 수  : ${post.likeCount}</span></li>
          		<li><span>&nbsp; 조회 수 : ${post.clickCount}</span></li>
          	</ul>
 
            <div class="contents" style="margin-top:-12%;" >
				<p>${post.contents}</p>
           		 <%-- <p class="mb-4">${post.contents}</p> --%>
           	</div>
               <!-- 다음맵지도 -->
              <c:if test="${post.coordinate!=null}">
	             <jsp:include page="/common/getMap.jsp" /> 
              </c:if>

		<div class="Kimgiyong">                        
             <!-- <div class="text-center border-bottom border-top margin-ten padding-four no-margin-bottom favorite"> -->
                
                <div class="favoriteListHere" >
                   <div style="float: left; width: 47%;" class="like" >
                   <img src="../resources/images/emptyHeart.png" width="60px" id = "likeImage" class="likeImage" alt="하뚜" onclick="emptyHeart()">
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
	            		<a href="#" class="btn btn-primary pill px-4">수정</a>&nbsp;
	            		<a href="#" class="btn btn-primary pill px-4">목록으로</a>&nbsp;
	            		<a href="#" class="btn btn-primary pill px-4">삭제</a>
	            	</p>
	            </div>
            </c:if>
          </div>
          
          <div class="giyongInput">
           <jsp:include page="/reply/listReply.jsp" />
          </div>
           
        
      </div>

	 <ul class="imagelocation">
	   <li>
	 		<img src="/resources/images/post/post_BMI.png" alt="Image" class="postImage" id="bmiLocation">
	   </li>
	   <li class="right">
	 		<img src="/resources/images/post/post_Calorie.jpg" alt="Image" class="postImage" id="calorieLocation" >
	   </li>
	   <li>
	 		<img src="/resources/images/post/post_HistroyChart.png" alt="Image" class="postImage" id="historyChartLocation">
	   </li>
	   <li class="right">
	 		<img src="/resources/images/post/post_Schedule.png" alt="Image" class="postImage" id="scheduleLocation" >
	   </li>
	</ul>
	
	</div>
	
</div>

</div>

  

</body>
</html>